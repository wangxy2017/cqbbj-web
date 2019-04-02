var main = new Vue({
    el: "#main",
    data: {
        menus: [],
        empName: "请登录",
        task: 0,
        money: 0.00
    },
    methods: {
        /**
         * 菜单跳转
         * @param url
         */
        tiaozhuan: function (url) {
            if (!isEmpty(url)) {
                window.location.href = url + "?key=" + myCache.userKey;
            }
        },
        /**
         * 我的任务
         */
        myTask: function () {
            window.location.href = "/wx/order/myTask" + "?key=" + myCache.userKey;
        },
        /**
         * 我的钱包
         */
        wallet: function () {
            window.location.href = "/wx/payRecord/wallet" + "?key=" + myCache.userKey;
        }
    },
    mounted: function () {
        var _this = this;
        _this.$http.post("/wx/menu/queryPageList", {"key": myCache.userKey}, {emulateJSON: true}).then(function (res) {
            console.log(res.body);
            // return;
            if (res.body.code == 1 && res.body.data.length > 0) {
                _this.menus = res.body.data[0].childs;
                // 如果没有数据，则显示没有数据
                if (_this.menus.length == 0) {
                    $(".notFind").show();
                } else {
                    $(".notFind").hide();
                }
            } else {
                toastr.info("数据异常");
            }
        }, function (res) {
            toastr.error("服务器异常");
        });
        this.$http.post("/wx/login/getEmpName", {"key": myCache.userKey}, {emulateJSON: true}).then(function (res) {

            if (res.body.code == 1) {
                this.empName = res.body.data.name;
                this.task = res.body.data.task;
                this.money = res.body.data.money;
            }
        }, function (res) {
            toastr.error("服务器异常");
        });
    }
});