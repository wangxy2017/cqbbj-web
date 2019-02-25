layui.use(["layer"], function () {
    var layer = layui.layer;

    var main = new Vue({
        el: "#main",
        data: {
            menus: [],
            menu_ids: []
        },
        methods: {
            /**
             * 绑定菜单
             */
            bindMenu: function () {
                var id = document.getElementById("main").getAttribute("data-id");
                // 保存数据
                this.$http.post('/dept/bindMenu', {
                    "dept_id": id,
                    "menu_ids": main.menu_ids.join(",")
                }, {emulateJSON: true}).then(function (res) {
                    // console.log(res.body);
                    if (res.body.code == 1) {
                        window.location.href = "/dept/dept";
                    } else {
                        layer.msg("操作失败");
                    }
                }, function (res) {
                    layer.msg("服务器请求异常");
                });
            }
        },
        mounted: function () {
            this.$http.post('/dept/queryBindMenu', {"id": document.getElementById("main").getAttribute("data-id")}, {emulateJSON: true}).then(function (res) {
                // console.log(res.body);
                // 加载数据
                main.menus = res.body.data.menus;
                main.menu_ids = res.body.data.menu_ids;
            }, function (res) {
                layer.msg("服务器请求异常");
            });
        }
    });

});