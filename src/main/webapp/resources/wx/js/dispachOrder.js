layui.use(["table", "layer"], function () {

    var table = layui.table;
    var layer = layui.layer;

    var main = new Vue({
        el: "#main",
        data: {
            moneyEmp:"",
            driver:"",
            hamal:"",
            techniCian:""
        },
        methods: {
            /**
             * 添加收款人
             */
            add1:function () {
                layer.open({
                    type: 2,
                    content: 'http://sentsin.com' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });

            },
            /**
             * 添加司机
             */
            add2:function () {
                layer.open({
                    type: 2,
                    content: 'http://sentsin.com' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            },
            /**
             * 添加搬运工
             */
            add3:function () {
                layer.open({
                    type: 2,
                    content: 'http://sentsin.com' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            },
            /**
             * 添加空调工
             */
            add4:function () {
                layer.open({
                    type: 2,
                    content: 'http://sentsin.com' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            }
        }

    })


});
