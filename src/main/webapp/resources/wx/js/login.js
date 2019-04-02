/**
 * 登录方法
 */
function doLogin() {
    // 验证为空
    if ($("#account").val() == 0 || $("#account").val() == null || $("#password").val() == 0 || $("#password").val() == null) {
        toastr.error("请输入完整");
        return;
    }
    // 发送请求
    $.ajax({
        url: "/wx/login/empLogin",// 请求地址
        dataType: "JSON",// 返回数据类型
        data: {"account": $("#account").val(), "password": $("#password").val()},// 请求数据
        type: "POST",// 请求方式
        beforeSend: function () {
            $(".preloader").show();
        },
        complete: function () {
            $(".preloader").hide();
        },
        success: function (result) {// 请求成功函数
            if (result.code == 1) {
                //console.log(result.data.name);
                // 将员工号存入缓存
                myCache.userKey = result.data.emp_no;
                window.location.href = "/wx/login/toHome?userKey=" + myCache.userKey;
            } else {
                toastr.error(result.msg);
            }
        }, error: function () {// 请求失败函数

        }
    });
}