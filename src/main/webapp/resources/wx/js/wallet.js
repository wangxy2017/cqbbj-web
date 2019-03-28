//
// $.ajax({
//     url: "",// 请求地址
//     dataType: "json",// 请求参数类型
//     data: {},// 请求参数
//     type: "POST",// 请求方式
//     success: function (result) {},// 请求成功回调
//     error: function () {}// 请求失败回调
// });

var main = new Vue({
    el: "#main",
    data: {
        wallets: [],
        locked: false,
        loaded: 0,
        total: 0,
        pageNum: 0,
        pageSize: 4,
        employee: {}
    },
    methods: {
        /**
         * 加载数据
         */
        loadData: function () {
            var _this = this;
            $.ajax({
                url: '/wx/wallet/queryPageList',
                dataType: 'json',
                data: {
                    "pageNum": _this.pageNum++,
                    "pageSize": _this.pageSize
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
                        _this.wallets.push.apply(_this.wallets, result.data.list);
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
        this.$http.post("/wx/wallet/queryResult", {}, {emulateJSON: true}).then(function (res) {
            console.log(res.body);
            if (res.body.code == 1)
                main.employee = res.body.data;
        }, function () {
            toastr.error("数据异常");
        });
        // this.$http.post("/wx/wallet/queryPageList", {
        //     pageNum: 1,
        //     pageSize: 4
        // }, {emulateJSON: true}).then(function (res) {
        //     console.log(res.body);
        //     if (res.body.code == 1)
        //         main.wallets = res.body.data.list;
        // }, function () {
        //     toastr.error("数据异常");
        // });
    }

});


$(document).height() - $(window).height() - $(window).scrollTop() == 0;

$(function () {
    var $list = $('.list');
    var $loading = $('.loading');
    var htmlNodes = '';
    var isEnd = false;
    var pageNum = 0;
    $(window).scroll(function () {
        if (isEnd) {
            return;
        }
        if ($(document).height() - $(window).height() - $(window).scrollTop() > 50) {
            $.ajax({
                type: 'post',
                url: '',
                data: {
                    pageSize: 10,
                    pageNum: pageNum++,
                },
                dataType: 'json',
                success: function (res) {
                    // render the list
                },
                beforeSend: function () {
                    $loading.show();
                },
                complete: function () {
                    $loading.hide();
                }
            });
        }
    });
});