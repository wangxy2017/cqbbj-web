// JavaScript代码区域
layui.use(["table", "layer"], function () {
    var table = layui.table;
    var layer = layui.layer;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            money: 0.00
        },
        methods: {
            /**
             * 加载数据
             */
            initTable: function () {
                table.render({
                    elem: "#divideList",
                    id: "divideList",
                    url: "/moneyDetail/queryMyDivide",
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
                        , {field: 'start', title: '搬出地址'}
                        , {field: 'end', title: '搬入地址'}
                        , {
                            field: 'endTime', title: '完成时间', sort: true, templet: function (d) {
                                return formatDateTime(d.endTime);
                            }
                        }
                        , {field: 'money', title: '提成金额', align: "center", width: 120}
                        , {
                            field: 'clean_time', title: '结算时间', sort: true, templet: function (d) {
                                return formatDateTime(d.clean_time);
                            }
                        }
                    ]]
                });
            }
        },
        mounted: function () {
            // 查询余额
            this.$http.post("/employee/queryMoney", {}, {emulateJSON: true}).then(function (res) {
                if (res.body.code == 1) {
                    this.money = res.body.data;
                } else {
                    layer.msg("查询失败");
                }
            }, function (res) {
                layer.msg("服务器请求异常");
            });
            // 加载提成列表
            this.initTable();
        }
    });
});