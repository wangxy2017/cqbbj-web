var calendardatetime = new lCalendar();
calendardatetime.init({
    'trigger': '#beginTime1',
    'type': 'datetime'
});
var calendardatetime2 = new lCalendar();
calendardatetime2.init({
    'trigger': '#beginTime2',
    'type': 'datetime'
});
$("#submit").on("click", function () {
    $.ajax({
        url: "/wx/order/search",
        data: {
            "order_no": $("#order_no").val(),
            "name": $("#name").val(),
            "phone": $("#phone").val(),
            "beginTime1": $("#beginTime1").val()+":00",
            "beginTime2":$("#beginTime2").val()+":00"
        },
        dataType: "json",
        type: "post",
        success: function (res) {
            console.log(res.data);


        }, error: function () {

        }

    })
})