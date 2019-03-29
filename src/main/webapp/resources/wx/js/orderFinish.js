var main = new Vue({
    el: "#main",
    data: {
        order_no: "",
        receiveMoney: "",
        receiveText: ""
    },
    methods: {
        /**
         * 提交按钮事件
         * */
        submit: function () {
            $.ajax({
                url: "/wx/order/update",
                dataType: "json",
                data: {
                    "order_no": main.order_no,
                    "receiveMoney": main.receiveMoney,
                    "receiveText": main.receiveText,
                    "endTime":new Date(),
                    "status": 2,
                    "id":$("#main").attr("data_id")
                },
                type: "POST",
                success: function (result) {
                    console.log(result);
                    if(result.code==1){
                    toastr.success('提交成功');
                    window.location.href = "/wx/order/completeOrder";
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