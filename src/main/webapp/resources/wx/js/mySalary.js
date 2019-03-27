var main = new Vue({
    el: "#main",
    data: {
        salarys: [],
        flag: false,
        loaded: 0,
        total: 0,
        pageNum: 0,
        pageSize: 4
    },
    methods: {
        display: function (event) {
            var _this = $(event.currentTarget);
            var div = $(this.$el);
            _this.children('.footer').fadeToggle(500);
        },
        /**
         * 修改点击事件
         */
        update: function (id) {
            window.location.href = "/wx/salary/salaryUpdate?id=" + id;
        },
        /**
         * 点击确定事件
         */
        ascertain: function (id) {
            console.log(id);
            // return;
            $.ajax({
                url: "http://192.168.0.100:9000/wx/salary/delete",
                dataType: "json",
                data: {
                    "id": id
                },
                type: "POST",
                success: function (result) {
                    if (result.code == 1) {
                        // 刷新页面
                        toastr.success("操作成功");
                        $(".alert_body").animate({
                            marginTop: '-50rem',
                        });
                        setTimeout(function () {
                            $(".alert_model").hide();
                        }, 1000)
                        setTimeout(function () {
                            window.location.reload();
                        }, 500)
                    } else {
                        toastr.error("删除失败");
                    }

                },
                error: function () {
                    toastr.error("服务异常");
                }
            });
        },
        /**
         * 点击取消事件
         */
        outMolde: function () {
            setTimeout(function () {
                toastr.info("你放弃了操作");
            }, 500)

        },
        /**
         * 点击删除事件
         */
        open: function (event) {
            var _this = $(event.currentTarget);
            var mask = _this.parent().parent().next();
            mask.show().find(".alert_body").animate({
                marginTop: '40rem',
            });
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

    },
    mounted: function () {
        // 初始化
        this.$http.post("http://192.168.0.100:9000/wx/salary/queryPageList", {
            //当前页面
            "pageNum": this.pageNum
            //展示数据
            , "pageSize": this.pageSize

        }, {emulateJSON: true}).then(function (res) {
            console.log(res.body);
            if (res.body.code == 1) {
                main.salarys = res.body.data.list;
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
        $(function () {
            //监听屏幕滚动事件
            $(window).scroll(function () {
                // 满足以下条件，请求数据
                // 1.请求锁未锁
                // 2.滚动条到底
                // 3.已经加载的条数 < 总条数
                var i = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
                if (!main.locked && ($(document).height() - (i + $(window).height()) == 1 || $(document).height() - (i + $(window).height()) < i) && main.loaded < main.total) {
                    // 先上锁，避免多次请求
                    main.locked = true;
                    // toastr.info("成功");
                    // 发送请求
                    $.ajax({
                        url: 'http://192.168.0.100:9000/wx/salary/queryPageList',
                        dataType: 'json',
                        data: {
                            "pageNum": main.pageNum++,
                            "pageSize": main.pageSize
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
                                var salarys = main.salarys;
                                salarys.push.apply(salarys, result.data.list);
                                // 2.更新已经加载的条数
                                main.loaded += result.data.list.length;
                                console.log("已经加载" + main.loaded + "条");
                                // 3.把锁打开
                                main.locked = false;
                                // 4.如果已加载的条数 == 总条数 ，显示已经到底
                                if (main.loaded >= main.total) {
                                    $(".baseLine").show();
                                } else {
                                    $(".baseLine").hide();
                                }
                            }
                        },
                        error: function () {
                            toastr.error("服务器显示异常!");
                        }
                    });
                }
            });


        })
    }
});