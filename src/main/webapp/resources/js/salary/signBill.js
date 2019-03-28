// JavaScript代码区域
layui.use(["table", "layer", "laydate", "jquery"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var laydate = layui.laydate;
    var $ = layui.$;
    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            order_no: "",
            name: "",
            status: 0,
        },
        methods: {
            /**
             * 初始化日历
             */
            initCalander: function () {
                //开始时间
                laydate.render({
                    elem: '#startTime',
                    type: "datetime"
                });
                //结束时间
                laydate.render({
                    elem: '#finishTime',
                    type: "datetime"
                });
            },
            search: function () {
                table.reload("signBillList", {
                    where: {
                        "order_no": main.order_no,
                        "name": main.name,
                        "status": main.status,
                        "startTime": $("#startTime").val(),
                        "finishTime": $("#finishTime").val()
                    }
                });
            },
            /**
             * 初始化表格
             */
            initTable: function () {
                /**
                 * 加载数据
                 */
                table.render({
                    elem: "#signBillList",
                    id: "signBillList",
                    url: "/signBill/queryPageList",
                    page: true,
                    where: {"status": 0},
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
                        , {field: 'order_no', title: '订单号'}
                        , {field: 'name', title: '客户名称'}
                        , {field: 'start', title: '搬出地址'}
                        , {field: 'end', title: '搬入地址'}
                        , {
                            field: 'endTime', title: '完成时间', sort: true, templet: function (d) {
                                return formatDateTime(d.endTime);
                            }
                        }
                        , {field: 'price', title: '订单价格', align: "center"}
                        , {
                            field: 'status', title: '收款状态', align: "center", templet: function (d) {
                                return d.status == 0 ? "<span style='color: #FF5722'>未收款</span>" : "<span style='color: #009688'>已收款</span>";
                            }
                        }
                        , {field: 'receiveMoney', title: '收款金额', align: "center"}
                        , {field: 'emp_name', title: '收款人', align: "center"}
                        , {title: '操作', fixed: 'right', align: 'center', toolbar: '#options', width: 120}
                    ]]
                });
                // 监听工具条
                table.on('tool(signBillList)', function (obj) {
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值

                    // 收款
                    if (layEvent === 'receive') {
                        if (data.status == 1) {
                            layer.msg("该订单已收款，无需操作");
                            return;
                        }
                        layer.open({
                            type: 1,
                            content: $('#receiveForm'),
                            area: ["480px", "360px"],
                            title: "收款",
                            btn: ["确认", "取消"],
                            success: function (layero, index) {
                                // 重置表单
                                $("#id").val(data.id);
                                $("#order_no").val(data.order_no);
                                $("#receiveMoney").val("");
                                $("#receiveText").val("");
                            },
                            yes: function (index, layero) {
                                // 验证金额
                                if ($("#receiveMoney").val() == "") {
                                    layer.msg("请填写金额");
                                    return;
                                }
                                // 提交数据
                                main.$http.post('/signBill/receive',
                                    {
                                        "id": $("#id").val(),
                                        "order_no": $("#order_no").val(),
                                        "receiveMoney": $("#receiveMoney").val(),
                                        "receiveText": $("#receiveText").val()
                                    },
                                    {emulateJSON: true}).then(function (res) {
                                    // console.log(res.body);
                                    if (res.body.code == 1) {
                                        layer.msg("操作成功");
                                        // 刷新列表
                                        layer.close(index);
                                        table.reload("signBillList");
                                    } else {
                                        layer.msg("操作失败");
                                    }
                                }, function (res) {
                                    layer.msg("服务器请求异常");
                                });
                            }
                        });
                    }
                });
            },
            /**
             * 导出
             */
            download: function () {
                layer.confirm("导出数据属于敏感操作，确认继续吗？", function (index) {
                    layer.close(index);
                    window.location.href = "/signBill/download?name=" + main.name +
                        "&status=" + main.status +
                        "&order_no=" + main.order_no +
                        "&startTime=" + $("#startTime").val() +
                        "&finishTime=" + $("#finishTime").val();
                });
            }
        },
        mounted: function () {
            // 初始化表格
            this.initTable();
            // 初始化日历插件
            this.initCalander();
        }
    });
});