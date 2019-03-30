var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        /**
         * 点击提交事件
         */
        submit:function () {
            $.ajax({
                url: "/wx/order/addIntentionOrder",
                data: {
                    "name": $("#name").val(),
                    "phone": $("#phone").val(),
                    "start": $("#start").val(),
                    "end": $("#end").val()
                },
                dataType: "JSON",
                type: "POST",
                success: function (res) {
                    console.log(res);
                    toastr.info("提交成功");
                }, error: function () {
                    toastr.error("提交异常");
                }
            });
        }
    },
    mounted: function () {

    }
});