// JavaScript代码区域
layui.use(["table", "layer"], function () {
    var table = layui.table;
    var layer = layui.layer;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {},
        methods: {},
        mounted: function () {
            /**
             * 加载数据
             */
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
                    , {field: 'money', title: '提成金额', align: "center",width:120}
                    , {
                        field: 'clean_time', title: '结算时间', sort: true, templet: function (d) {
                            return formatDateTime(d.clean_time);
                        }
                    }
                ]]
            });
        }
    });
});