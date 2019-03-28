var calendardatetime = new lCalendar();
calendardatetime.init({
    'trigger': '#beginTime',
    'type': 'datetime'
});

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
    $("#submit").on("click", function () {

        $.ajax({
            url: "/wx/order/addOrder",
            data: {
                "name": $("#name").val(),
                "phone": $("#phone").val(),
                "start": $("#start").val(),
                "end": $("#end").val(),
                "price": $("#price").val(),
                "beginTime": $("#beginTime").val() + ":00",
                "content": $("#content").val(),
                "type": $("input[name='type']:checked").val(),
                "isNotice": $("#isNotice").is(":checked") ? 1 : 0
            },
            dateType: "json",
            type: "POST",
            success: function (res) {
                console.log(res);
                toastr.info("提交成功");
                setTimeout(function () {
                    window.location.href = "/wx/login/toHome";
                }, 1000);
            }, error: function () {
                toastr.error("提交异常");
            }

        })

    })

});
// layui.use(["laydate"], function () {
//
//     var laydate = layui.laydate;
//
//     var main = new Vue({
//         el: "#main",
//         data: {},
//         methods: {
//             initCalander: function () {
//                 //保险到期
//                 laydate.render({
//                     elem: '#beginTime',
//                     type: "datetime",
//                 });
//
//             },
//             mounted: function () {
//                 this.initCalander();
//
//             }
//         }
//     });
// })