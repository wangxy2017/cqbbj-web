var calendardatetime = new lCalendar();
    calendardatetime.init({
    'trigger': '#beginTime',
    'type': 'datetime'
});

$(function () {
    /**
     * 查询关键词配置
     */
    $.ajax({
        url: "/wx/order/queryKeys",
        data: {"userKey": myCache.userKey},
        dataType: "JSON",
        type: "POST",
        success: function (result) {
            if (result.code == 1 && !isEmpty(result.data)) {
                var keys = result.data.split("/");
                console.log(keys);
                var html = "";
                for (var i = 0; i < keys.length; i++) {
                    if (!isEmpty(keys[i])) {
                        html += "<input class='col-sm-4' type='button' value='" + keys[i] + "'/>";
                    }
                }
                $("#items").empty().append(html);
                // 绑定点击事件
                $("#items input").on("click", function () {
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
            }
        }, error: function () {
            toastr.error("服务器异常");
        }
    });
    /**
     * 表单提交
     */
    $("#submit").on("click", function () {
        if (isEmpty($("#typeSelect").val())) {
            toastr.info("请选择类型");
            return;
        }
        $.ajax({
            url: "/wx/order/addOrder",
            data: {
                "userKey": myCache.userKey,
                "name": $("#name").val(),
                "phone": $("#phone").val(),
                "start": $("#start").val(),
                "end": $("#end").val(),
                "price": $("#price").val(),
                "beginTime": $("#beginTime").val() + ":00",
                "content": $("#content").val(),
                "type": $("#typeSelect").val(),
                "isNotice": $("#isNotice").is(":checked") ? 1 : 0
            },
            dataType: "JSON",
            type: "POST",
            success: function (res) {
                console.log(res);
                if (res.code == 1){
                    toastr.info("提交成功");
                    setTimeout(function () {
                        window.location.href = "/wx/login/toHome?userKey=" + myCache.userKey;
                    }, 1000);
                }else {
                    toastr.error("提交失败");
                    return;
                }
            }, error: function () {
                toastr.error("提交异常");
            }
        });
    });
});