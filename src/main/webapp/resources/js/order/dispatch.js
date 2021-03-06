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
             * 删除
             */
            deleteEmp: function (type) {
                if (type == "drive") {
                    main.driveEmps.splice(main.driveEmps.length - 1, 1)
                }
                if (type == "move") {
                    main.moveEmps.splice(main.moveEmps.length - 1, 1)
                }
                if (type == "air") {
                    main.airEmps.splice(main.airEmps.length - 1, 1)
                }

            },
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
             * 重置表单
             */
            resetForm: function () {
                main.moneyEmp = {};
                main.driveEmps = [];
                main.moveEmps = [];
                main.airEmps = [];
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