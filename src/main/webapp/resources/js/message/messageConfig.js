// JavaScript代码区域
layui.use(["form", "layer"], function () {
    var form = layui.form;
    var layer = layui.layer;

    var main = new Vue({
        el: "#main",
        data: {
            company: {}
        },
        methods: {
            /**
             * 监听提交事件
             */
            onSubmit: function () {
                form.on("submit(update)", function (data) {
                    // 请求后台保存数据
                    main.$http.post("/message/updateConfig", data.field, {emulateJSON: true}).then(function (res) {
                        if (res.body.code == 1) {
                            layer.msg("保存成功");
                        } else {
                            layer.msg("保存失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                    return false;// 阻止表单跳转
                });
            }
        },
        mounted: function () {
            var that = this;
            that.$http.post("/company/queryInfo", {}, {emulateJSON: true}).then(function (res) {
                // console.log(res.body);
                // 加载数据
                if (res.body.code == 1) {
                    that.company = res.body.data;
                    // 等待DOM更新完成后执行
                    that.$nextTick(function () {
                        // 重新渲染表单
                        form.render();
                        // 监听提交事件
                        that.onSubmit();
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