var main = new Vue({
    el: "#main",
    data: {
        orders: [],
        flag: true,
        loaded: 0,
        total: 0
    },
    methods: {
        /**
         * 模态框点击确定事件
         */
        ascertain: function () {
                var id = $("#checked").val();
            console.log(id);
            $.ajax({
                url: "/wx/order/updateOrderStatus",
                data: {"id": id, "status": 3},
                dataType: "json",
                type: "post",
                success: function (res) {
                    console.log(res.data);
                    window.location.href = "/wx/order/unSentOrder";
                }, error: function () {


                }
            });
            // 刷新列表
        },
        /**
         * 模态框点击取消事件
         */
        outMolde: function () {
            setTimeout(function () {
                toastr.info("你放弃了操作");
            }, 500)

        },
        /**
         * 点击任意地方关闭弹窗
         */
        end: function () {
            $(".alert_body").animate({
                marginTop: '-50rem',
            });
            setTimeout(function () {
                $(".alert_model").css("display", "none");
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
                $(".alert_model").css("display", "none");
            }, 500);

        },
        /**
         * 作废订单事件
         */
        cancel: function (id,event) {
            $("#checked").val(id);
            var _this = $(event.currentTarget);
            var mask = _this.parents("li").siblings("div");
            console.log(mask);
            mask.show().find(".alert_body").animate({
                marginTop: '40rem'
            });

        },
        /**
         * 显示操作按钮
         */
        showBtns: function (event) {
            $(event.currentTarget).children('.display').fadeToggle(500);
        },
        /**
         * 查看按钮
         */
        view: function (id) {

            window.location.href = "/wx/order/orderDetail?id=" + id;

        },

        /**
         * 派单按钮
         */
        dispatch: function (order_no) {
            window.location.href = "/wx/order/dispatch?order_no=" + order_no;
        },

        /**
         * 修改按钮
         */
        modify: function (id) {
            window.location.href = "/wx/order/orderUpdate?id=" +id;
        },
    },
    mounted: function () {
        // 初始化
        this.$http.post("/wx/order/queryPageListEmployee", {
            "status": 0,
            pageNum: 1,
            pageSize:4
        }, {emulateJSON: true}).then(function (res) {
            console.log(res.body);
            if (res.body.code == 1) {
                main.orders = res.body.data.list;
                // 分页准备工作--赋值
                main.loaded = res.body.data.list.length;
                main.loaded = res.body.data.total;
                /**
                 *  判断页面是否有数据如果没有就显示暂无数据
                 */
                if ( main.orders.length == 0){
                    $(".notFind").show();
                }else {
                    $(".notFind").hide();
                };
                /**
                 * 判断结束
                 */
            }
        }, function (res) {
            console.log(res.body);
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

