var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        /**
         * 点击待付款跳转页面
         */
        nonPeyment:function () {
            window.location.href ="/wx/customer/nonPeyMent?userKey=" + myCache.userKey ;
        },
        /**
         * 点击已付款跳转页面
         */
        hasPayMent:function () {
            window.location.href ="/wx/customer/hasPayMent?userKey=" + myCache.userKey ;
        }
    },
    mounted: function () {

    }
});