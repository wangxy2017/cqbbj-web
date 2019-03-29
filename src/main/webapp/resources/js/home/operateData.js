// JavaScript代码区域
layui.use(["layer", "laydate"], function () {
    var layer = layui.layer;
    var laydate = layui.laydate;

    var main = new Vue({
        el: "#main",
        data: {
            data: {},
            startDate: addDay(new Date(), -30),
            endDate: currentDate()
        },
        methods: {
            /**
             * 加载数据
             */
            loadData: function () {
                main.$http.post("/home/queryData", {
                    "startTime": main.startDate + " 00:00:00",
                    "endTime": main.endDate + " 23:59:59"
                }, {emulateJSON: true}).then(function (res) {
                    // 加载数据
                    if (res.body.code == 1) {
                        main.data = res.body.data;
                    } else {
                        layer.msg("查询数据异常");
                    }
                }, function (res) {
                    layer.msg("服务器请求异常");
                });
            },
            /**
             * 选择日周月
             * @param type
             */
            choose: function (type) {
                switch (type) {
                    case 'day':
                        main.startDate = currentDate();
                        main.endDate = currentDate();
                        main.loadData();
                        break;
                    case 'week':
                        var date = new Date();
                        var num = date.getDay() - 1;
                        date.setDate(date.getDate() - num); //本周第一天
                        main.startDate = formatDate(date.getTime());
                        date.setDate(date.getDate() + 6);//本周最后一天
                        main.endDate = formatDate(date.getTime());
                        main.loadData();
                        break;
                    case 'month':
                        var date = new Date();
                        date.setDate(1);//本月第一天
                        main.startDate = formatDate(date.getTime());
                        date.setMonth(date.getMonth() + 1);//下个月
                        date.setDate(date.getDate() - 1);//下个月第一天减1得到本月最后一天
                        main.endDate = formatDate(date.getTime());
                        main.loadData();
                        break;
                }
            }
        },
        mounted: function () {
            // 初始化数据
            this.$http.post("/home/queryData", {
                "startTime": this.startDate + " 00:00:00",
                "endTime": this.endDate + " 23:59:59"
            }, {emulateJSON: true}).then(function (res) {
                // 加载数据
                if (res.body.code == 1) {
                    this.data = res.body.data;
                } else {
                    layer.msg("查询数据异常");
                }
            }, function (res) {
                layer.msg("服务器请求异常");
            });
            // 初始化日历插件
            laydate.render({
                elem: '#date'
                , type: 'date'
                , trigger: 'click'
                , range: '至'
                , value: this.startDate + " 至 " + this.endDate
                , done: function (value, date, endDate) {
                    if (isEmpty(value)) {
                        return;
                    }
                    main.startDate = date.year + "-" + date.month + "-" + date.date;
                    main.endDate = endDate.year + "-" + endDate.month + "-" + endDate.date;
                    main.loadData();
                }
            });
        }
    });
});