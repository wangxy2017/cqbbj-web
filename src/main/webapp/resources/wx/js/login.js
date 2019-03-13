/**
 * 登录方法
 */
function doLogin() {
    // 验证为空
    // 发送请求
    $.ajax({
        url: "/wx/login/empLogin",
        data: {"account": $("#account").val(), "password": $("#password").val()},
        dateType: "json",
        type: "POST",
        success: function (res) {
            console.log(res);
            windows.location.href="wx/login/home"
        }, error: function () {

        }

    })

}