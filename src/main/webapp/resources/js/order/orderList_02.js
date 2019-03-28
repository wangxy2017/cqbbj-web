// JavaScript代码区域
var checkedEmps = [];// 选择的员工
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
            name: ""
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
                        "beginTime1": $("#beginTime1").val(),
                        "beginTime2": $("#beginTime2").val()
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
                    where: {"status": 0},
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
                        , {field: 'content', title: '备注'}
                        , {field: 'price', title: '订单价格'}
                        , {
                            field: 'beginTime', title: '预约时间', templet: function (d) {
                                return formatDateTime(d.beginTime);
                            }
                        }
                        , {title: '操作', fixed: 'right', align: 'center', toolbar: '#options', width: 220}
                    ]]
                });
                // 初始化时间插件
                laydate.render({
                    elem: '#beginTime1',
                    type: "datetime"
                });
                laydate.render({
                    elem: '#beginTime2',
                    type: "datetime"
                });
                // 监听工具条
                table.on('tool(orderList)', function (obj) {
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值

                    // 派单
                    if (layEvent === 'dispatch') {
                        console.log(layEvent);
                        layer.open({
                            type: 2,
                            title: "派单",
                            content: "/order/dispatch?order_no=" + data.order_no,
                            area: ["700px", "500px"],
                            maxmin: true,
                            moveOut: true,
                            end: function () {
                                // 刷新列表
                                table.reload("orderList");
                            }
                        });
                    }
                    // 取消订单
                    if (layEvent === 'cancel') {
                        layer.confirm("确认取消订单吗？", function () {
                            // 请求后台，取消订单
                            main.$http.post('/order/cancel', {"id": data.id}, {emulateJSON: true}).then(function (res) {
                                console.log(res.body);
                                if (res.body.code == 1) {
                                    layer.msg("操作成功");
                                    // 刷新列表
                                    table.reload("orderList");
                                } else {
                                    layer.msg("操作失败");
                                }
                            }, function (res) {
                                layer.msg("服务器请求异常");
                            });
                        });
                    }
                    // 修改订单
                    if (layEvent === 'update') {
                        window.location.href = "/order/orderUpdate?id=" + data.id;
                    }
                    // 查看订单
                    if (layEvent === 'view') {
                        layer.open({
                            type: 2,
                            content: "/order/orderView?id=" + data.id,
                            area: ["700px", "550px"],
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
                    window.location.href = "/order/download?page=02" +
                        "&status=0" +
                        "&name=" + main.name +
                        "&order_no=" + main.order_no +
                        "&beginTime1=" + $("#beginTime1").val() +
                        "&beginTime2=" + $("#beginTime2").val();
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