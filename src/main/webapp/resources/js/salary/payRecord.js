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
            trans_no: "",
            payWay: "",
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
                    elem: '#endTime',
                    type: "datetime"
                });
            },
            search: function () {
                table.reload("payRecordList", {
                    where: {
                        "order_no": main.order_no,
                        "trans_no": main.trans_no,
                        "payWay": main.payWay,
                        "startTime": $("#startTime").val(),
                        "endTime": $("#endTime").val()
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
                    elem: "#payRecordList",
                    id: "payRecordList",
                    url: "/payRecord/queryPageList",
                    page: true,
                    where: {},
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
                        , {field: 'custName', title: '客户名称'}
                        , {
                            field: 'payWay', title: '支付类型', templet: function (d) {
                                var text = "";
                                switch (d.payWay) {
                                    case 0:
                                        text = "现金";
                                        break;
                                    case 1:
                                        text = "微信";
                                        break;
                                    case 2:
                                        text = "欠条";
                                        break;
                                }
                                return text;
                            }
                        }
                        , {field: 'payMoney', title: '支付金额'}
                        , {field: 'trans_no', title: '交易号'}
                        , {field: 'empName', title: '收款人'}
                        , {
                            field: 'payTime', title: '支付时间', sort: true, templet: function (d) {
                                return formatDateTime(d.payTime);
                            }
                        }
                    ]]
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