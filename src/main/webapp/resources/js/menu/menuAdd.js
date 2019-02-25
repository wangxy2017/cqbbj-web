// JavaScript代码区域
layui.use(["jquery", "form", "layer"], function () {
    var $ = layui.$;
    var form = layui.form;
    var layer = layui.layer;

    $(function () {
        $.ajax({
            url: "/menu/queryList",
            dataType: "json",
            data: {"pid": 0},
            type: "POST",
            success: function (result) {
                console.log(result);
                // 保存成功，跳转页面
                if (result.code == 1) {
                    for (var i = 0; i < result.data.length; i++) {
                        $("#pid").append("<option value='" + result.data[i].id + "'>" + result.data[i].name + "</option>");
                    }
                    // 重新渲染
                    form.render();
                }
            },
            error: function () {
                layer.msg("服务器异常");
            }
        });
    });
    //监听提交
    form.on('submit(addMenu)', function (data) {
        // console.log(data.field);
        // 请求后台保存数据
        $.ajax({
            url: "/menu/save",
            dataType: "json",
            data: data.field,
            type: "POST",
            success: function (result) {
                // console.log(result);
                // 保存成功，跳转页面
                if (result.code == 1) {
                    window.location.href = "/menu/menu";
                }
            },
            error: function () {
                layer.msg("服务器异常");
            }
        });
        return false;// 阻止表单跳转
    });
});