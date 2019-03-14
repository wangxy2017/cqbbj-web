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
                    elem: '#beginTime1',
                    type: "datetime"
                });
                //结束时间
                laydate.render({
                    elem: '#beginTime2',
                    type: "datetime"
                });
            },
            search: function () {
                table.reload("financeCleanList", {
                    where: {
                        "order_no": main.order_no,
                        "name": main.name,
                        "is_clean": main.is_clean,
                        "beginTime1": $("#beginTime1").val(),
                        "beginTime2": $("#beginTime2").val()
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
                        , {field: 'receiveMoney', title: '实际收款', align: "center"}
                        , {
                            field: 'costMoney', title: '支出费用', align: "center", templet: function (d) {
                                return isEmpty(d.costMoney) ? "<span style='color:#FF5722'>未结算</span>" : d.costMoney;
                            }
                        }
                        , {field: 'drive', title: '司机'}
                        , {field: 'move', title: '搬运工'}
                        , {field: 'air', title: '空调工'}
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