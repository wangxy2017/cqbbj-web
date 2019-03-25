// 选择员工全局参数
var checkedEmps = [];
layui.use(["form", "laydate", "jquery"], function () {
    var form = layui.form;
    var layer = layui.layer;
    var $ = layui.$;

    var main = new Vue({
        el: "#main",
        data: {
            salary: {}
        },
        methods: {
            /**
             * 选择员工
             */
            chooseEmployee: function () {
                layer.open({
                    type: 2,
                    title: "选择员工",
                    content: "/order/searchEmpList",
                    area: ["980px", "450px"],
                    maxmin: true,
                    moveOut: true,
                    end: function () {
                        // 关闭弹层回调
                        $("#emp_name").val(checkedEmps[0].name);
                        $("#emp_no").val(checkedEmps[0].emp_no);
                    }

                });
            },
            /**
             * 监听提交
             */
            onSubmit: function () {
                form.on('submit(updateSalary)', function (data) {
                    // console.log(data.field);
                    // 请求后台保存数据
                    $.ajax({
                        url: "/salary/update",
                        dataType: "json",
                        data: data.field,
                        type: "POST",
                        success: function (result) {
                            console.log(result);
                            // 保存成功，跳转页面
                            if (result.code == 1) {
                                window.location.href = "/salary/salary";
                            }
                        },
                        error: function () {
                            layer.msg("服务器异常");
                        }
                    });
                    return false;// 阻止表单跳转
                });

            }
        },
        mounted: function () {
            this.$http.post("/salary/queryById", {"id": $("#main").attr("data-id")}, {emulateJSON: true}).then(function (res) {
                // 加载数据
                if (res.body.code == 1) {
                    main.salary = res.body.data;
                    this.$nextTick(function () {
                        // 重新渲染表单
                        form.render();
                        // 监听表单提交
                        this.onSubmit();
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