// JavaScript代码区域
layui.use(["layer"], function () {
    var layer = layui.layer;
    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            notice: "【暂无公告】",
            task: 0,
            tasks: []
        },
        methods: {
            /**
             * 查看任务
             */
            view: function () {
                if (main.task == 0) {
                    layer.msg("暂无任务");
                    return;
                }
            }
        },
        mounted: function () {
            // 查询首页信息
            this.$http.post("/home/welcomeData", {}, {emulateJSON: true}).then(function (res) {
                console.log(res.body);
                // 加载数据
                if (res.body.code == 1) {
                    this.notice = res.body.data.notice;
                    this.task = res.body.data.task;
                    this.tasks = res.body.data.tasks;
                } else {
                    layer.msg("查询数据异常");
                }
            }, function (res) {
                layer.msg("服务器请求异常");
            });
        }
    });
});