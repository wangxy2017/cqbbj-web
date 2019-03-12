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