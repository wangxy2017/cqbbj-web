/**
 * 登录方法
 */
function doLogin() {
    // 验证为空
    if ($("#account").val() == 0 || $("#account").val() == null || $("#password").val() == 0 || $("#password").val() == null) {
        toastr.error("请输入完整");
        $("#preloader").hide();
        return;
    } else {
        $("#preloader").show();
    }

    // 发送请求
    $.ajax({
        url: "/wx/login/empLogin",// 请求地址
        dataType: "JSON",// 返回数据类型
        data: {"account": $("#account").val(), "password": $("#password").val()},// 请求数据
        type: "POST",// 请求方式
        success: function (result) {// 请求成功函数

            if (result.code == 1) {
                //console.log(result.data.name);

                window.location.href = "/wx/login/toHome";
            } else {
                toastr.error(result.msg);
            }
        }, error: function () {// 请求失败函数

        }
    });
}