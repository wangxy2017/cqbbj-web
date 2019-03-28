$(function () {


});
var main = new Vue({
    el: "#main",
    data: {

        /*
        * 收款人员
        * */
        emps: [],
        /*
       * 司机
       * */
        motorMans: [],
        /*
       * 搬运工
       * */
        hamals: [],
        /*
       * 空调工
       * */
        hvacs: [],
        order_no: "",
        moneyEmps: "",
        driveEmps: "",
        moveEmps: "",
        airEmps: "",
    },

    methods: {


        /**
         * 选择收款人员
         */
        chooseEmp: function () {
            main.$http.post("/wx/employee/queryPageList", {}, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                main.emps = res.body.data;
            }, function (res) {
                toastr.warning('提交异常');
            });
        },
        /**
         * 选择收银
         * @param event
         */
        checkEmp: function (event) {
            var _this = $(event.target);
            var info = _this.hasClass("btn-info");
            if (info) {// 取消选中
                _this.removeClass('btn-info').addClass('btn-default');
                $("#moneyEmp").val("");
                // 删值
                main.moneyEmps = "";
            } else {// 选中
                _this.removeClass('btn-default').addClass('btn-info');
                // 赋值
                var empNo = _this.attr("data-empNo");//编号
                var name = _this.text();
                $("#moneyEmp").val(name);
                $("#moneyEmpNo").val(empNo);
                // 存值
                main.moneyEmps = _this.attr("data-emp_no");
            }
        },
        /*
        *添加随车司机
        */
        chooseDriver: function () {
            main.$http.post("/wx/employee/queryPageList", {}, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                main.motorMans = res.body.data;
            }, function (res) {
                toastr.warning('提交异常');

            });
        }
        /**
         * 选择司机
         * @param event
         */
        , checkDriver: function (event) {
            var _this = $(event.target);
            var info = _this.hasClass("btn-info");
            if (info) {// 取消选中
                _this.removeClass('btn-info').addClass('btn-default');
                var name = _this.text() + " ";
                $("#driver").val($("#driver").val().replace(name,""));
                // 删值 ,123,456
                var emp_no = "," + _this.attr("data-emp_no");
                main.driveEmps.replace(emp_no, "");
            } else {// 选中
                _this.removeClass('btn-default').addClass('btn-info');
                // 赋值
                var divNum = _this.attr("data-divNum");//编号
                var name = _this.text() + " ";
                $("#driver").val($("#driver").val() + name);
                $("#divNum").val(divNum);
                // 赋值
                var emp_no = "," + _this.attr("data-emp_no");
                main.driveEmps += emp_no;
            }
        },
        /**
         *添加搬运工
         */

        chooseHamal: function () {
            main.$http.post("/wx/employee/queryPageList", {}, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                main.hamals = res.body.data;
            }, function (res) {
                toastr.warning('提交异常');

            });
        }
        /**
         * 勾选搬运工
         * @param event
         */
        , checkHamal: function (event) {
            var _this = $(event.target);
            var info = _this.hasClass("btn-info");
            if (info) {// 取消选中
                _this.removeClass('btn-info').addClass('btn-default');
                $("#hamal").val("");
                //删值
                var emp_no = "," + _this.attr("data-emp_no");
                main.airEmps.replace(emp_no,"");
            } else {// 选中
                _this.removeClass('btn-default').addClass('btn-info');
                // 赋值
                var ham = _this.attr("data-empNo");//编号
                var name = _this.text() + " ";
                $("#hamal").val($("#hamal").val() + name);
                $("#ham").val(ham);
                //赋值
                var emp_no = "," + _this.attr("data-emp_no");
                main.airEmps += emp_no;

            }
        },

        /**
         * 选择随车空调工
         *
         */

        chooseHvac: function () {
            main.$http.post("/wx/employee/queryPageList", {}, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                main.hvacs = res.body.data;
            }, function (res) {
                toastr.warning('提交异常');

            });
        }
        /**
         * 勾选空调工
         * @param event
         */
        , checkHvac: function (event) {
            var _this = $(event.target);
            var info = _this.hasClass("btn-info");
            if (info) {// 取消选中
                _this.removeClass('btn-info').addClass('btn-default');
                $("#techniCian").val("");
                //删值
                var emp_no = "," + _this.attr("data-emp_no");
                main.moveEmps.replace(emp_no,"");
            } else {// 选中
                _this.removeClass('btn-default').addClass('btn-info');
                // 赋值
                var emp = _this.attr("data-empNo");//编号
                var name = _this.text() + " ";
                $("#techniCian").val($("#techniCian").val() + name);
                $("techNo").val(emp);
                //赋值
                var emp_no = "," + _this.attr("data-emp_no");
                main.moveEmps += emp_no;

            }
        }

        /**
         * 重置
         */
        , reset: function () {
            window.location.reload();
        },


        /*
        * 派单提交点击事件
        *
        * */

        submit: function () {
            // console.log(main.driveEmps);
            // console.log(main.moveEmps);
            // console.log(main.moveEmps);
            // return;
            $.ajax({
                url: "/wx/order/dispatchOrder",
                data: {
                    // 订单编号
                    order_no: main.order_no
                    //收款人员
                    , moneyEmps: main.moneyEmps
                    //司机
                    , driveEmps: main.driveEmps
                    //搬运工
                    , moveEmps: main.moveEmps
                    //空调工
                    , airEmps: main.airEmps
                },
                //向后台传送数据的方式
                dataType: "json",
                //异步请求
                type: "post",
                success: function (res) {
                    if(res.code==1) {
                        console.log(res);
                        //    请求成功执行的代码
                        toastr.success("派单成功");
                        setTimeout(function () {
                            window.location.href = "/wx/order/sentOrder";
                        }, 500)
                    }
                }, error: function (res) {
                    console.log(res);
                    toastr.error("提交失败!");
                }   //    请求失败执行的代码
            });
        },


    },
    mounted:function () {
         this.order_no=$("#main").attr("dataid");

    }
});
