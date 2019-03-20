// JavaScript代码区域
layui.use(["table", "layer", "form", "jquery"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var form = layui.form;
    var $ = layui.$;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            title: "",
            empName: ""
        },
        methods: {
            // 添加公告
            addNotice: function () {
                window.location.href = "/notice/noticeAdd";
            },
            // 修改公告
            updateNotice: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus('noticeList');
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行进行修改");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("只能同时操作一行数据");
                    return;
                }
                if (checkStatus.data[0].status == 1) {
                    layer.msg("公告已发布，不能修改");
                    return;
                }
                // 跳转修改界面
                window.location.href = "/notice/noticeUpdate?id=" + checkStatus.data[0].id;
            },
            // 删除公告
            deleteNotice: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus("noticeList");
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行数据");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("请单独选择一条进行删除");
                    return;
                }
                layer.confirm("确认删除公告吗？", function () {
                    // 请求后台，删除数据
                    main.$http.post('/notice/delete', {"id": checkStatus.data[0].id}, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            layer.msg("删除成功");
                            // 刷新列表
                            table.reload("noticeList");
                        } else {
                            layer.msg("删除失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
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
                    elem: "#noticeList",
                    id: "noticeList",
                    url: "/notice/queryPageList",
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
                        , {field: 'title', title: '公告标题', width: 200}
                        , {field: 'content', title: '公告内容'}
                        , {
                            field: 'status', title: '推送状态', width: 100, align: "center", templet: function (d) {
                                var text = "";
                                if (d.status == 0) {
                                    text = "<span style='color: #FF5722'>未推送</span>";
                                } else {
                                    text = "<span style='color: #009688'>已推送</span>";
                                }
                                return text;
                            }
                        }
                        , {field: 'empName', title: '发布人', width: 100, align: "center"}
                        , {
                            field: 'createTime', title: '创建时间', width: 200, sort: true, templet: function (d) {
                                return formatDateTime(d.createTime);
                            }
                        }
                        , {title: '操作', fixed: 'right', align: 'center', toolbar: '#options', width: 120}
                    ]]
                });
                // 监听工具条
                table.on('tool(noticeList)', function (obj) {
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值

                    // 查看订单
                    if (layEvent === 'push') {
                        if (data.status == 1) {
                            layer.msg("公告已推送，不能重复推送");
                            return;
                        }
                        layer.confirm("确认推送此公告吗？", function () {
                            // 请求后台，推送公告
                            main.$http.post('/notice/push', {"id": data.id}, {emulateJSON: true}).then(function (res) {
                                console.log(res.body);
                                if (res.body.code == 1) {
                                    layer.msg("推送成功");
                                    // 刷新列表
                                    table.reload("noticeList");
                                } else {
                                    layer.msg("推送失败");
                                }
                            }, function (res) {
                                layer.msg("服务器请求异常");
                            });
                        });
                    }
                });
            },
            /**
             * 搜索
             */
            search: function () {
                table.reload("noticeList", {
                    where: {
                        "title": main.title,
                        "empName": main.empName
                    }
                });
            },
        },
        mounted: function () {
            this.initTable();
        }
    });
});