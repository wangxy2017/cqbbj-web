// JavaScript区域
layui.use(["form", "layer", "jquery"], function () {
    var form = layui.form;
    var layer = layui.layer;
    var $ = layui.$;
    var main = new Vue({
        el: "#main",
        data: {
            name: "",
            driveDivide: {},
            moveDivide: {},
            airDivide: {},
            driveInfo: "",
            moveInfo: "",
            airInfo: ""
        },
        methods: {
            /**
             * 设置提成
             * @param type
             */
            setting: function (empType) {
                layer.open({
                    type: 1,
                    content: $('#divide'),
                    area: ["514px", "364px"],
                    title: "提成设置",
                    btn: ["确认", "取消"],
                    success: function (layero, index) {
                        // 重置表单
                        $("#divide")[0].reset();
                    },
                    yes: function (index, layero) {
                        var type = $("#divide input[name='type']:checked").val();
                        var value = $("#divide input[name='value']").val();
                        var isAll = $("#divide input[name='isAll']:checked").val();
                        // 判断提成数值是否为空
                        if (value == "") {
                            layer.msg("请填写提成数值");
                            $("#divide input[name='value']").focus();
                            return;
                        }
                        if (empType == "drive") {
                            main.driveDivide.name = "司机";
                            main.driveDivide.type = type;
                            main.driveDivide.value = value;
                            main.driveDivide.isAll = isAll;
                            // 提成信息显示
                            console.log(type + value + isAll);
                            // var text = "【司机：比例提成 - 1% ：全额提成】";
                            var text = "【司机：";
                            text += type == 0 ? ("工时提成 - " + value + "元/小时") : ("比例提成 - " + value + "%");
                            text += " ：";
                            text += isAll == 0 ? "全额提成" : "扣除开支提成";
                            text += "】";
                            main.driveInfo = text;
                            console.log(main.driveInfo);
                        }
                        if (empType == "move") {
                            main.moveDivide.name = "搬运工";
                            main.moveDivide.type = type;
                            main.moveDivide.value = value;
                            main.moveDivide.isAll = isAll;
                            // var text = "【搬运工：比例提成 - 1% ：全额提成】";
                            var text = "【搬运工：";
                            text += type == 0 ? "工时提成 - " + value + "元/小时" : "比例提成 - " + value + "%";
                            text += " ：";
                            text += isAll == 0 ? "全额提成" : "扣除开支提成";
                            text += "】";
                            main.moveInfo = text;
                            console.log(main.moveInfo);
                        }
                        if (empType == "air") {
                            main.airDivide.name = "空调工";
                            main.airDivide.type = type;
                            main.airDivide.value = value;
                            main.airDivide.isAll = isAll;
                            // var text = "【空调工：比例提成 - 1% ：全额提成】";
                            var text = "【空调工：";
                            text += type == 0 ? "工时提成 - " + value + "元/小时" : "比例提成 - " + value + "%";
                            text += " ：";
                            text += isAll == 0 ? "全额提成" : "扣除开支提成";
                            text += "】";
                            main.airInfo = text;
                            console.log(main.airInfo);
                        }
                        layer.close(index);
                    }
                });
            },
            /**
             * 监听提交事件
             */
            onSubmit: function () {
                form.on("submit(addDivideModel)", function (data) {
                    console.log(main.driveDivide, main.moveDivide, main.airDivide);
                    var data = {
                        "name": main.name,
                        "drive": JSON.stringify(main.driveDivide),
                        "move": JSON.stringify(main.moveDivide),
                        "air": JSON.stringify(main.airDivide)
                    };
                    // 请求后台保存数据
                    main.$http.post("/divideModel/save", data, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            window.location.href = "/divideModel/divideModel";
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
            this.onSubmit();
        }
    });
});