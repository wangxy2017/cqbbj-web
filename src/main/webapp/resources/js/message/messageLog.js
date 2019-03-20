// JavaScript代码区域
layui.use(["table", "layer", "jquery", "laydate"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var laydate = layui.laydate;
    var $ = layui.$;
    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            phone: ""
            , content: ""
        },
        methods: {
            /**
             * 初始化日历
             */
            initCalander: function () {
                //开始时间
                laydate.render({
                    elem: '#createTime1'
                    , type: "datetime"
                });
                //结束时间
                laydate.render({
                    elem: '#createTime2'
                    , type: "datetime"
                });
            },
            /**
             * 搜索
             */
            search: function () {
                table.reload("messageLogList", {
                    where: {
                        "phone": main.phone
                        , "content": main.content
                        , "createTime1": $("#createTime1").val()
                        , "createTime2": $("#createTime2").val()
                    }
                });
            },
            /**
             * 初始化表格
             */
            initTable: function () {
                /**
                 * 加载数据
                 */
                table.render({
                    elem: "#messageLogList",
                    id: "messageLogList",
                    url: "/message/queryPageList",
                    page: true,
                    where: {},
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
                        , {field: 'id', title: '编号', width: 80, align: "center"}
                        , {field: 'phone', title: '手机号', width: 130}
                        , {field: 'content', title: '内容', align: "center"}
                        , {
                            field: 'createTime', title: '发送时间', width: 200, sort: true, templet: function (d) {
                                return formatDateTime(d.createTime);
                            }
                        }
                    ]]
                });
            }
        },
        mounted: function () {
            this.initTable();
            // 初始化日历插件
            this.initCalander();
        }
    });


});