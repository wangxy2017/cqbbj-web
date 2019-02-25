// JavaScript代码区域
layui.use(["jquery", "form", "layer"], function () {
    var $ = layui.$;
    var form = layui.form;
    var layer = layui.layer;

    $(function () {
        // 查询部门和职位
        $.ajax({
            url: "/employee/addInfo",
            dataType: "json",
            data: {},
            type: "POST",
            success: function (result) {
                if (result.code == 1) {
                    var depts = typeof result.data.depts == "undefined" ? [] : result.data.depts;
                    var positions = typeof result.data.positions == "undefined" ? [] : result.data.positions;
                    for (var i = 0; i < depts.length; i++) {
                        $("#dept_id").append("<option value='" + depts[i].id + "'>" + depts[i].name + "</option>");
                    }
                    for (var i = 0; i < positions.length; i++) {
                        $("#position_id").append("<option value='" + positions[i].id + "'>" + positions[i].name + "</option>");
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