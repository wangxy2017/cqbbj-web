var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        /**
         * 点击卡片显示隐藏的查看按钮
         */
        checkOver:function (event) {
            $(event.currentTarget).children('.display').fadeToggle(500);
        },
        /**
         * 点击查看跳转页面
         */
        lineItem:function () {
            window.location.href = "/wx/order/orderDetail?userKey=" + myCache.userKey + id ;
        }
    },
    mounted: function () {

    }
});