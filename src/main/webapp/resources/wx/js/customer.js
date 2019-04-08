var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        nonPeyment:function () {
            window.location.href ="/resources/wx/customer/nonPeyMent.html?userKey=" + myCache.userKey ;
        }
    },
    mounted: function () {

    }
});