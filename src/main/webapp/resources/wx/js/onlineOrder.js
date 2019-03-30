var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        /**
         * 点击提交事件
         */
        submit:function () {
            $.ajax({
                url: "",
                dataType: "json",
                data: {},
                type: "POST",
                success: function (result) {
                    toastr.success("提交成功");
                },
                error: function () {
                    toastr.error("数据出错");
                }
            });
        }
    },
    mounted: function () {

    }
});