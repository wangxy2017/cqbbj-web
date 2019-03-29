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
            status: 1
        },
        methods: {
            /**
             * 搜索
             */
            search: function () {
                table.reload("myTaskList", {
                    where: {
                        "status": main.status,
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
                    elem: "#myTaskList",
                    id: "myTaskList",
                    url: "/home/queryTaskList",
                    where: {"status": 1},
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
                        , {field: 'order_no', title: '订单编号', width: 200}
                        , {field: 'start', title: '搬出地址'}
                        , {field: 'end', title: '搬入地址'}
                        , {
                            field: 'beginTime', title: '预约时间', templet: function (d) {
                                return formatDateTime(d.beginTime);
                            }
                        }
                        , {
                            field: 'status', title: '任务状态', width: 100, align: "center", templet: function (d) {
                                var text = "";
                                if (d.status == 1) {
                                    text = "<span style='color: #FF5722'>未完成</span>";
                                } else {
                                    text = "<span style='color: #009688'>已完成</span>";
                                }
                                return text;
                            }
                        }
                        , {
                            field: 'dispatchTime', title: '派单时间', templet: function (d) {
                                return formatDateTime(d.dispatchTime);
                            }
                        }
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
            }
        },
        mounted: function () {
            this.initTable();
        }
    });
});