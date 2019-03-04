//JavaScript区域
layui.use(["form", "layer"], function () {
    var form = layui.form;

    var main = new Vue({
        el: "#main",
        data: {
            order_no: document.getElementById("main").getAttribute("data-id"),
            moneyEmp: {},
            driveEmps: [],
            moveEmps: [],
            airEmps: []
        },
        computed: {
            // 选择收款员
            checkMoney: function () {
                return this.moneyEmp.emp_no;
            },
            // 选择司机
            checkDrive: function () {
                var check = [];
                for (var i = 0; i < this.driveEmps.length; i++) {
                    check.push(this.driveEmps[i].emp_no);
                }
                return check.join(",");
            },
            // 选择搬运工
            checkMove: function () {
                var check = [];
                for (var i = 0; i < this.moveEmps.length; i++) {
                    check.push(this.moveEmps[i].emp_no);
                }
                return check.join(",");
            },
            // 选择空调工
            checkAir: function () {
                var check = [];
                for (var i = 0; i < this.airEmps.length; i++) {
                    check.push(this.airEmps[i].emp_no);
                }
                return check.join(",");
            }
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
                main.$http.post("/order/dispatchOrder",
                    {
                        "order_no": main.order_no,
                        "moneyEmps": main.checkMoney,
                        "driveEmps": main.checkDrive,
                        "moveEmps": main.checkMove,
                        "airEmps": main.checkAir
                    },
                    {emulateJSON: true}).then(function (res) {
                    // console.log(res.body);
                    // 加载数据
                    if (res.body.code == 1) {
                        parent.layer.msg("派单成功");
                        //关闭自身
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                        // 刷新列表
                        parent.table.reload("orderList");
                    } else {
                        parent.layer.msg("派单失败");
                    }
                }, function (res) {
                    parent.layer.msg("服务器请求异常");
                });
                return false;// 阻止表单跳转
            });
        }
    });
});