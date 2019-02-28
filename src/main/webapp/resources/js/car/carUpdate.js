// JavaScript代码区域
layui.use(["form", "layer", "laydate"], function () {
    var form = layui.form;
    var layer = layui.layer;
    var laydate = layui.laydate;

    var main = new Vue({
        el: "#main",
        data: {
            car: {}

        },
        methods: {
            /**
             * 监听提交事件
             */
            onSubmit: function () {
                form.on("submit(updateCar)", function (data) {
                    console.log(data.field);
                    // 请求后台保存数据
                    main.$http.post("/car/update", data.field, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            window.location.href = "/car/car";
                        } else {
                            layer.msg("数据保存失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                    return false;// 阻止表单跳转
                });
            },
            /**
             * 初始化日历
             */
            initCalander: function () {
                //保险到期
                laydate.render({
                    elem: '#insurance_date',
                    type: "datetime",
                    value: new Date(main.car.insurance_date)
                });
                //年审到期
                laydate.render({
                    elem: '#examined_date',
                    type: "datetime",
                    value: new Date(main.car.examined_date)
                });
                //采购日期
                laydate.render({
                    elem: '#purchase_date',
                    type: "datetime",
                    value: new Date(main.car.purchase_date)
                });
            }
        },
        mounted: function () {
            var that = this;
            that.$http.post("/car/queryById", {"id": document.getElementById("main").getAttribute("data-id")}, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                // 加载数据
                if (res.body.code == 1) {
                    that.car = res.body.data;
                    console.log(that.car.id);
                    that.$nextTick(function () {
                        // 初始化日历
                        that.initCalander();
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