//JavaScript区域
layui.use(["form", "layer"], function () {
    var form = layui.form;
    var layer = layui.layer;

    var main = new Vue({
        el: "#main",
        data: {
            order_no: document.getElementById("main").getAttribute("data-id"),
            moneyEmp: {},
            driveEmps: [],
            moveEmps: [],
            airEmps: []
        },
        methods: {
            /**
             * 选择员工
             */
            queryEmpList: function (type) {
                parent.layer.open({
                    type: 2,
                    title: "选择员工",
                    content: "/order/searchEmpList",
                    area: ["980px", "450px"],
                    maxmin: true,
                    end: function () {
                        // 关闭弹层回调
                        console.log(type);
                        // console.log(parent.checkedEmps);
                        if (type == "money") {
                            main.moneyEmp = parent.checkedEmps[0];
                        }
                        if (type == "drive") {
                            main.driveEmps = parent.checkedEmps;
                        }
                        if (type == "move") {
                            main.moveEmps = parent.checkedEmps;
                        }
                        if (type == "air") {
                            main.airEmps = parent.checkedEmps;
                        }
                    }
                });
            },
            /**
             * 重置表单
             */
            resetForm: function () {
                main.moneyEmp = {};
                main.driveEmps = [];
                main.moveEmps = [];
                main.airEmps = [];
            }
        },
        mounted: function () {
            //监听提交
            form.on('submit(dispatchOrder)', function (data) {
                // console.log(data.field);
                // 请求后台保存数据

                return false;// 阻止表单跳转
            });
        }
    });
});