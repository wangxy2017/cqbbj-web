var main = new Vue({
    el: "#main",
    data: {
        orders: [],
        locked: false,
        loaded: 0,
        total: 0,
        pageNum: 0,
        pageSize: 4,
        status: 2
    },
    //方法
    methods: {

        /**
         * 点击卡片显示隐藏查看和回访
         * **/
        display: function (event) {
            $(event.currentTarget).children('.display').fadeToggle(500);
        },
        /**
         * 查看跳转页面
         * */
        view: function (id) {

            window.location.href = "/wx/order/orderDetail?id=" + id;

        },
        /**
         * 回访跳转页面
         * */
        callback: function (id) {

            window.location.href = "/wx/order/callback?id=" + id;

        },
        /**
         * 加载数据
         */
        loadData: function () {
            var _this = this;
            $.ajax({
                url: "/wx/order/queryPageListEmployee",
                dataType: 'json',
                data: {
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
                    console.log(result);
                    if (result.code == 1) {
                        // 1.请求成功，渲染数据
                        _this.orders.push.apply(_this.orders, result.data.list);
                        // 2.更新已经加载的条数
                        _this.loaded += result.data.list.length;
                        // 更新总条数
                        _this.total = result.data.total;
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
            // 初始化
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

