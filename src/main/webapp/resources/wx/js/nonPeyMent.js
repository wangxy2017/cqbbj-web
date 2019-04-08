var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        /**
         * 点击卡片显示隐藏的查看按钮
         */
        checkOver:function (event) {
            $(event.currentTarget).children('.display').fadeToggle(500);
        }
    },
    mounted: function () {

    }
});