/**
 * 登录方法
 */
function doLogin() {
    // 验证为空
    // 发送请求
    $.ajax({
        url: "/wx/login/empLogin",//向后台发送的地址
        data: {"account": $("#account").val(), "password": $("#password").val()},//向后台传说的数据
        dateType: "json",//数据传说格式
        type: "POST",
        success: function (res) {//后台返回成功
            console.log(res);
            window.location.href="/wx/login/toHome";
        }, error: function () {

        }

    })

}