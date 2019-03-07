// JavaScript代码区域
layui.use(["table", "layer", "laydate","jquery"], function () {
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
            status: "",
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
                table.reload("signBillList", {
                    where: {
                        "order_no": main.order_no,
                        "name": main.name,
                        "status": main.status,
                        "startTime": $("#startTime").val(),
                        "endTime": $("#finishTime").val()
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
                        , {field: 'name', title: '客户名称'}
                        , {field: 'start', title: '搬出地址'}
                        , {field: 'end', title: '搬入地址'}
                        , {field: 'price', title: '预估起价'}
                        , {field: 'receiveMoney', title: '实际收款'}
                        , {field: 'costMoney', title: '支出金额'}
                        , {field: 'emp_name', title: '收款人'}

                        , {
                            field: 'endTime', title: '完成时间', sort: true, templet: function (d) {
                                return formatDateTime(d.endTime);
                            }
                        }
                        , {field: 'status', title: '状态'}
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