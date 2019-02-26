// JavaScript代码区域
layui.use(["form", "layer"], function () {
    var form = layui.form;
    var layer = layui.layer;

    var main = new Vue({
        el: "#main",
        data: {
        customer:""

        },
        methods: {
            /**
             * 监听提交事件
             */
            onSubmit: function () {
                form.on("submit(updateCustomer)", function (data) {
                    console.log(data.field);
                    // 请求后台保存数据
                    main.$http.post("/customer/update", data.field, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            window.location.href = "/customer/customer";
                        } else {
                            layer.msg("数据保存失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                    return false;// 阻止表单跳转
                });
            }
        },
        mounted: function () {
            this.$http.post("/customer/queryById", {"id": document.getElementById("main").getAttribute("data-id")}, {emulateJSON: true}).then(function (res) {
                // console.log(res.body);
                // 加载数据
                if (res.body.code == 1) {
                    main.customer = res.body.customer;
                    this.$nextTick(function () {
                        // 重新渲染表单
                        form.render();
                        // 监听表单提交
                        main.onSubmit();
                    });
                } else {
                    layer.msg("查询数据异常");
                }
            }, function (res) {
                layer.msg("服务器请求异常");
            });
        }
    });
});