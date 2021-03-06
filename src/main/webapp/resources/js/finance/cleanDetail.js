layui.use(["table", "layer", "jquery", "form"], function () {
    var form = layui.form;
    var table = layui.table;
    var layer = layui.layer;
    var $ = layui.$;
    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            order: {},
            cleanStyle: "",
            money: "",
            drive: "",
            move: "",
            air: "",
        },
        methods: {
            /**
             * 自动结算
             */
            auto: function () {
                $("#clean2").hide();
                $("#clean1").show();
                $("#li2").removeClass("layui-this");
                $("#li1").addClass("layui-this");
            },
            /**
             * 手动结算
             */
            manual: function () {
                $("#clean1").hide();
                $("#clean2").show();
                $("#li1").removeClass("layui-this");
                $("#li2").addClass("layui-this");
            },

            /**
             * 选择结算方式时加载数据
             */
            load: function () {
                if (main.cleanStyle != 0) {
                    this.$http.post("/divideModel/queryPageList", {}, {emulateJSON: true}).then(function (res) {

                    }, function (reason) {

                    })
                }
            },

            //选择员工
            chooseEmp: function (type) {
                parent.layer.open({
                    type: 2,
                    title: "选择员工",
                    content: "/order/searchEmpList",
                    area: ["980px", "450px"],
                    maxmin: true,
                    moveOut: true,
                    end: function () {
                        // 关闭弹层回调
                        // console.log(parent.checkedEmps);
                        if (type == "money") {
                            main.moneyEmp = parent.checkedEmps[0];
                        }
                        if (type == "drive") {
                            main.margeEmps(parent.checkedEmps, main.driveEmps);
                        }
                        if (type == "move") {
                            main.margeEmps(parent.checkedEmps, main.moveEmps);
                        }
                        if (type == "air") {
                            main.margeEmps(parent.checkedEmps, main.airEmps);
                        }
                    }
                });
            },
            /**
             * 合并员工数组
             *
             * @param checkedEmps 选择的员工
             * @param dispatchEmps 派单员工数组
             */
            margeEmps: function (checkedEmps, dispatchEmps) {
                // 去重
                var tempArr = [];
                for (var i = 0; i < checkedEmps.length; i++) {
                    var check = checkedEmps[i];
                    var isPush = true
                    for (var j = 0; j < dispatchEmps.length; j++) {
                        var emp = dispatchEmps[j];
                        if (emp.emp_no == check.emp_no) {
                            isPush = false;
                        }
                    }
                    if (isPush) {
                        tempArr.push(check);
                    }
                }
                // 追加
                for (var i = 0; i < tempArr.length; i++) {
                    dispatchEmps.push(tempArr[i]);
                }
            },
            submit: function () {

            },
            cancel: function () {

            }
        },
        mounted: function () {
            // 初始化表单
            form.render();
            //监听手动结算提交
            form.on('submit(handleClean)', function (data) {
                layer.msg(JSON.stringify(data.field));
                return false;
            });
            /**
             * 默认使用自动结算
             */
            $("#clean2").hide();
            $("#clean1").show();

            /**
             * 加载结算方式
             */
            this.$http.post("/divideModel/queryList", {}, {emulateJSON: true}).then(function (res) {
                if (res.body.code == 1) {
                    var html = "<option value=''>请选择</option>";
                    for (var i = 0; i < res.body.data.length; i++) {
                        html += "<option >" + res.body.data[i].name + "</option>";
                    }
                    $("#selectSM").empty().append(html);
                    // 重新渲染表单
                    form.render();
                }
            }, function () {
                toastr.error("下拉框加载失败");
            });

        }


    });
});