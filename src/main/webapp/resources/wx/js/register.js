var main = new Vue({
    el: "#main",
    data: {
        name: "",
        phone: "",
        code: ""
    },
    methods: {
        /**
         * 注册
         */
        regist: function () {
            // 参数校验
            var name = main.name;
            if (isEmpty(name)) {
                toastr.error("姓名不能为空！");
                return;
            }
            var phone = main.phone;
            if (isEmpty(phone)) {
                toastr.error("请输入您的手机号码！");
                return;
            }
            var code = main.code;
            if (isEmpty(code)) {
                toastr.error("请输入您收到的6位数短信验证码");
                return;
            }
            // 发送请求
            main.$http.post("/wx/login/regist", {
                "name": main.name,
                "phone": main.phone,
                "code": main.code
            }, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                window.location.href="/wx/customer/customer?userKey=" + myCache.userKey;
            }, function (res) {
                console.log(res.body);
                toastr.error("服务器异常！");
            });
        },
        /**
         * 获取验证码
         */
        getCode: function () {
            main.$http.post("/wx/login/getCode", {
                "phone": main.phone
            }, {emulateJSON: true}).then(function (res) {
                console.log(res.body);

            }, function (res) {
                // console.log(res);错误时返回的值
            });
        }
    },
    mounted: function () {
        // 发送异步请求
        // main.order.order_no = "12332321321"
    }
});
