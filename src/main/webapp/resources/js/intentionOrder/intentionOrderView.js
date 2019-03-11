// JavaScript代码区域
layui.use(["layer", "jquery"], function () {
    var layer = layui.layer;
    var $ = layui.$;

    var main = new Vue({
        el: "#main",
        data: {
            order: {}
        },
        mounted: function () {
            this.$http.post("/intentionOrder/orderDetail", {"id": $("#main").attr("data-id")}, {emulateJSON: true}).then(function (res) {
                // console.log(res.body);
                // 加载数据
                if (res.body.code == 1) {
                    main.order = res.body.data;
                } else {
                    layer.msg("查询数据异常");
                }
            }, function (res) {
                layer.msg("服务器请求异常");
            });
        }
    });
});