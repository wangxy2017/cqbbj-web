$(function () {
    $("#cashier .col-sm-4 button").click(function () {
        var info = $(this).hasClass("btn-info");
        if (info) {// 取消选中
            $(this).removeClass('btn-info').addClass('btn-default');
            $("#moneyEmp").val("");
        } else {// 选中
            $(this).removeClass('btn-default').addClass('btn-info');
            // 赋值
            var empNo = $(this).attr("data-empNo");//编号
            var name = $(this).text();
            $("#moneyEmp").val(name);
            $("#moneyEmpNo").val(empNo);
        }
    });
// 选择司机追加样式
    $("#motorMan .col-sm-4 button").click(function () {
        var info = $(this).hasClass("btn-info");
        if (info) {// 取消选中
            $(this).removeClass('btn-info').addClass('btn-default');
            $("#driver").val("");
        } else {// 选中
            $(this).removeClass('btn-default').addClass('btn-info');
            // 赋值
            var divNum = $(this).attr("data-driver");//编号
            var name = $(this).text() + "、";
            $("#driver").val($("#driver").val() + name);
            $("#divNum").val(divNum);
        }
    });
    //选择搬运工追加样式
    $("#porter .col-sm-4 button").click(function () {
        var info = $(this).hasClass("btn-info");
        if (info) {// 取消选中
            $(this).removeClass('btn-info').addClass('btn-default');
            $("#hamal").val("");
        } else {// 选中
            $(this).removeClass('btn-default').addClass('btn-info');
            // 赋值
            var ham = $(this).attr("data-empNo");//编号
            var name = $(this).text() + "、";
            $("#hamal").val($("#hamal").val() + name);
            $("#ham").val(ham);
        }
    });
    //选择追加空调工样式
    $("#hvac .col-sm-4 button").click(function () {
        var info = $(this).hasClass("btn-info");
        if (info) {// 取消选中
            $(this).removeClass('btn-info').addClass('btn-default');
            $("#techniCian").val("");
        } else {// 选中
            $(this).removeClass('btn-default').addClass('btn-info');
            // 赋值
            var emp = $(this).attr("data-empNo");//编号
            var name = $(this).text() + "、";
            $("#techniCian").val($("#techniCian").val() + name);
            $("#techNo").val(emp);
        }
    });

    $("#rest").on("click", function () {
        window.location.reload();
    });
});
