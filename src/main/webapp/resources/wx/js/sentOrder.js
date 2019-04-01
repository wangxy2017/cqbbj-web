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
         * 加载数据
         */
        loadData: function () {
            var _this = this;
            $.ajax({
                url: '/wx/order/queryPageListEmployee',
                dataType: 'json',
                data: {
                    "pageNum": _this.pageNum++,
                    "pageSize": _this.pageSize,
                    "is_clean": _this.is_clean,
                    "status": _this.status
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
        },
        /**
         * 作废订单事件
         */
        cancel: function (id, order_no, event) {
            // 设置选中id
            $("#checkId").val(id);
            $("#checkOrderNo").val(order_no);
            // 模态框弹出
            var _this = $(event.currentTarget);
            var mask = _this.parents("li").siblings("div");
            console.log(mask);
            mask.show().find(".alert_body").animate({
                marginTop: '40rem'
            });
        },
        /**
         * 模态框点击确定事件
         */
        ascertain: function () {
            var id = $("#checkId").val();
            var order_no = $("#checkOrderNo").val();
            $.ajax({
                url: "/wx/order/cancelOrderStatus",
                data: {
                    "id": id,
                    "status": 3,
                    "order_no": order_no
                },
                dataType: "json",
                type: "post",
                success: function (res) {
                    if (res.code == 1) {
                        toastr.success("操作成功");
                        // console.log(res.data);
                        setTimeout(function () {
                            window.location.href = "/wx/order/sentOrder";
                        },500)
                    }
                }, error: function () {
                    toastr.error("数据异常");
                }
            });
            // 刷新列表
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
         * 修改按钮
         */
        modify: function (id) {
            window.location.href = "/wx/order/orderUpdate?id=" + id;
        },
        /**
         * 辅助完成
         */
        finish: function (id, order_no) {
            window.location.href = "/wx/order/finishOrder?id=" + id + "&order_no=" + order_no;
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

