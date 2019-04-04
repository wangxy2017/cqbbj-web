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
                window.location.href = url + "?userKey=" + myCache.userKey;
            }
        },
        /**
         * 我的任务
         */
        myTask: function () {
            window.location.href = "/wx/order/myTask" + "?userKey=" + myCache.userKey;
        },
        /**
         * 我的钱包
         */
        wallet: function () {
            window.location.href = "/wx/payRecord/wallet" + "?userKey=" + myCache.userKey;
        },
        /**
         * 退出系统
         */
        logout: function () {
            main.$http.post("/wx/order/loginOut", {"userKey": myCache.userKey}, {emulateJSON: true}).then(function (res) {
                if (res.body.code == 1) {
                    window.localStorage.removeItem("userKey");
                    window.location.href = "/wx/login/toLogin";
                } else {
                    toastr.info("操作失败");
                }
            }, function (res) {
                toastr.error("服务器异常");
            });
        }
    },
    mounted: function () {
        var _this = this;
        _this.$http.post("/wx/menu/queryPageList", {"userKey": myCache.userKey}, {emulateJSON: true}).then(function (res) {
            console.log(res.body);
            // return;
            if (res.body.code == 1 && res.body.data.length > 0) {
                _this.menus = res.body.data[0].childs;
            } else {
                toastr.info("数据异常");
            }
        }, function (res) {
            toastr.error("服务器异常");
        });
        _this.$http.post("/wx/login/getEmpName", {"userKey": myCache.userKey}, {emulateJSON: true}).then(function (res) {

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