var main = new Vue({
        el: "#main",
        data: {
            order: {},
            isDispatch: false
        },
        methods: {
            submit: function () {
                $.ajax({
                    url: "/wx/order/update",
                    data: {
                        "id": $("#table").attr("data_id"),
                        "order_no": order.order_no,
                        "status":order.status,
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
                    success:function () {

                },error:function () {

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
                        if (this.order.status == 1 || this.order.status == 2) {
                            this.isDispatch = true;
                        }
                        $("#moneyEmps").val($("#moneyEmpsList").text());
                        $("#driveEmps").val($("#driveEmpsList").text());
                        $("#moveEmps").val($("#moveEmpsList").text());
                        $("#airEmps").val($("#airEmpsList").text());
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