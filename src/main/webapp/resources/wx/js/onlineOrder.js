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
                /**
                 * 成功执行判断
                 * @param res
                 */
                success: function (res) {
                    console.log(res);
                    if (res.code == 1){
                        toastr.info("提交成功");
                    }else {
                        toastr.error("提交失败");
                    }
                },

                error: function () {
                    toastr.error("提交异常");
                }
            });
        }
    },
    mounted: function () {

    }
});