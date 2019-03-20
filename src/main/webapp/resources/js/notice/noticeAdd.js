// JavaScript代码区域
layui.use(["jquery", "form", "layer"], function () {
    var $ = layui.$;
    var form = layui.form;
    var layer = layui.layer;

    //监听提交
    form.on('submit(addNotice)', function (data) {
        // console.log(data.field);
        // 请求后台保存数据
        $.ajax({
            url: "/notice/save",
            dataType: "json",
            data: data.field,
            type: "POST",
            success: function (result) {
                // console.log(result);
                // 保存成功，跳转页面
                if (result.code == 1) {
                    window.location.href = "/notice/notice";
                }
            },
            error: function () {
                layer.msg("服务器异常");
            }
        });
        return false;// 阻止表单跳转
    });
});