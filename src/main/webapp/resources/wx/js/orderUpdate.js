var main = new Vue({
        el: "#main",
        data: {
            order: {},
            isDispatch: false,
            money: [],
            drive: [],
            move: [],
            air: [],

            moneyEmps: "",
            driveEmps: "",
            moveEmps: "",
            airEmps: "",
        },
        methods: {

            /**
             * 点击修改收款人员执行的方法
             * @param event
             */
            openModel: function (event) {
                // 模态框弹出
                $("#moneyEmp").show().find(".alert_body").animate({
                    marginTop: '40rem'
                });
                main.$http.post("/wx/employee/queryPageList", {"userKey": myCache.userKey}, {emulateJSON: true}).then(function (res) {
                    console.log(res.body);
                    // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                    main.money = res.body.data;
                    console.log(main.money);
                    return;
                }, function (res) {
                    toastr.warning('提交异常');
                });
            },
            /**
             * 点击任意地方关闭模态框
             */
            end: function () {
                $(".alert_body").animate({
                    marginTop: '-50rem',
                });
                setTimeout(function () {
                    $(".alert_model").css("display", "none");
                }, 500);
            },
            /**
             * 点击关闭按钮动画
             */
            hide: function () {
                $(".alert_body").animate({
                    marginTop: '-50rem',
                });
                setTimeout(function () {
                    $(".alert_model").css("display", "none");
                }, 500);

            },
            /**
             * 模态框button点击事件
             */
            choose: function (event) {
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
            clickDriveEmps: function () {
                main.$http.post("/wx/employee/queryPageList", {"userKey": myCache.userKey}, {emulateJSON: true}).then(function (res) {
                    console.log(res.body);
                    // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                    main.drive = res.body.data;
                }, function (res) {
                    toastr.warning('提交异常');
                });
            },
            clickMoveEmps: function () {
                main.$http.post("/wx/employee/queryPageList", {"userKey": myCache.userKey}, {emulateJSON: true}).then(function (res) {
                    console.log(res.body);
                    // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                    main.move = res.body.data;
                }, function (res) {
                    toastr.warning('提交异常');
                });
            },
            clickAirEmps: function () {
                main.$http.post("/wx/employee/queryPageList", {"userKey": myCache.userKey}, {emulateJSON: true}).then(function (res) {
                    console.log(res.body);
                    // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                    main.air = res.body.data;
                }, function (res) {
                    toastr.warning('提交异常');
                });
            },


            checkDriveEmps: function (event) {

                var _this = $(event.target);
                var info = _this.hasClass("btn-info");
                if (info) {// 取消选中
                    _this.removeClass('btn-info').addClass('btn-default');
                    var name = _this.text() + " ";
                    $("#driveEmps_name").val($("#driveEmps_name").val().replace(name, ""));
                    // 删值 ,123,456
                    var emp_no = "," + _this.attr("data-emp_no");
                    main.driveEmps.replace(emp_no, "");
                } else {// 选中
                    _this.removeClass('btn-default').addClass('btn-info');
                    // 赋值
                    var divNum = _this.attr("data-divNum");//编号
                    var name = _this.text() + " ";
                    $("#driveEmps_name").val($("#driveEmps_name").val() + name);
                    $("#divNum").val(divNum);
                    // 赋值
                    var emp_no = "," + _this.attr("data-emp_no");
                    main.driveEmps += emp_no;
                }
            },

            checkMoveEmps: function (event) {

                var _this = $(event.target);
                var info = _this.hasClass("btn-info");
                if (info) {// 取消选中
                    _this.removeClass('btn-info').addClass('btn-default');
                    var name = _this.text() + " ";
                    $("#moveEmps_name").val($("#moveEmps_name").val().replace(name, ""));
                    // 删值 ,123,456
                    var emp_no = "," + _this.attr("data-emp_no");
                    main.driveEmps.replace(emp_no, "");
                } else {// 选中
                    _this.removeClass('btn-default').addClass('btn-info');
                    // 赋值
                    var divNum = _this.attr("data-divNum");//编号
                    var name = _this.text() + " ";
                    $("#moveEmps_name").val($("#moveEmps_name").val() + name);
                    $("#divNum").val(divNum);
                    // 赋值
                    var emp_no = "," + _this.attr("data-emp_no");
                    main.moveEmps += emp_no;
                }
            },
            checkAirEmps: function (event) {

                var _this = $(event.target);
                var info = _this.hasClass("btn-info");
                if (info) {// 取消选中
                    _this.removeClass('btn-info').addClass('btn-default');
                    var name = _this.text() + " ";
                    $("#airEmps_name").val($("#airEmps_name").val().replace(name, ""));
                    // 删值 ,123,456
                    var emp_no = "," + _this.attr("data-emp_no");
                    main.driveEmps.replace(emp_no, "");
                } else {// 选中
                    _this.removeClass('btn-default').addClass('btn-info');
                    // 赋值
                    var divNum = _this.attr("data-divNum");//编号
                    var name = _this.text() + " ";
                    $("#airEmps_name").val($("#airEmps_name").val() + name);
                    $("#divNum").val(divNum);
                    // 赋值
                    var emp_no = "," + _this.attr("data-emp_no");
                    main.airEmps += emp_no;
                }
            },

            reset: function () {
                window.location.reload();
            },
            /**
             * 提交修改
             */
            submit: function () {
                $.ajax({
                    url: "/wx/order/update",
                    data: {
                        "userKey": myCache.userKey,
                        "id": $("#table").attr("data_id"),
                        "order_no": order.order_no,
                        "phone": order.phone,
                        "start": order.start,
                        "end": order.end,
                        "content": order.content,
                        "price": order.price,
                        "beginTime": order.beginTime,
                        "moneyEmps": $("#moneyEmps").val(),
                        "driveEmps": $("#driveEmps").val(),
                        "moveEmps": $("#moveEmps").val(),
                        "airEmps": $("#airEmps").val(),
                    },
                    dataType: "json",
                    type: "post",
                    success: function () {
                        toastr.success("修改成功");
                        if ($("status").val() == 0) {
                            window.location.herf = "/wx/order/unSentOrder?userKey=" + myCache.userKey;
                        }
                        if ($("status").val() == 1) {
                            window.location.herf = "/wx/order/sentOrder?userKey=" + myCache.userKey;
                        }
                    }, error: function () {
                        toastr.success("修改失败");
                    }
                })
            }

        },
        mounted: function () {
            this.$http.post("/wx/order/queryById", {
                "userKey": myCache.userKey,
                "id": $("#table").attr("data_id")
            }, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                if (res.body.code == 1) {
                    this.order = res.body.data;
                    this.$nextTick(function () {
                        if (this.order.status == 1) {
                            this.isDispatch = true;
                        }
                        $("#moneyEmps_name").val($("#moneyEmpsList").text());
                        $("#driveEmps_name").val($("#driveEmpsList").text());
                        $("#moveEmps_name").val($("#moveEmpsList").text());
                        $("#airEmps_name").val($("#airEmpsList").text());
                    });
                } else {
                    toastr.error("数据异常");
                }
            }, function (res) {
                toastr.error("服务器异常");
            });
        }
    })
;