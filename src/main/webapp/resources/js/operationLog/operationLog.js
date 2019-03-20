// JavaScript代码区域
layui.use(["table", "layer", "laydate"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var laydate = layui.laydate;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            name: "",
            content: ""
        },
        methods: {
            /**
             * 搜索
             */
            search: function () {
                table.reload("operationLogList", {
                    where: {
                        "name": main.name,
                        "content": main.content
                    }
                });
            },
            /**
             * 初始化表格
             */
            initTable: function () {
                table.render({
                    elem: "#operationLogList",
                    id: "operationLogList",
                    url: "/operationLog/queryPageList",
                    page: true,
                    parseData: function (res) {
                        return {
                            "code": res.code,
                            "msg": res.msg,
                            "count": res.data.total,
                            "data": res.data.list
                        };
                    },
                    request: {
                        pageName: "pageNum",
                        limitName: "pageSize"
                    },
                    response: {
                        statusCode: 1
                    },
                    cols: [[
                        {type: 'checkbox'}
                        , {field: 'name', title: '操作人'}
                        , {field: 'content', title: '操作内容'}
                        , {field: 'ip', title: 'IP来源'}
                        , {
                            field: 'createTime', title: '操作时间', templet: function (d) {
                                return formatDateTime(d.createTime);
                            }
                        }
                    ]]
                });
            },
            /**
             * 导出日志
             */
            download: function () {
                layer.confirm("导出数据属于敏感操作，确认继续吗？", function (index) {
                    layer.close(index);
                    window.location.href = "/operationLog/download?1=1" +
                        "&name=" + main.name +
                        "&content=" + main.content;
                });
            }
        },
        mounted: function () {
            var that = this;
            // 初始化表格
            that.initTable();
        }
    });
});