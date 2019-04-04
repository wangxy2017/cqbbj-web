var main = new Vue({
    el: "#main",
    data: {},
    /**
     * 方法
     */
    methods: {
        /**
         * 点击卡片执行的动画
         */
        vive:function () {
            // console.log("点击卡片")dividendDetails;
            $(".display").slideToggle("fast");
        },
        /**
         * 点击查看执行的跳转
         */
        detail: function () {
            window.location.href = "/wx/orderDivide/dividendDetails?userKey=" + myCache.userKey;
        }
    },
    mounted: function () {

    }
});