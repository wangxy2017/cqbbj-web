// JavaScript代码区域
layui.use(["jquery", "form", "layer", "laydate"], function () {
    var $ = layui.$;
    var form = layui.form;
    var layer = layui.layer;
    var laydate = layui.laydate;

    $(function () {
        $.ajax({
            url: "/order/queryConfig",
            dataType: "json",
            data: {},
            type: "POST",
            success: function (result) {
                if (result.code == 1) {
                    // 遍历关键词
                    var arr = typeof result.data.keyword == "undefined" ? [] : result.data.keyword.split("/");
                    var html = "";
                    for (var i = 0; i < arr.length; i++) {
                        if (arr[i] != "")
                            html += "<span class='item'>" + arr[i] + "</span>";
                    }
                    $("#items").empty().append(html);
                    // 绑定点击事件
                    $("#items .item").on("click", function () {
                        var text = $(this).text() + "/";
                        var remark = $("#remark").val();
                        if ($(this).hasClass("active")) {
                            $(this).removeClass("active");
                            if (remark.indexOf(text) != -1)
                                $("#remark").val(remark.replace(text, ""));
                        } else {
                            $(this).addClass("active");
                            if (remark.indexOf(text) == -1)
                                $("#remark").val(remark + text);
                        }
                    });
                }
            },
            error: function () {
                layer.msg("服务器异常");
            }
        });
    });
    //监听提交
    form.on('submit(addOrder)', function (data) {
        // console.log(data.field);
        // 请求后台保存数据
        $.ajax({
            url: "/order/save",
            dataType: "json",
            data: data.field,
            type: "POST",
            success: function (result) {
                // console.log(result);
                // 保存成功，跳转页面
                if (result.code == 1) {
                    window.location.href = "/order/order";
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
    laydate.render({
        elem: '#beginTime',
        type:'datetime',
        btns: ['clear', 'confirm']
    });
});