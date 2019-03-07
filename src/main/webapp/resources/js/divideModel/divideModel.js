// JavaScript代码区域
layui.use(["table", "layer"], function () {
    var table = layui.table;
    var layer = layui.layer;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            name: ""
        },
        methods: {
            /**
             * 增加结算模板
             */
            addDivide: function () {
                window.location.href = "/divideModel/divideModelAdd"
            },
            /**
             * 搜索
             */
            search: function () {
                table.reload("divideList", {
                    where: {
                        "name": main.name
                    }
                });
            },
            /**
             * 初始化表格
             */
            initTable: function () {
                table.render({
                    elem: "#divideList",
                    id: "divideList",
                    url: "/divideModel/queryPageList",
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
                        , {field: 'name', title: '模式名称'}
                        , {
                            field: 'content',
                            title: '详情',
                            align: 'center',
                            templet: function (d) {
                                var html = "";
                                for (var i = 0; i < d.details.length; i++) {
                                    var detail = d.details[i];
                                    html += "【" + detail.name + "：";
                                    html += detail.type == 0 ? "工时提成 - " + detail.value + "元/小时" : "比例提成 - " + detail.value + "%";
                                    html += " ：";
                                    html += detail.isAll == 0 ? "全额提成" : "扣除开支提成";
                                    html += "】";
                                }
                                return html;
                            }
                        }
                        , {field: 'is_disabled', title: '是否启用'}
                        , {
                            field: 'createTime', title: '创建时间', templet: function (d) {
                                return formatDateTime(d.createTime);
                            }
                        }
                        , {title: '操作', fixed: 'right', align: 'center', toolbar: '#options', width: 120}
                    ]]
                });
                // 监听工具条
                table.on('tool(divideList)', function (obj) {
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值

                    // 删除模板
                    if (layEvent === 'delete') {
                        layer.confirm("确认删除模板吗？", function () {
                            // 请求后台，取消订单
                            main.$http.post('/divideModel/delete', {"id": data.id}, {emulateJSON: true}).then(function (res) {
                                console.log(res.body);
                                if (res.body.code == 1) {
                                    layer.msg("删除成功");
                                    // 刷新列表
                                    table.reload("divideList");
                                } else {
                                    layer.msg("删除失败");
                                }
                            }, function (res) {
                                layer.msg("服务器请求异常");
                            });
                        });
                    }
                    // 修改订单
                    if (layEvent === 'update') {

                    }
                });
            }
        },
        mounted: function () {
            var that = this;
            // 初始化表格
            that.initTable();
        }
    });
});