var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        view:function (id) {
            setTimeout(function () {
                window.location.href = "/wx/order/orderDetail?";
            },100)

        },
        open:function () {
            // console.log("123");
            $('.display').toggle(500).css('display');
        },
    },
    mounted: function () {
        /**
         * tab切换函数
         */
            $(".title .col-sm-5").click(function () {
                $(this).addClass("boder_bottom").siblings().removeClass("boder_bottom");
                var c = document.getElementsByClassName("complete");
                var i =$(this).attr('data-show');
                c = i;
                if(i!=0){
                    $(".complete").hide();
                    $(".unfinished").show();
                    toastr.error("当前未完成订单");
                }else {
                    $(".complete").show();
                    $(".unfinished").hide();
                    toastr.info("当前完成订单");
                }

            });
    }
});