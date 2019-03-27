var main = new Vue({
    el: "#main",
    data: {
        order_no: "",
        receiveMoney:"",
        receiveText:"",
        status:""
    },
    methods: {
        receive:function () {
            $.ajax({
                url: "http://192.168.0.100:9000/wx/signBill/receive",
                dataType: "json",
                data: {
                    "receiveMoney": this.receiveMoney
                    //展示数据
                    , "receiveText": this.receiveText
                    , "status": this.status
                    ,"order_no":this.order_no
                },
                type: "POST",
                success: function (result) {
                    console.log(result);
                    if (result.code == 1) {
                        main.status = 1;
                    }else {
                        toastr.error("数据出错啦");
                    }

                },
                error: function () {}
            });

        }
    },
    mounted: function () {
        // 获取参数
        var url = window.location.href;
        var n1 = url.length;//地址的总长度
        var n2 = url.indexOf("=");//取得=号的位置
        var id = decodeURI(url.substr(n2 + 1, n1 - n2));//从=号后面的内容
        this.order_no = id;
        console.log(id);
    }
});
// receive 地址；