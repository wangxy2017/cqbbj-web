// JavaScript代码区域
layui.use("layer", function () {
    var layer = layui.layer;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            menus: [],
            menu_ids: []
        },
        methods: {
            // 添加菜单
            addMenu: function () {
                window.location.href = "/menu/menuAdd";
            },
            // 修改菜单
            updateMenu: function () {
                if (main.menu_ids.length == 0) {
                    layer.msg("请选择菜单");
                    return;
                }
                if (main.menu_ids.length > 1) {
                    layer.msg("请选择一个菜单进行修改");
                    return;
                }
                window.location.href = "/menu/menuUpdate?id=" + main.menu_ids[0];
            },
            // 删除菜单
            deleteMenu: function () {
                if (main.menu_ids.length == 0) {
                    layer.msg("请选择菜单");
                    return;
                }
                // 删除提示
                layer.confirm("菜单删除后不可恢复，确认删除吗？", function () {
                    main.$http.post('/menu/deleteBatch', {"ids": main.menu_ids.join(",")}, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            window.location.href = "/menu/menu";
                        } else {
                            layer.msg("删除失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                });
            }
        },
        mounted: function () {
            this.$http.post('/menu/queryAllMenu', {}, {emulateJSON: true}).then(function (res) {
                // console.log(res.body);
                // 加载数据
                main.menus = res.body.data;
            }, function (res) {
                layer.msg("服务器请求异常");
            });
        }
    });
});