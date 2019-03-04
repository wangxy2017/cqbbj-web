// JavaScript代码存放区域
layui.use(["form", "layer"], function () {
    var form = layui.form;
    var layer = layui.layer;

    var main = new Vue({
        el: "#main",
        data: {
            error: "",
            system: "重庆棒棒军后台管理系统",
            support: "重庆棒棒军服务有限公司"
        },
        methods: {
            /**
             * 监听表单提交
             */
            onSubmit: function () {
                form.on('submit(login)', function (data) {
                    // console.log(data.field);
                    // 验证用户
                    main.$http.post("/doLogin", data.field, {emulateJSON: true}).then(function (res) {
                        // console.log(res.body);
                        if (res.body.code == 1) {
                            window.location.href = "/index";
                        } else {
                            main.error = res.body.msg;
                        }
                    }, function (res) {
                        layer.msg("请求服务器异常");
                    });
                    return false;// 阻止表单跳转
                });
            }
        },
        mounted: function () {
            this.onSubmit();
        }
    });


});