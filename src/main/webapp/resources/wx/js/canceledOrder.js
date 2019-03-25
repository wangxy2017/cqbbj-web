var main = new Vue({
    el: "#main",
    data: {

        orders: {},
        flag: true,
        loaded: 0,
        total: 0
    },
    //方法
    methods: {
        /**
         * 点击卡片显示隐藏查看和回访
         * **/
        display:function (event) {
            var el = event.currentTarget;// 获取当前元素
            $(el).children('.display').toggle(500).css('display');
        },
        /**
         * 查看跳转页面
         * */
        view: function (id) {
            window.location.href = "/wx/order/orderDetail?id=" + id;
        },
        /**
         * 还原跳转页面
         * */
        restore: function (id) {
            $.ajax({
                //向后台发送请求地址
                url: "/wx/order/updateOrderStatus",
                dataType: "json",
                data: {
                    "id": id,
                    "status": 0
                },
                type: "POST",
                /**
                 * 请求成功执行的函数
                 * */
                success: function (result) {
                    //{code:1,msg:success}
                    if (result.code == 1) {
                        toastr.success('恢复成功');
                        window.location.herf = "/wx/order/unSentOrder";
                    } else {
                        toastr.error("操作失败");
                    }
                },
                error: function () {
                    toastr.warning("服务器异常");
                }
            });


        },
    },
    mounted: function () {

        this.$http.post("/wx/order/queryPageListEmployee", {
            status: 3,
            pageNum: 1,
            pageSize: 4
        }, {emulateJSON: true})
            .then(function (res) {
                console.log(res);
                if (res.body.code == 1) {
                    main.orders = res.body.data.list;
                    // 分页准备工作--赋值
                    main.loaded = res.body.data.list.length;
                    main.loaded = res.body.data.total;
                }
            }, function () {
                toastr.error("数据异常");
            });
        // 分页
        $(function () {
            // 监听滚动事件
            $(window).scroll(function () {
                // 当滚动到底的时候，异步加载数据
                if ($(document).height() - $(window).height() - $(window).scrollTop() == 50) {
                    // 当已加载的条数 >= 总条数，关闭开关，显示已经到底
                    if (main.loaded >= main.total) {
                        main.flag = false;
                        $(".loading").show();
                    }
                    // 当开关打开时，发送请求
                    if (main.flag) {
                        $.ajax({
                            url: '/wx/order/queryPageList',
                            dataType: 'json',
                            data: {
                                "pageNum": 2,
                                "pageSize": 4
                            },
                            type: "POST",
                            success: function (result) {
                                console.log(result);
                                if (result.code == 1) {
                                    var orders = main.orders;
                                    orders.push.apply(orders, result.data.list);
                                    // 当数据成功加载后，再次打开开关，方便下一次请求
                                    main.flag = true;
                                    // 更新已经加载的条数
                                    main.loaded += result.data.list.length;
                                    console.log("已经加载" + main.loaded + "条");
                                }
                            },
                            beforeSend: function () {
                                // $loading.show();
                            },
                            complete: function () {
                                // $loading.hide();
                            },
                            error: function () {

                            }
                        });
                        // 关闭开关
                        main.flag = false;
                    }
                }
            });
        });
    }
});

