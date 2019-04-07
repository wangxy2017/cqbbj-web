

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

var header = new Vue({
    el: "#header",
    data: {
        emps:[],
    },
    methods: {
        /**
         * 点击任意地方关闭弹窗
         */
        end: function () {
            $(".alert_body").animate({
                marginTop: '-100rem',
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
                marginTop: '-100rem',
            });
            setTimeout(function () {
                $(".alert_model").hide();
            }, 500);

        },
        /**
         * 点击关闭隐藏检索界面
         */
        close: function () {

            $("#header").animate({
                marginTop:'-60rem',
            });
        },
        /**
         * 点击员工打开模态框获取员工列表
         */
        open: function () {
            header.$http.post("/wx/employee/queryPageList", {"userKey": myCache.userKey}, {emulateJSON: true}).then(function (res) {
                // console.log(res.body);
                // [{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx},{name:xxx,emp_no:xxx}]
                header.emps = res.body.data;
            }, function (res) {

            });

            $(".alert_model").show();

            $(".alert_body").animate({
                marginTop: '40rem',
            });

        },
        click: function () {
            toastr.info("你选择了确定");
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


    },
    mounted: function () {

    }
});