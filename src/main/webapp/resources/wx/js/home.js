function OrderAdd() {
    window.location.href = "/wx/order/orderAdd";
}

function unSentOrder() {
    window.location.href = "/wx/order/unSentOrder";
}

function sentOrder() {
    window.location.href = "/wx/order/sentOrder";
}

function orderSearch() {
    window.location.href = "/wx/order/orderSearch";
}

function completeOrder() {
    window.location.href = "/wx/order/completeOrder";
}

function canceledOrder() {
    window.location.href = "/wx/order/canceledOrder";
}

//跳转财务结算界面
function financeClean() {
    window.location.href = "/wx/financeClean/financeClean";
}


//跳转薪资管理界面
function mySalary() {
    window.location.href = "/wx/salary/mySalary";
}


//跳转签单管理界面
function signBill() {
    window.location.href = "/wx/signBill/signBill";
}


//跳转支付记录界面
function payRecord() {
    window.location.href = "/wx/payRecord/payRecord";
}


//跳转我的钱包界面
function wallet() {
    window.location.href = "/wx/payRecord/wallet";
}

//跳转我的任务界面
function myTask() {
    window.location.href = "/wx/order/myTask";
}

function loginout() {
    window.location.href = "/wx/order/loginOut"
}


var main = new Vue({
    el: "#main",
    data: {
        menus: []

    },
    methods: {
        tiaozhuan:function (url) {
            window.location.href=url;
        }

    },
    mounted: function () {
        this.$http.post("/wx/menu/queryPageList",{},{emulateJSON: true}).then(function (res) {
            // console.log(res.body);
            // return;
            if (res.body.code == 1) {
                this.menus = res.body.data;
            } else {
                toastr.info("数据异常");
            }
        }, function (res) {
            toastr.error("服务器异常");
        });
    }
});