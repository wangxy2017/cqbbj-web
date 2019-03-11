// JavaScript代码区域
layui.use(["table", "layer", "laydate", "jquery", "form"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var laydate = layui.laydate;
    var form = layui.form;
    var $ = layui.$;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            inten_no: "",
            name: ""
        },
        methods: {
            /**
             * 新增意向
             */
            addOrder: function () {
                window.location.href = "/intentionOrder/intentionOrderAdd";
            },
            updateOrder: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus('orderList');
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行进行修改");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("只能同时操作一行数据");
                    return;
                }
                // 跳转修改界面
                window.location.href = "/intentionOrder/intentionOrderUpdate?id=" + checkStatus.data[0].id;
            },
            /**
             * 搜索
             */
            search: function () {
                table.reload("orderList", {
                    where: {
                        "name": main.name,
                        "inten_no": main.inten_no,
                        "createTime1": $("#createTime1").val(),
                        "createTime2": $("#createTime2").val()
                    }
                });
            },
            /**
             * 初始化跟进表单
             */
            initForm: function () {
                laydate.render({
                    elem: '#time',
                    type: "datetime"
                });
                //监听提交
                form.on('submit(addFollow)', function (data) {
                    // 请求后台，跟进订单
                    main.$http.post('/intentionFollow/save', data.field, {emulateJSON: true}).then(function (res) {
                        // console.log(res.body);
                        if (res.body.code == 1) {
                            layer.msg("跟进成功");
                            //关闭自身
                            var index = layer.getFrameIndex(window.name);
                            layer.close(index);
                            // 刷新列表
                            table.reload("orderList");
                        } else {
                            layer.msg("跟进失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                    return false;
                });
            },
            /**
             * 初始化表格
             */
            initTable: function () {
                table.render({
                    elem: "#orderList",
                    id: "orderList",
                    url: "/intentionOrder/queryPageList",
                    page: true,
                    parseData: function (res) {
                        return {
                            "code": res.code,
                            "msg": res.msg,
                            "count": res.data.total,
                            "data": res.data.list
                        };
                    },
                    request: {
                        pageName: "pageNum",
                        limitName: "pageSize"
                    },
                    response: {
                        statusCode: 1
                    },
                    cols: [[
                        {type: 'checkbox'}
                        , {field: 'inten_no', title: '订单编号'}
                        , {field: 'name', title: '客户名称'}
                        , {field: 'phone', title: '客户电话'}
                        , {
                            field: 'source', title: '客户来源', templet: function (d) {
                                return d.source == 0 ? "电话" : "网络";
                            }
                        }
                        , {
                            field: 'type', title: '客户类型', templet: function (d) {
                                return d.type == 0 ? "个人" : "公司";
                            }
                        }
                        , {
                            field: 'status', title: '意向程度', templet: function (d) {
                                var text = "";
                                switch (d.status) {
                                    case 0:
                                        text = "只询问";
                                        break;
                                    case 1:
                                        text = "有意向";
                                        break;
                                    case 2:
                                        text = "能成交";
                                        break;
                                    case 3:
                                        text = "已放弃";
                                        break;
                                }
                                return text;
                            }
                        }
                        , {
                            field: 'is_follow', title: '跟进状态', templet: function (d) {
                                var text = "";
                                if (d.is_follow == 0) {
                                    text = "<span style='color: #FF5722'>未跟进</span>";
                                } else {
                                    text = "<span style='color: #009688'>已跟进</span>";
                                }
                                return text;
                            }
                        }
                        , {
                            field: 'createTime', title: '创建时间', templet: function (d) {
                                return formatDateTime(d.createTime);
                            }
                        }
                        , {title: '操作', fixed: 'right', align: 'center', toolbar: '#options', width: 200}
                    ]]
                });
                // 初始化时间插件
                laydate.render({
                    elem: '#createTime1',
                    type: "datetime"
                });
                laydate.render({
                    elem: '#createTime2',
                    type: "datetime"
                });
                // 监听工具条
                table.on('tool(orderList)', function (obj) {
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值

                    // 查看订单
                    if (layEvent === 'view') {
                        layer.open({
                            type: 2,
                            content: "/intentionOrder/orderView?id=" + data.id,
                            area: ["700px", "550px"],
                            title: "意向订单详情"
                        });
                    }
                    // 跟进
                    if (layEvent === 'follow') {
                        layer.open({
                            type: 1,
                            title: "跟进",
                            content: $('#intentionFollow'),
                            area: ["470px", "300px"],
                            success: function () {
                                // 初始化表单
                                $("#intentionFollow")[0].reset();
                                $("#inten_no").val(data.inten_no);
                                $("#inten_id").val(data.id);
                            }
                        });
                    }
                    // 作废订单
                    if (layEvent === 'cancel') {
                        layer.prompt({
                                formType: 2,
                                title: '作废原因',
                                area: ['360px', '160px']
                            },
                            function (value, index, elem) {
                                layer.close(index);
                                // 请求后台，取消订单
                                main.$http.post('/intentionOrder/cancel', {
                                    "id": data.id,
                                    "reason": value,
                                    "inten_no": data.inten_no
                                }, {emulateJSON: true}).then(function (res) {
                                    // console.log(res.body);
                                    if (res.body.code == 1) {
                                        layer.msg("操作成功");
                                        // 刷新列表
                                        table.reload("orderList");
                                    } else {
                                        layer.msg("操作失败");
                                    }
                                }, function (res) {
                                    layer.msg("服务器请求异常");
                                });
                            }
                        );
                    }
                });
            }
        },
        mounted: function () {
            var that = this;
            // 初始化表格
            that.initTable();
            that.initForm();
        }
    });
});