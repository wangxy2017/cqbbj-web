layui.use(["form", "laydate", "jquery"], function () {
    var form = layui.form;
    var layer = layui.layer;
    var laydate = layui.laydate;
    var $ = layui.$;

    //监听提交
    form.on('submit(addCar)', function (data) {
        // console.log(data.field);
        // 请求后台保存数据
        $.ajax({
            url: "/car/save",
            dataType: "json",
            data: data.field,
            type: "POST",
            success: function (result) {
                console.log(result);
                // 保存成功，跳转页面
                if (result.code == 1) {
                    window.location.href = "/car/car";
                }
            },
            error: function () {
                layer.msg("服务器异常");
            }
        });
        return false;// 阻止表单跳转
    });
    /**
     * 初始化时间插件
     */
    //保险到期
    laydate.render({
        elem: '#insurance_date',
        type: "datetime",

    });
    //年审到期
    laydate.render({
        elem: '#examined_date',
        type: "datetime",

    });
    //采购日期
    laydate.render({
        elem: '#purchase_date',
        type: "datetime",

    });
});