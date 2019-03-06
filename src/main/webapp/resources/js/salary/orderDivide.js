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
            emp_name: "",
            emp_pos: "",
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
                table.reload("orderDivideList", {
                    where: {
                        "order_no": main.order_no,
                        "name": main.emp_name,
                        "position_id": main.emp_pos,
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
                    elem: "#orderDivideList",
                    id: "orderDivideList",
                    url: "/orderDivide/queryPageList",
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
                        , {field: 'start', title: '搬出地址'}
                        , {field: 'end', title: '搬入地址'}
                        , {
                            field: 'endTime', title: '完成时间', sort: true, templet: function (d) {
                                return formatDateTime(d.endTime);
                            }
                        }
                        , {field: 'emp_name', title: '员工姓名'}
                        , {field: 'order_price', title: '订单金额'}

                        , {field: 'type', title: '提成比例'}
                        , {field: 'money', title: '提成金额'}
                        , {
                            field: 'clean_time', title: '结算时间', sort: true, templet: function (d) {
                                return formatDateTime(d.clean_time);
                            }
                        }
                        , {field: 'operator_name', title: '操作人'}
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