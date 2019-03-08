// JavaScript代码区域
layui.use(["layer", "jquery"], function () {
    var layer = layui.layer;
    var $ = layui.$;

    var main = new Vue({
        el: "#main",
        data: {
            order: {},
            statusColor: "",
            statusName: ""
        },
        mounted: function () {
            this.$http.post("/order/queryById", {"id": $("#main").attr("data-id")}, {emulateJSON: true}).then(function (res) {
                // console.log(res.body);
                // 加载数据
                if (res.body.code == 1) {
                    main.order = res.body.data;
                    // 判断订单状态
                    switch (main.order.status) {
                        case 0:
                            main.statusColor = "yellow";
                            main.statusName = "未派单";
                            break;
                        case 1:
                            main.statusColor = "blue";
                            main.statusName = "已派单";
                            break;
                        case 2:
                            main.statusColor = "green";
                            main.statusName = "已完成";
                            break;
                        case 3:
                            main.statusColor = "grey";
                            main.statusName = "已作废";
                            break;
                    }
                } else {
                    layer.msg("查询数据异常");
                }
            }, function (res) {
                layer.msg("服务器请求异常");
            });
        }
    });
});