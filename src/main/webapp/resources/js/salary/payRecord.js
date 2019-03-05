// JavaScript代码区域
layui.use(["table", "layer", "laydate"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var laydate = layui.laydate;
    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            order_no: "",
            trans_no: "",
            payWay: "",
            startTime: "",
            endTime: ""
        },
        methods: {
            /**
             * 初始化日历
             */
            initCalander: function () {
                //保险到期
                laydate.render({
                    elem: '#startTime',
                    type: "datetime",
                    value: new Date(main.startTime)
                });
                //年审到期
                laydate.render({
                    elem: '#endTime',
                    type: "datetime",
                    value: new Date(main.endTime)
                });
            },
            search: function () {
                table.reload("payRecordList", {
                    where: {
                        "order_no": main.order_no,
                        "trans_no": main.trans_no,
                        "payWay": main.payWay,
                        "startTime": main.startTime,
                        "endTime": main.endTime
                    }
                });
            }

        }
    });

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
            , {field: 'cust_no', title: '客户名称'}
            , {field: 'payWay', title: '支付类型'}
            , {field: 'payMoney', title: '支付金额'}
            , {field: 'trans_no', title: '交易号'}
            , {field: 'emp_no', title: '收款人'}
            , {
                field: 'payTime', title: '支付时间', sort: true, templet: function (d) {
                    return formatDateTime(d.payTime);
                }
            }
        ]]
    });
});