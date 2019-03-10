// 选择员工全局参数
var checkedEmps = [];
layui.use(["form", "laydate", "jquery"], function () {
    var form = layui.form;
    var layer = layui.layer;
    var laydate = layui.laydate;
    var $ = layui.$;
    $(function () {
        $("#chooseEmployee").on("click", function () {
            layer.open({
                type: 2,
                title: "选择员工",
                content: "/order/searchEmpList",
                area: ["980px", "450px"],
                maxmin: true,
                moveOut: true,
                end: function () {
                    // 关闭弹层回调
                    console.log(checkedEmps);
                     document.getElementById("emp_name").value=checkedEmps[0].name;
                     document.getElementById("emp_no").value=checkedEmps[0].emp_no;
                }

            });
        });
    });
    //监听提交
    form.on('submit(addSalary)', function (data) {
        // console.log(data.field);
        // 请求后台保存数据
        $.ajax({
            url: "/salary/save",
            dataType: "json",
            data: data.field,
            type: "POST",
            success: function (result) {
                console.log(result);
                // 保存成功，跳转页面
                if (result.code == 1) {
                    window.location.href = "/salary/salary";
                }
            },
            error: function () {
                layer.msg("服务器异常");
            }
        });
        return false;// 阻止表单跳转
    });

});