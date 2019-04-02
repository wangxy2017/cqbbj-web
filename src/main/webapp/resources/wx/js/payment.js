var main = new Vue({
    el: "#main",
    data: {
        order_no: "",
        receiveMoney:"",
        receiveText:"",
        status:"",
        id:""
    },
    methods: {
        receive:function () {
            $.ajax({
                url: "/wx/signBill/receive",
                dataType: "json",
                data: {
                    "receiveMoney": this.receiveMoney
                    //展示数据
                    , "receiveText": this.receiveText
                    , "status": this.status
                    ,"order_no":this.order_no
                    ,"id":this.id
                },
                type: "POST",


                    success: function (result) {
                    console.log(result);
                    if (result.code == 1) {
                        toastr.success("收款成功");
                     setTimeout(function () {
                         window.location.href="/wx/signBill/signBill";
                     },500);

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
        var n2 = url.lastIndexOf("=");//取得=号的位置
        var n3 = url.indexOf("=");
        var id=url.substring(n3 + 1, n2-9);//从id=号后面的内容
        var order_no = decodeURI(url.substr(n2 + 1, n1 - n2));//从=号后面的内容
        this.id=id;
        this.order_no = order_no;

        console.log(id);
        console.log(order_no);
    }
});
// receive 地址；