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
             * 添加部门
             */
            addDept: function () {
                layer.prompt({"title": "输入部门名称："}, function (value, index) {
                    // 请求后台，新增部门
                    main.$http.post('/dept/save', {"name": value}, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            layer.close(index);
                            // 刷新列表
                            table.reload("deptList");
                        } else {
                            layer.msg("添加失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                });
            },
            /**
             * 修改部门
             */
            updateDept: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus('deptList');
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行进行修改");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("只能同时操作一行数据");
                    return;
                }
                // 修改数据
                layer.prompt({"title": "修改部门名称：", "value": checkStatus.data[0].name}, function (value, index) {
                    // console.log(checkStatus.data);
                    // 请求后台保存修改数据
                    main.$http.post('/dept/update', {
                        "id": checkStatus.data[0].id,
                        "name": value
                    }, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            layer.close(index);
                            // 刷新数据
                            table.reload("deptList");
                        } else {
                            layer.msg("修改失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                });
            },
            /**
             * 删除部门
             */
            deleteDept: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus("deptList");
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
                    main.$http.post('/dept/delete', {"id": checkStatus.data[0].id}, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            layer.msg("删除成功");
                            // 刷新列表
                            table.reload("deptList");
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
                    elem: "#deptList",
                    id: "deptList",
                    url: "/dept/queryPageList",
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
                        , {field: 'name', title: '部门名称'}
                        , {
                            field: 'createTime', title: '创建时间', sort: true, templet: function (d) {
                                return formatDateTime(d.createTime);
                            }
                        }
                        , {title: '操作', fixed: 'right', align: 'center', toolbar: '#options'}
                    ]]
                });
                /**
                 * 监听工具条
                 */
                table.on('tool(deptList)', function (obj) {
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值

                    if (layEvent === 'bindMenu') { // 绑定菜单
                        // 跳转绑定菜单页面
                        // console.log(data.id);
                        window.location.href = "/dept/deptBindMenu?id=" + data.id;
                    }
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