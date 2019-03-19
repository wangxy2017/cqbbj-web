var main = new Vue({
        el: "#main",
        data: {
            order: {
                
                
            }
        },
        methods: {
            submit:function () {
                
            }
            
        },
        mounted: function () {
            this.$http.post("http://192.168.0.100:9000/wx/order/queryById", {"id": $("#table").attr("data_id")}, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                if(res.body.code == 1){
                    this.order = res.body.data;
                }else{
                    alert("数据异常");
                }
            }, function (res) {
                alert("服务器异常");
            });
        }
    })
;