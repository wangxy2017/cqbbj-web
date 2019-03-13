$(document).ready(function () {
    /**
     *
     给li绑定绑定事件
     */
    $(".list-li").click(function () {
        // $(this).children('.display').slideToggle(200).css('display');
        $(this).children('.display').toggle(500).css('display');
    });

    // 查看阻止冒泡
    $(".view").on("click", function (e) {
        e.stopPropagation();
        // console.log("阻止冒泡");
        window.location.href = "orderdetail.html";
    });
    //修改阻止冒泡
    $(".sent").on("click", function (e) {
        e.stopPropagation();
        window.location.href ="change.html";
    });
    //辅助阻止冒泡
    $(".assist").on("click", function (e) {
        e.stopPropagation();
        window.location.href = "assist.html"

    });
    //取消阻止冒泡
    $(".abolish").on("click", function (e) {
        e.stopPropagation();
    });

});

/**
 * 取消
 */
function cancel() {
    if (confirm("确定取消该订单吗？")) {
        console.log("点击的确定修改!");
        // 发送异步请求，跟新订单
        // 刷新列表
    }
}