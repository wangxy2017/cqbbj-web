// JavaScript代码区域
layui.use(["jquery", "form", "layer"], function () {
    var $ = layui.$;
    var form = layui.form;
    var layer = layui.layer;

    $(function () {
        // 查询所有角色
        $.ajax({
            url: "/dept/queryList",
            dataType: "json",
            data: {},
            type: "POST",
            success: function (result) {
                console.log(result);
                if (result.code == 1) {
                    for (var i = 0; i < result.data.length; i++) {
                        $("#dept_id").append("<option value='" + result.data[i].id + "'>" + result.data[i].name + "</option>");
                    }
                    form.render();
                }
            },
            error: function () {
                layer.msg("服务器异常");
            }
        });
    });

    //监听提交
    form.on('submit(addEmployee)', function (data) {
        // console.log(data.field);
        // 请求后台保存数据
        $.ajax({
            url: "/employee/save",
            dataType: "json",
            data: data.field,
            type: "POST",
            success: function (result) {
                // console.log(result);
                // 保存成功，跳转页面
                if (result.code == 1) {
                    window.location.href = "/employee/employee";
                }
            },
            error: function () {
                layer.msg("服务器异常");
            }
        });
        return false;// 阻止表单跳转
    });
});