// JavaScript代码区域
layui.use(["table", "layer", "jquery"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var $ = layui.$;
    $(document).ready(function () {
        $.ajax({
            url: "/moneyDetail/queryResult",
            dataType: "json",
            data: {},
            type: "POST",
            success: function (result) {
                console.log(result);
                // 保存成功，跳转页面
                if (result.code == 1) {
                    document.getElementById("yue").value = result.data.money;
                }
            },
            error: function () {
                layer.msg("服务器异常");
            }
        });
    });

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            money: ""

        },
        methods: {

            // 充值
            charge: function () {
                window.location.href = "/moneyDetail/charge";
            }

        }
    });


});