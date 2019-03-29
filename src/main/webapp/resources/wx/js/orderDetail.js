var main = new Vue({
        el: "#main",
        data: {
            order: {},
            isDispatch: false,
            isComplete: false
        },
        methods: {},
        mounted: function () {

            this.$http.post("/wx/order/queryById", {"id": $("#table").attr("data_id")}, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                if (res.body.code == 1) {
                    this.order = res.body.data;
                    // 显示派单信息
                    if (this.order.status == 1 || this.order.status == 2) {
                        this.isDispatch = true;
                    }
                    if (this.order.status == 2) {
                        this.isComplete = true;
                    }
                } else {
                    toastr.info("数据异常");
                }
            }, function (res) {
                toastr.error("服务器异常");
            });
        }
    })
;