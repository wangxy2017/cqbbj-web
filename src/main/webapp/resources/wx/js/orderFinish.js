var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        /**
         * 提交按钮事件
         * */
        submit:function () {
            $.ajax({
                url: "/wx/order/finishOrderStatus",
                dataType: "json",
                data: {},
                type: "POST",
                success: function (result) {
                    toastr.success('提交成功');
                    window.location.href = "completeOrder.html";
                },
                error: function (result) {
                    toastr.warning('提交异常');
                }
            });
        }
    },
    mounted: function () {

    }
});