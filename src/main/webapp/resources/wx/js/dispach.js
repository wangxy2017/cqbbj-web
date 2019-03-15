// $(document).ready(function () {
//     /**
//     *
//      给li绑定绑定事件
//     */
//     $(".list-li").click(function () {
//         // $(this).children('.display').slideToggle(200).css('display');
//         $(this).children('.display').toggle(500).css('display');
//     });
//
//     // 查看阻止冒泡
//     $(".view").on("click", function (e) {
//         e.stopPropagation();
//         // console.log("阻止冒泡");
//         window.location.href = "orderdetail.html";
//     });
//     //派单阻止冒泡
//     $(".sent").on("click", function (e) {
//         e.stopPropagation();
//         window.location.href ="sentOrder.html";
//     });
//     //辅助阻止冒泡
//     $(".assist").on("click", function (e) {
//         e.stopPropagation();
//         window.location.href = "assist.html"
//
//     });
//     //取消阻止冒泡
//     $(".abolish").on("click", function (e) {
//         e.stopPropagation();
//     });
//
// });
//
// /**
//  * 取消
//  */
// function cancel() {
//     if (confirm("确定取消该订单吗？")) {
//         console.log("点击的确定修改!");
//         // 发送异步请求，跟新订单
//         // 刷新列表
//     }
// }

var main = new Vue({
    el: "#main",
    data: {
        orders: []
    },
    methods: {
        /**
         * 请求数据
         */
        requestData: function () {

        }
    },
    mounted: function () {
        // 初始化
        this.$http.post("/wx/order/queryPageListEmployee", {
            "status":1,
            "pageNum": 1,
            "pageSize": 4
        }, {emulateJSON: true}).then(function (res) {
            // console.log(res.body);
            if (res.body.code == 1) {
                main.orders = res.body.data.list;
            }
        }, function (res) {
            console.log(res.body);
        });
        // 分页
        $(document).height() - $(window).height() - $(window).scrollTop() == 0;

        var flag = true;// 请求开关
        var loaded = 4;// 已经加载的条数
        var total = 20;// 总条数
        $(function () {
            // 监听滚动事件
            $(window).scroll(function () {
                // 当滚动到底的时候，异步加载数据
                if ($(document).height() - $(window).height() - $(window).scrollTop() < 50) {
                    // 当已加载的条数 >= 总条数，关闭开关，显示已经到底
                    if (loaded >= total) {
                        flag = false;
                        $(".loading").show();
                    }
                    // 当开关打开时，发送请求
                    if (flag) {
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
                                    flag = true;
                                    // 更新已经加载的条数
                                    loaded += result.data.list.length;
                                    console.log("已经加载" + loaded + "条");
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
                        flag = false;
                    }
                }
            });
        });
    }
});

