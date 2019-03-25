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
         * 请求数据
         */
        requestData: function () {

        },
        /**
         * 取消订单
         */
        cancel: function (id,order_no) {
            if (confirm("确定取消该订单吗？")) {
                console.log("点击的确定修改!");
                // 发送异步请求，跟新订单
                // 刷新列表
                $.ajax({
                    url:"/wx/order/cancelOrderStatus",
                    data:{"id":id,"status":3,"order_no":order_no},
                    dataType:"json",
                    type:"post",
                    success:function (res) {
                        console.log(res.data);
                        window.location.href="/wx/order/sentOrder";
                    },error:function(){

                    }
                });
            }
        },
        /**
         * 显示操作按钮
         */
        showBtns: function (event) {
            var el = event.currentTarget;// 获取当前元素
            $(el).children('.display').toggle(500).css('display');
        },
        /**
         * 查看按钮
         */
        view: function (id) {
            window.location.href = "/wx/order/orderDetail?id="+ id ;
        },
        /**
         * 修改按钮
         */
        modify: function (id) {
            window.location.href = "/wx/order/orderUpdate?id="+ id ;
        },
        /**
         * 辅助完成
         */
        finish: function (order_no) {
            window.location.href="/wx/order/finishOrder?order_no="+ order_no;


        }
    },
    mounted: function () {
        // 初始化
        this.$http.post("/wx/order/queryPageListEmployee", {
            "status": 1,
            pageNum:1,
            pageSize:4
        }, {emulateJSON: true}).then(function (res) {
            console.log(res.body);
            if (res.body.code == 1) {
                main.orders = res.body.data.list;
                // 分页准备工作--赋值
                main.loaded = res.body.data.list.length;
                main.loaded = res.body.data.total;
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

