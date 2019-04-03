var main = new Vue({
    el: "#main",
    data: {
        orders: [],
        locked: false,
        loaded: 0,
        total: 0,
        pageNum: 1,
        pageSize: 4,
        is_clean: 0// 未结算
    },
    methods: {
        /**
         * 显示按钮
         * @param event
         */
        showBtn:function(event){
            var _this=$(event.currentTarget);
            _this.children('.display').toggle(500).css('display');
        },
        /**
         * 查看详情
         * @param id
         */
        view:function(id){
            window.location.href="/wx/order/orderDetail?id="+id;
        },
        /**
         * 结算
         */
        clean:function(){
            window.location.href="/wx/order/cleanDetail?id="+id;
        },
        /**
         * 点击未结算
         */
        unClean: function () {
            // 切换样式
            $("#left").addClass("border_bottom");
            $("#right").removeClass("border_bottom");
            // 加载数据
            main.orders = [];
            main.locked = false;
            main.loaded = 0;
            main.total = 0;
            main.pageNum = 0;
            main.pageSize = 4;
            main.is_clean = 0// 已结算
            main.loadData();
        },
        /**
         * 点击已结算
         */
        cleaned: function () {
            // 切换样式
            $("#right").addClass("border_bottom");
            $("#left").removeClass("border_bottom");
            // 加载数据
            main.orders = [];
            main.locked = false;
            main.loaded = 0;
            main.total = 0;
            main.pageNum = 0;
            main.pageSize = 4;
            main.is_clean = 1// 已结算
            main.loadData();
        },
        /**
         * 加载数据
         */
        loadData: function () {
            var _this = this;
            $.ajax({
                url: '/wx/financeClean/queryPageList',
                dataType: 'json',
                data: {
                    "userKey": myCache.userKey,
                    "pageNum": _this.pageNum++,
                    "pageSize": _this.pageSize,
                    "is_clean": _this.is_clean
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
                        //更新总条数
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