//JavaScript代码区域
layui.use(["element", "layer"], function () {
    var element = layui.element;
    var layer = layui.layer;

    var main = new Vue({
        el: "#main",
        data: {
            menus: [],
            url: "/home/welcome"
        },
        methods: {
            /**
             * 退出系统
             */
            logout: function () {
                layer.confirm("确认退出系统吗？", function (index) {
                    // 请求退出
                    main.$http.post('/doLogout', {}, {emulateJSON: true}).then(function (res) {
                        if (res.body.code == 1) {
                            window.location.href = "/login";
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                    layer.close(index);
                })
            }
        },
        mounted: function () {
            // 向后台请求数据，查询所有信息
            this.$http.post('/loginInfo', {}, {emulateJSON: true}).then(function (res) {
                // 加载数据
                // console.log(res.body.data);
                this.menus = res.body.data;
                // 等待DOM渲染完后执行
                this.$nextTick(function () {
                    element.render("nav", "menu");
                    // 监听元素点击事件
                    element.on("nav(menu)", function (ele) {
                        // console.log(ele[0]);
                        var href = ele[0].getAttribute("data-url");
                        // console.log(href);
                        // 子窗口跳转
                        if (href) {
                            main.url = href;
                        }
                    });
                });
            }, function (res) {
                layer.msg("服务器请求异常");
            });
        }
    });

});