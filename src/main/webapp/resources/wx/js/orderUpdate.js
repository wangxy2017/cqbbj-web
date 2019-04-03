var main = new Vue({
        el: "#main",
        data: {
            order: {},
        },
        methods: {
            /**
             * 提交修改
             */
            submit: function () {
                $.ajax({
                    url: "/wx/order/update",
                    data: {
                        "userKey": myCache.userKey,
                        "id": $("#table").attr("data_id"),
                        "order_no": main.order.order_no,
                        "phone": main.order.phone,
                        "start": main.order.start,
                        "end": main.order.end,
                        "content": main.order.content,
                        "price": main.order.price,
                        "beginTime": $("#beginTime").val(),
                    },
                    dataType: "json",
                    type: "post",
                    success: function (result) {
                        if (result.code == 1) {
                            toastr.success("修改成功");
                            setTimeout(function () {
                                if (main.order.status == 0) {
                                    window.location.href = "/wx/order/unSentOrder?userKey=" + myCache.userKey;
                                }
                                if (main.order.status == 1) {
                                    window.location.href = "/wx/order/sentOrder?userKey=" + myCache.userKey;
                                }
                            }, 500);
                        }
                    }, error: function () {
                        toastr.error("服务器异常");
                    }
                })
            }

        },
        mounted: function () {
            // console.log($("#table").attr("data_id"));
            // return;
            this.$http.post("/wx/order/queryById", {
                "userKey": myCache.userKey,
                "id": $("#table").attr("data_id")
            }, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                if (res.body.code == 1) {
                    this.order = res.body.data;
                } else {
                    toastr.error("数据异常");
                }
            }, function (res) {
                toastr.error("服务器异常");
            });
        }
    })
;