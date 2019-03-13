$(function () {
    $("ul input").on("click", function () {
        if ($(this).hasClass("active")) {
            // 移除样式
            $(this).removeClass("active");
            // 执行操作
            console.log("取消");
            var text = $("#text").val();
            var value = $(this).val() + "/";
            if (text.indexOf(value) != -1) {
                $("#text").val(text.replace(value, ""));
            }
        } else {
            // 追加样式
            $(this).addClass("active");
            // 执行操作
            console.log("追加");
            var text = $("#text").val();
            var value = $(this).val() + "/";
            if (text.indexOf(value) == -1) {
                $("#text").val(text + value);
            }
        }
    });
});