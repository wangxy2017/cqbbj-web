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
         * 点击未完成
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
            // $.ajax({
            //     url:"/wx/myTask/queryTaskList",
            //     data:{status:1 ,pageNum:1,
            //         pageSize:4},
            //     dataType:"JSON",
            //     type:"POST",
            //     success:function(result){
            //         console.log(result);
            //         main.orders=result.data.list;
            // },error:function(){
            //         toastr.error("数据异常");
            //     }
            // })
        },
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
            // $.ajax({
            //     url:"/wx/myTask/queryTaskList",
            //     data:{status:2 ,pageNum:1,
            //         pageSize:4},
            //     dataType:"JSON",
            //     type:"post",
            //     success:function(result){
            //         console.log(result);
            //         main.orders=result.data.list;
            //     },error:function(){
            //         toastr.error("数据异常");
            //     }
            // })
        },
        view: function (id) {
            setTimeout(function () {
                window.location.href = "/wx/order/orderDetail?id=" + id;
            }, 100)

        },
        open: function (event) {
            // console.log("123");
            var el = event.currentTarget;
            $(el).children('.display').toggle(500).css('display');
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
                    "pageNum": _this.pageNum++,
                    "pageSize": _this.pageSize,
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
        // return;
        // /**
        //  * tab切换函数
        //  */
        //     $(".title .col-sm-5").click(function () {
        //         $(this).addClass("border_bottom").siblings().removeClass("border_bottom");
        //         var c = document.getElementsByClassName("complete");
        //         var i =$(this).attr('data-show');
        //         c = i;
        //         if(i!=0){
        //             $(".complete").hide();
        //             $(".unfinished").show();
        //         }else {
        //             $(".complete").show();
        //             $(".unfinished").hide();
        //         }
        //
        //     });
        //
        //
        //     this.$http.post("/wx/myTask/queryTaskList",{
        //         status:1,
        //         pageNum:1,
        //         pageSize:4
        //     },{emulateJSON:true}).then(function (res) {
        //         console.log(res.body);
        //         this.orders=res.body.data.list;
        //     },function () {
        //         toastr.error("数据异常");
        //     })
    }
});