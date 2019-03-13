//
// $.ajax({
//     url: "",// 请求地址
//     dataType: "json",// 请求参数类型
//     data: {},// 请求参数
//     type: "POST",// 请求方式
//     success: function (result) {},// 请求成功回调
//     error: function () {}// 请求失败回调
// });
$(document).height() - $(window).height() - $(window).scrollTop() == 0;

$(function () {
    var $list = $('.list');
    var $loading = $('.loading');
    var htmlNodes = '';
    var isEnd = false;
    var pageNum = 0;
    $(window).scroll(function () {
        if (isEnd) {
            return;
        }
        if ($(document).height() - $(window).height() - $(window).scrollTop() > 50) {
            $.ajax({
                // type: '',
                url: '',
                data: {
                    pageSize: 10,
                    pageNum: pageNum++,
                },
                dataType: 'json',
                success: function (res) {
                    // render the list
                },
                beforeSend: function () {
                    $loading.show();
                },
                complete: function () {
                    $loading.hide();
                }
            });
        }
    });
});