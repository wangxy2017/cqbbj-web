layui.use(["table", "layer", "laydate", "jquery"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var laydate = layui.laydate;
    var $ = layui.$;
    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            order: "",
            moneyEmp:{},
            driveEmps:[],
            moveEmps:[],
            airEmps:[]
        },
        methods: {
            /**
             * 自动结算
             */
            auto:function(){
                $("#clean2").hide();
                $("#clean1").show();
            },
            /**
             * 手动结算
             */
            manual:function(){
                $("#clean1").hide();
                $("#clean2").show();
            },
            //选择员工
            chooseEmp:function (type) {
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
            }
        }


    });
});