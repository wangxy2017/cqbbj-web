var main = new Vue({
    el: "#main",
    data: {
        signBills: [],
        flag: false,
        loaded: 0,
        total: 0,
        status: 0,
        pageNum: 1,
        pageSize: 4
    },
    methods: {
        /**
         * 点击卡片打开隐藏的收款按钮
         */
        taskSwitch: function (event) {
            var _this = $(event.currentTarget);
            _this.children('.display').toggle(500).css('display');
        },
        /**
         * 点击收款按钮事件
         */
        receipt: function (id, event) {
            /**
             * 把当前页面的订单号码传送给跳转的页面
             * @type {string}
             */
            var url = "/wx/signBill/payment?id=" + id + "&order_no=" + encodeURI($("#order_no").text());
            window.location.href = url;
        },
        /**
         * 点击已付款
         */
        havePaid: function (event) {
            // 样式切换
            var _this = $(event.currentTarget);
            _this.addClass("border-buttom").siblings().removeClass("border-buttom");
            $(".havePaid").show();
            $(".non-payment").hide();
            // 请求数据
            $.ajax({
                url: "/wx/signBill/queryPageList",
                dataType: "json",
                data: {
                    "pageNum": this.pageNum
                    //展示数据
                    , "pageSize": this.pageSize
                    , "status": 1
                },
                type: "POST",
                success: function (result) {
                    console.log(result);
                    main.signBills = result.data.list;
                    main.status = 1;
                    // return;
                },
                error: function () {

                }
            });
        },
        /**
         * 点击未付款
         */
        payment: function () {
            // 样式切换
            var _this = $(event.currentTarget);
            _this.addClass("border-buttom").siblings().removeClass("border-buttom");
            $(".non-payment").show();
            $(".havePaid").hide();
            // 发送请求
            $.ajax({
                url: "/wx/signBill/queryPageList",
                dataType: "json",
                data: {
                    "pageNum": this.pageNum
                    //展示数据
                    , "pageSize": this.pageSize
                    , "status": 0
                },
                type: "POST",
                success: function (result) {
                    main.signBills = result.data.list;
                    main.status = 0;
                    // return;
                },
                error: function () {

                }
            });
        }

    },
    mounted: function () {
        /**
         * 加载数据
         */
        this.$http.post("/wx/signBill/queryPageList", {
            //当前页面
            "pageNum": this.pageNum
            //展示数据
            , "pageSize": this.pageSize
            , "status": 0

        }, {emulateJSON: true}).then(function (res) {
            if (res.body.code == 1) {
                main.signBills = res.body.data.list;
                // 分页准备工作--赋值
                main.loaded = res.body.data.list.length;
                main.total = res.body.data.total;
            }
        }, function (res) {
            console.log(res.body);
        });
        /**
         * 分页
         */
        // return;
        $(function () {
            //监听屏幕滚动事件
            $(window).scroll(function () {
                // 当滚动到底且有未加载的数据的时候，开启开关，异步加载数据
                var i = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
                if ($(document).height() - (i + $(window).height()) == 1) {
                    console.log("滚动到底打印：", main.loaded, main.total);
                    // 当已加载的条数 >= 总条数，关闭开关，显示已经到底
                    if (main.loaded >= main.total) {
                        main.flag = false;
                        $(".baseLine").show();
                    } else {
                        main.flag = true;
                        $(".baseLine").hide();
                    }
                }
                // 当开关打开时，发送请求
                if (main.flag) {
                    // 进入方法，关闭开关，保证只请求一次
                    main.flag = false;
                    $.ajax({
                        url: '/wx/signBill/queryPageList',
                        dataType: 'json',
                        data: {
                            "pageNum": main.pageNum++,
                            "pageSize": main.pageSize,
                            "status": main.status
                        },
                        type: "POST",
                        beforeSend: function () {
                            $(".loading").show();
                        },
                        complete: function () {
                            $(".loading").hide();
                        },
                        success: function (result) {
                            console.log(result);
                            if (result.code == 1) {
                                var signBills = main.signBills;
                                signBills.push.apply(signBills, result.data.list);
                                // 更新已经加载的条数
                                main.loaded += result.data.list.length;
                                console.log("已经加载" + main.loaded + "条");
                            }
                        },
                        error: function () {
                            toastr.error("服务器显示异常!");
                        }
                    });
                }
            });
        });
    }
});