//JavaScript区域
layui.use(["form", "layer"], function () {
    var form = layui.form;
    var layer = layui.layer;

    var main = new Vue({
        el: "#main",
        data: {
            order_no: document.getElementById("main").getAttribute("data-id"),
            moneyEmp: {},
            driveEmps: [],
            moveEmps: [],
            airEmps: []
        },
        methods: {
            /**
             * 选择员工
             */
            queryEmpList: function () {
                console.log(123);
            },
            /**
             * 重置表单
             */
            resetForm: function () {
                main.moneyEmp = null;
                main.driveEmps = [];
                main.moveEmps = [];
                main.airEmps = [];
            }
        },
        mounted: function () {
            //监听提交
            form.on('submit(dispatchOrder)', function (data) {
                // console.log(data.field);
                // 请求后台保存数据

                return false;// 阻止表单跳转
            });
        }
    });
});