var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        nonPeyment:function () {
            window.location.href ="/wx/customer/nonPeyMent?userKey=" + myCache.userKey ;
        }
    },
    mounted: function () {

    }
});