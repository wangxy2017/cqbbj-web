var main = new Vue({
    el: "#main",
    data: {
        salary:{},
    },
    methods: {
        /*
         * 提交修改按钮的方法
         */
        submit: function () {
            $.ajax({
                url: "http://192.168.0.100:9000/wx/salary/update",
                data: {
                    "id":main.salary.id,
                    "emp_name":main.salary.emp_name,
                    "base_money":main.salary.base_money,
                    "profit_money":main.salary.profit_money,
                    "other_money":main.salary.other_money,
                    "real_money":main.salary.real_money,
                    "year":main.salary.year,
                    "month":main.salary.month,
                    "remark":main.salary.remark,
                },
                dataType: "json",
                type: "post",
                success:function (result) {
                    console.log(result);
                    toastr.success("修改成功");
                    setTimeout(function () {
                        window.location.href = "salary.html";
                    },1000)
                },error:function () {
                    toastr.error("提交失败");
                }
            })
        }

    },
    mounted: function () {
        /**
         * 弹出时间插件
         */
        var calendardatetime = new lCalendar();
        calendardatetime.init({
            'trigger': '#years',
            'type': 'year'
        });

            // 获取参数
        var url = window.location.href;
        // console.log(url);
        var n1 = url.length;//地址的总长度
        var n2 = url.indexOf("=");//取得=号的位置
        var id = url.substr(n2 + 1, n1 - n2);//从=号后面的内容
        console.log(id);
        this.$http.post("http://192.168.0.100:9000/wx/salary/queryById", {"id": id}, {emulateJSON: true}).then(function (res) {
            // console.log(res.body);
            // return;
            if (res.body.code == 1) {
                this.salary = res.body.data;
            } else {
                toastr.info("数据异常");
            }
        }, function (res) {
            toastr.error("服务器异常");
        });


    }
});