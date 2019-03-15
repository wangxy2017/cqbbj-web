$(function () {
    $("ul input").on("click", function () {
        if ($(this).hasClass("active")) {
            // 移除样式
            $(this).removeClass("active");
            // 执行操作
            console.log("取消");
            var text = $("#content").val();
            var value = $(this).val() + "/";
            if (text.indexOf(value) != -1) {
                $("#content").val(text.replace(value, ""));
            }
        } else {
            // 追加样式
            $(this).addClass("active");
            // 执行操作
            console.log("追加");
            var text = $("#content").val();
            var value = $(this).val() + "/";
            if (text.indexOf(value) == -1) {
                $("#content").val(text + value);
            }
        }
    });

});
$(function () {
   $("#submit").on("click",function(){

       $.ajax({
           url: "/wx/order/addOrder",
           data: {"name": $("#name").val(),
               "phone": $("#phone").val(),
               "start": $("#start").val(),
               "end": $("#end").val(),
               "price": $("#price").val(),
               "beginTime": $("#beginTime").val(),
               "content": $("#content").val(),
               "isNotice": $("#isNotice").val()
               },
           dateType: "json",
           type: "POST",
           success: function (res) {
               console.log(res);
               window.location.href="/wx/login/toHome";
           }, error: function () {

           }

       })

   })

});