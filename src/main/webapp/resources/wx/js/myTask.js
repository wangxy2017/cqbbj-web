var main = new Vue({
    el: "#main",
    data: {
        orders: [],
        status: 1,
        locked: false,
        loaded: 0,
        total: 0,
        pageNum: 0,
        pageSize: 4
    },
    methods: {
        /**
         * 点击未完成执行的函数
         */
        unComplete: function () {
            // 样式切换
            $("#left").addClass("border_bottom");
            $("#right").removeClass("border_bottom");
            // 加载数据
            main.orders = [];
            main.status = 1;
            main.locked = false;
            main.loaded = 0;
            main.total = 0;
            main.pageNum = 0;
            main.pageSize = 4;
            main.loadData();
        },
        /**
         * 点击已完成执行的函数
         */
        complete: function () {
            // 样式切换
            $("#right").addClass("border_bottom");
            $("#left").removeClass("border_bottom");
            // 加载数据
            main.orders = [];
            main.status = 2;
            main.locked = false;
            main.loaded = 0;
            main.total = 0;
            main.pageNum = 0;
            main.pageSize = 4;
            main.loadData();
        },
        /**
         * 模态框点击确定事件
         */
        ascertain: function () {
            $.ajax({
                url: "/wx/order/helpDone",
                dataType: "json",
                data: {
                    "userKey": myCache.userKey,
                    "id": $("#checkId").val(),
                    "order_no": $("#checkOrderNo").val(),
                    "cashPay": $("#cashPay").val(),
                    "payNote": $("#payNote").val(),
                    "isNotPay": $("#isNotPay").is(":checked") ? 1 : 0
                },
                type: "POST",
                success:  function (result) {
                        console.log(result);
                        if (result.code == 1) {
                            //关闭模态框
                            main.end();
                            //弹出提示信息
                            setTimeout(function () {
                                toastr.success("操作成功");
                            },500);
                            //刷新当前页面
                            setTimeout(function () {
                                window.location.reload();
                            },200);
                        } else {
                            toastr.error("操作失败");
                        }
                    },
                error: function () {
                    toastr.error("服务器异常");
                }
            });
        },

        /**
         * 点击任意地方关闭模态框
         */
        end: function () {
            $(".alert_body").animate({
                marginTop: '-70rem',
            });
            setTimeout(function () {
                $(".alert_model").hide();
            }, 500);
        },
        /**
         * 点击关闭按钮隐藏模态框动画
         */
        hide: function () {
           main.end();
        },
        /**
         * 点击卡片显示隐藏的查看和收款按钮
         * @param event
         */
        open: function (event) {
            $(event.currentTarget).children('.display').fadeToggle(500);
        },
        /**
         * 点击查看跳转页面
         * @param id
         */
        view: function (id) {
            setTimeout(function () {
                window.location.href = "/wx/order/orderDetail?userKey=" + myCache.userKey + "&id=" + id;
            }, 100)

        },
        /**
         * 点击完成按钮执行的函数
         */
        finish: function (id, order_no, event) {
            // 设置选中id
            $("#checkId").val(id);
            $("#checkOrderNo").val(order_no);
            // 模态框弹出
            var _this = $(event.currentTarget);
            var mask = _this.parents("li").siblings("div");
            mask.show().find(".alert_body").animate({
                marginTop: '40rem'
            });
        },
        /**
         * 加载数据
         */
        loadData: function () {
            var _this = this;
            $.ajax({
                url: '/wx/myTask/queryTaskList',
                dataType: 'json',
                data: {
                    "userKey": myCache.userKey,
                    "pageNum": _this.pageNum++,
                    "pageSize": _this.pageSize,
                    "status": _this.status
                },
                type: "POST",
                beforeSend: function () {
                    $(".preloader").show();
                },
                complete: function () {
                    $(".preloader").hide();
                },
                success: function (result) {
                    // console.log(result);
                    if (result.code == 1) {
                        // 1.请求成功，渲染数据
                        _this.orders.push.apply(_this.orders, result.data.list);
                        // 2.更新已经加载的条数
                        _this.loaded += result.data.list.length;
                        // 3.把锁打开
                        _this.locked = false;
                        // 4.如果已加载的条数 == 总条数 ，显示已经到底
                        if (_this.loaded >= _this.total) {
                            $(".baseLine").show();
                        } else {
                            $(".baseLine").hide();
                        }
                        // 5.如果没有数据，则显示没有数据
                        if (_this.orders.length == 0) {
                            $(".notFind").show();
                            $(".baseLine").hide();
                        } else {
                            $(".notFind").hide();
                        }
                    } else {
                        toastr.error("数据加载失败!");
                    }
                },
                error: function () {
                    toastr.error("服务器异常!");
                }
            });
        }
    },
    mounted: function () {
        var _this = this;
        _this.loadData();
        /**
         * 分页
         */
        $(function () {
            //监听屏幕滚动事件
            $(window).scroll(function () {
                // 满足以下条件，请求数据
                // 1.请求锁未锁
                // 2.滚动条到底
                // 3.已经加载的条数 < 总条数
                var i = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
                if (!_this.locked && ($(document).height() - (i + $(window).height()) == 1 || $(document).height() - (i + $(window).height()) < i) && _this.loaded < _this.total) {
                    // 先上锁，避免多次请求
                    _this.locked = true;
                    // 发送请求
                    _this.loadData();
                }
            });
        });
    }
});