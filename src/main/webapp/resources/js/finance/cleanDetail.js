layui.use(["table", "layer", "laydate", "jquery"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var laydate = layui.laydate;
    var $ = layui.$;
    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            order: "",

        },
        methods: {
            //选择收款人
            chooseMoney:function () {
                layer.open({
                    type: 2,
                    content: "/finance/cleanDetail?id=" ,
                    area: ["500px", "400px"],
                    title: "选择收款人"
                });
            },

            //选择司机
            chooseDrive:function () {
                layer.open({
                    type: 2,
                    content: "/finance/cleanDetail?id=" ,
                    area: ["500px", "400px"],
                    title: "选择司机"
                });
            },

            //选择搬用工
            chooseMove:function () {
                layer.open({
                    type: 2,
                    content: "/finance/cleanDetail?id=" ,
                    area: ["500px", "400px"],
                    title: "选择搬用工"
                });
            },

            //选择空调工
            chooseMove:function () {
                layer.open({
                    type: 2,
                    content: "/finance/cleanDetail?id=" ,
                    area: ["500px", "400px"],
                    title: "选择空调工"
                });
            },
        }
    });
});