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
            name: "",
            payTime1: "",
            payTime2: ""
        },
        methods: {
            /**
             * 搜索
             */
            search: function () {
                table.reload("orderList", {
                    where: {
                        "name": main.name,
                        "order_no": main.order_no,
                        "payTime1": main.payTime1,
                        "payTime2": main.payTime2
                    }
                });
            },
            /**
             * 初始化表格
             */
            initTable: function () {
                table.render({
                    elem: "#orderList",
                    id: "orderList",
                    url: "/order/queryPageList",
                    page: true,
                    where: {"status": 2},
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
                        , {field: 'order_no', title: '订单编号'}
                        , {field: 'name', title: '客户名称'}
                        , {field: 'phone', title: '客户电话'}
                        , {field: 'start', title: '搬出地址'}
                        , {field: 'end', title: '搬入地址'}
                        , {field: 'price', title: '预估费用'}
                        , {field: 'receiveMoney', title: '实际费用'}
                        , {
                            field: 'endTime', title: '完成时间', templet: function (d) {
                                return formatDateTime(d.endTime);
                            }
                        }
                        , {title: '操作', fixed: 'right', align: 'center', toolbar: '#options'}
                    ]]
                });
                // 初始化时间插件
                laydate.render({
                    elem: '#payTime1'
                });
                laydate.render({
                    elem: '#payTime2'
                });
                // 监听工具条
                table.on('tool(orderList)', function (obj) {
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值

                    // 回访
                    if (layEvent === 'visit') {
                        console.log("回访");
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