var main = new Vue({
        el: "#main",
        data: {
            order: {},
            isDispatch: false,

            moneyEmps:[],
            driveEmps:[],
            moveEmps:[],
            airEmps:[]
        },
        methods: {
            clickMoneyEmps:function(){
                main.$http.post("http://192.168.0.100:9000/wx/employee/queryPageList", {}, {emulateJSON: true}).then(function (res) {
                    console.log(res.body);
                    // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                    main.moneyEmps = res.body.data;
                }, function (res) {
                    toastr.warning('提交异常');
                });
            },
            clickDriveEmps:function(){
                main.$http.post("http://192.168.0.100:9000/wx/employee/queryPageList", {}, {emulateJSON: true}).then(function (res) {
                    console.log(res.body);
                    // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                    main.driveEmps = res.body.data;
                }, function (res) {
                    toastr.warning('提交异常');
                });
            },
            clickMoveEmps:function(){
                main.$http.post("http://192.168.0.100:9000/wx/employee/queryPageList", {}, {emulateJSON: true}).then(function (res) {
                    console.log(res.body);
                    // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                    main.moveEmps = res.body.data;
                }, function (res) {
                    toastr.warning('提交异常');
                });
            },
            clickAirEmps:function(){
                main.$http.post("http://192.168.0.100:9000/wx/employee/queryPageList", {}, {emulateJSON: true}).then(function (res) {
                    console.log(res.body);
                    // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                    main.airEmps = res.body.data;
                }, function (res) {
                    toastr.warning('提交异常');
                });
            },


            checkDriveEmps:function(event){

                var _this = $(event.target);
                var info = _this.hasClass("btn-info");
                if (info) {// 取消选中
                    _this.removeClass('btn-info').addClass('btn-default');
                    var name = _this.text() + " ";
                    $("#driveEmps_name").val($("#driveEmps_name").val().replace(name,""));
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
                        if($("status").val()==0){
                        window.location.herf = "/wx/order/unSentOrder";}
                        if($("status").val()==1){
                            window.location.herf = "/wx/order/sentOrder";}
                    }, error: function () {
                        toastr.success("修改失败");
                    }
                })
            }

        },
        mounted: function () {
            this.$http.post("http://192.168.0.100:9000/wx/order/queryById", {"id": $("#table").attr("data_id")}, {emulateJSON: true}).then(function (res) {
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
                    alert("数据异常");
                }
            }, function (res) {
                alert("服务器异常");
            });
        }
    })
;