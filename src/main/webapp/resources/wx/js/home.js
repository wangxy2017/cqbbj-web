// function OrderAdd() {
//     window.location.href = "/wx/order/orderAdd";
// }
//
// function unSentOrder() {
//     window.location.href = "/wx/order/unSentOrder";
// }
//
// function sentOrder() {
//     window.location.href = "/wx/order/sentOrder";
// }
//
// function orderSearch() {
//     window.location.href = "/wx/order/orderSearch";
// }
//
// function completeOrder() {
//     window.location.href = "/wx/order/completeOrder";
// }
//
// function canceledOrder() {
//     window.location.href = "/wx/order/canceledOrder";
// }
//
// //跳转财务结算界面
// function financeClean() {
//     window.location.href = "/wx/financeClean/financeClean";
// }
//
//
// //跳转薪资管理界面
// function mySalary() {
//     window.location.href = "/wx/salary/mySalary";
// }
//
//
// //跳转签单管理界面
// function signBill() {
//     window.location.href = "/wx/signBill/signBill";
// }
//
//
// //跳转支付记录界面
// function payRecord() {
//     window.location.href = "/wx/payRecord/payRecord";
// }
//
//
// //跳转我的钱包界面
// function wallet() {
//     window.location.href = "/wx/payRecord/wallet";
// }
//
// //跳转我的任务界面
// function myTask() {
//     window.location.href = "/wx/order/myTask";
// }
//
// function loginout() {
//     window.location.href = "/wx/order/loginOut"
// }
//
var main = new Vue({
    el: "#main",
    data: {
        menus: [],
        empName: "请登录",
        task: 0,
        money: 0.00
    },
    methods: {
        /**
         * 菜单跳转
         * @param url
         */
        tiaozhuan: function (url) {
            if (!isEmpty(url)) {
                window.location.href = url;
            }
        },
        /**
         * 我的任务
         */
        myTask:function () {
            window.location.href = "/wx/order/myTask";
        },
        /**
         * 我的钱包
         */
        wallet:function () {
            window.location.href = "/wx/payRecord/wallet";
        }
    },
    mounted: function () {
        var _this = this;
        _this.$http.post("/wx/menu/queryPageList", {}, {emulateJSON: true}).then(function (res) {
            //   console.log(res.body);
            // return;
            if (res.body.code == 1) {
                _this.menus = res.body.data[0].childs;
                // 如果没有数据，则显示没有数据
                if (_this.menus.length == 0) {
                    $(".notFind").show();
                } else {
                    $(".notFind").hide();
                }
            } else {
                toastr.info("数据异常");
            }
        }, function (res) {
            toastr.error("服务器异常");
        });
        this.$http.post("/wx/login/getEmpName", {}, {emulateJSON: true}).then(function (res) {

            if (res.body.code == 1) {
                this.empName = res.body.data.name;
                this.task = res.body.data.task;
                this.money = res.body.data.money;
            }
        }, function (res) {
            toastr.error("服务器异常");
        });
    }
});