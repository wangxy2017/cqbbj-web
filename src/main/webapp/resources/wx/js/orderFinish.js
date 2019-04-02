var main = new Vue({
    el: "#main",
    data: {
        order_no: "",
        receiveMoney: 0.00,
        receiveText: ""
    },
    methods: {
        /**
         * 提交按钮事件
         * */
        submit: function () {
            $.ajax({
                url: "/wx/order/helpDone",
                dataType: "json",
                data: {
                    "userKey": myCache.userKey,
                    "order_no": main.order_no,
                    "receiveMoney": main.receiveMoney,
                    "receiveText": main.receiveText,
                    "isNotPay": $("#notPay").is(":checked") ? 1 : 0,
                    "id": $("#main").attr("data_id")
                },
                type: "POST",
                success: function (result) {
                    console.log(result);
                    if (result.code == 1) {
                        toastr.success('操作成功');
                        setTimeout(function () {
                            window.location.href = "/wx/order/completeOrder?userKey=" + myCache.userKey;
                        }, 500);
                    }
                },
                error: function (result) {
                    toastr.warning('提交异常');
                }
            });
        }
    },
    mounted: function () {
        this.order_no = $("#main").attr("data_no");
    }
});