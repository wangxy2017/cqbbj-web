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
            is_clean: ""
        },
        methods: {
            /**
             * 初始化日历
             */
            initCalander: function () {
                //开始时间
                laydate.render({
                    elem: '#endTime1',
                    type: "datetime"
                });
                //结束时间
                laydate.render({
                    elem: '#endTime2',
                    type: "datetime"
                });
            },
            search: function () {
                table.reload("financeCleanList", {
                    where: {
                        "order_no": main.order_no,
                        "name": main.name,
                        "is_clean": main.is_clean,
                        "endTime1": $("#endTime1").val(),
                        "endTime2": $("#endTime2").val()
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
                    elem: "#financeCleanList",
                    id: "financeCleanList",
                    url: "/financeClean/queryPageList",
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
                        , {field: 'receiveMoney', title: '实际收款', align: "center"}
                        , {
                            field: 'costMoney', title: '支出费用', align: "center", templet: function (d) {
                                return isEmpty(d.costMoney) ? "<span style='color:#FF5722'>未结算</span>" : d.costMoney;
                            }
                        }
                        , {
                            field: 'money', title: '收款员', templet: function (d) {
                                return isEmpty(d.moneyEmps) || d.moneyEmps.length == 0 ? "" : d.moneyEmps[0].emp_name;
                            }
                        }
                        , {
                            field: 'drive', title: '司机', templet: function (d) {
                                var text = "";
                                for (var i = 0; i < d.driveEmps.length; i++) {
                                    var emp = d.driveEmps[i];
                                    text += emp.emp_name;
                                    if (i != d.driveEmps.length - 1) text += "，";
                                }
                                return text;
                            }
                        }
                        , {
                            field: 'move', title: '搬运工', templet: function (d) {
                                var text = "";
                                for (var i = 0; i < d.moveEmps.length; i++) {
                                    var emp = d.moveEmps[i];
                                    text += emp.emp_name;
                                    if (i != d.moveEmps.length - 1) text += "，";
                                }
                                return text;
                            }
                        }
                        , {
                            field: 'air', title: '空调工', templet: function (d) {
                                var text = "";
                                for (var i = 0; i < d.airEmps.length; i++) {
                                    var emp = d.airEmps[i];
                                    text += emp.emp_name;
                                    if (i != d.airEmps.length - 1) text += "，";
                                }
                                return text;
                            }
                        }
                        , {title: '操作', fixed: 'right', align: 'center', toolbar: '#options', width: 120}
                    ]]
                });
                // 监听工具条
                table.on('tool(financeCleanList)', function (obj) {
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值

                    // 结算
                    if (layEvent === 'clean') {
                        layer.open({
                            type: 2,
                            content: "/finance/cleanDetail?id=" + data.id,
                            area: ["700px", "550px"],
                            anim: 5,
                            title: "结算方式",
                            success:function (layero, index) {
                                console.log(layero, index);
                            }
                        });
                    }
                    // 查看
                    if (layEvent === 'view') {
                        layer.open({
                            type: 2,
                            content: "/order/orderView?id=" + data.id,
                            area: ["700px", "550px"],
                            anim: 5,
                            title: "订单详情"
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
                    window.location.href = "/financeClean/download?name=" + main.name +
                        "&order_no=" + main.order_no +
                        "&is_clean=" + main.is_clean +
                        "&endTime1=" + $("#endTime1").val() +
                        "&endTime2=" + $("#endTime2").val();
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