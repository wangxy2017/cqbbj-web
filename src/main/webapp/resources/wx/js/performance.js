

var main = new Vue({
    el: "#magnifying",
    data: {},
    methods: {
        search: function () {
            /**
             * 点击放大镜显示搜索框
             */
            $("#header").animate({
                marginTop:'150px',
            });
        }
    },
    mounted: function () {

    }
});

var main = new Vue({
    el: "#header",
    data: {},
    methods: {
        vivw: function () {

            $("#header").animate({
                marginTop:'-60rem',
            });
        },
        /**
         * 点击选择员工打开模态框
         */
        open: function () {
                $(".alert_model").show();

            $(".alert_body").animate({
                marginTop: '40rem',
            });
        }
    },
    /**
     * 调出时间插件
     */
    mounted: function () {
        var calendardatetime = new lCalendar();
        calendardatetime.init({
            'trigger': '#beginTime',
            'type': 'date'
        });
    }
});


var main = new Vue({
    el: "#main",
    data: {},
    methods: {
        /**
         * 点击任意地方关闭弹窗
         */
        end: function () {
            $(".alert_body").animate({
                marginTop: '-50rem',
            });
            setTimeout(function () {
                $(".alert_model").hide();
            }, 500);
        },
        /**
         * 点击关闭按钮动画
         */
        hide: function () {
            $(".alert_body").animate({
                marginTop: '-50rem',
            });
            setTimeout(function () {
                $(".alert_model").hide();
            }, 500);

        }

    },
    mounted: function () {

    }
});