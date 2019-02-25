// JavaScript代码区域
layui.use(["table", "layer"], function () {
    var table = layui.table;
    var layer = layui.layer;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {},
        methods: {
            /**
             * 添加职位
             */
            addPosition: function () {
                layer.prompt({"title": "输入职位名称："}, function (value, index) {
                    // 请求后台，新增职位
                    main.$http.post('/position/save', {"name": value}, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            layer.close(index);
                            // 刷新列表
                            table.reload("positionList");
                        } else {
                            layer.msg("添加失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                });
            },
            /**
             * 修改职位
             */
            updatePosition: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus('positionList');
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行进行修改");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("只能同时操作一行数据");
                    return;
                }
                // 修改数据
                layer.prompt({"title": "修改职位名称：", "value": checkStatus.data[0].name}, function (value, index) {
                    // console.log(checkStatus.data);
                    // 请求后台保存修改数据
                    main.$http.post('/position/update', {
                        "id": checkStatus.data[0].id,
                        "name": value
                    }, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            layer.close(index);
                            // 刷新数据
                            table.reload("positionList");
                        } else {
                            layer.msg("修改失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                });
            },
            /**
             * 删除职位
             */
            deletePosition: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus("positionList");
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行数据");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("请单独选择一条进行删除");
                    return;
                }
                layer.confirm("数据删除后不可恢复，确认删除吗？", function () {
                    // 请求后台，删除数据
                    main.$http.post('/position/delete', {"id": checkStatus.data[0].id}, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            layer.msg("删除成功");
                            // 刷新列表
                            table.reload("positionList");
                        } else {
                            layer.msg("删除失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                })
            },
            /**
             * 初始化表格
             */
            initTable: function () {
                /**
                 * 加载数据
                 */
                table.render({
                    elem: "#positionList",
                    id: "positionList",
                    url: "/position/queryPageList",
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
                        , {field: 'name', title: '职位名称'}
                        , {
                            field: 'createTime', title: '创建时间', sort: true, templet: function (d) {
                                return formatDateTime(d.createTime);
                            }
                        }
                    ]]
                });
            }
        },
        mounted: function () {
            var that = this;
            // 初始化数据
            that.initTable();
        }
    });
});