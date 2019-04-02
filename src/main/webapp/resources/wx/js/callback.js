var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        /**
         * 提交按钮事件
         * */
        submit: function () {
            $.ajax({
                url: "/wx/order/update",
                dataType: "json",
                data: {
                    "userKey": myCache.userKey,
                    "id": $("#main").attr("dataid"),
                    "visit": $("#visit").val()
                },
                type: "POST",
                success: function (result) {
                    toastr.success('提交成功');
                    window.location.href = "/wx/order/completeOrder";
                },
                error: function (result) {
                    toastr.warning('提交异常');
                }
            });
        }
    }
});