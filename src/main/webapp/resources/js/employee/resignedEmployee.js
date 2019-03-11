// JavaScript代码区域
layui.use(["table", "layer"], function () {
    var table = layui.table;
    var layer = layui.layer;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            phone: "",
            name: "",
            position_id: ""
        },
        methods: {

            search: function () {
                table.reload("resignedEmployeeList", {
                    where: {
                        "name": main.name,
                        "phone": main.phone,
                        "position_id": main.position_id
                    }
                });
            },
            // 删除员工
            deleteEmployee: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus("employeeList");
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行数据");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("请单独选择一条进行删除");
                    return;
                }
                layer.confirm("删除员工将放入回收站，确认删除吗？", function () {
                    // 请求后台，删除数据
                    main.$http.post('/employee/deleteActive', {"id": checkStatus.data[0].id}, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            layer.msg("删除成功");
                            // 刷新列表
                            table.reload("employeeList");
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
                    elem: "#resignedEmployeeList",
                    id: "resignedEmployeeList",
                    url: "/employee/queryPageList",
                    page: true,
                    where: {
                        is_onjob: 1
                    },
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
                        , {field: 'name', title: '员工姓名'}
                        , {field: 'phone', title: '手机号'}
                        , {field: 'account', title: '登录账号'}
                        , {field: 'password', title: '密码'}
                        , {
                            field: 'sex', title: '性别', templet: function (d) {
                                var text = "";
                                switch (d.sex) {
                                    case 0:
                                        text = "未知";
                                        break;
                                    case 1:
                                        text = "男";
                                        break;
                                    case 2:
                                        text = "女";
                                        break;
                                }
                                return text;
                            }
                        }
                        , {field: 'deptName', title: '所属部门'}
                        , {field: 'positionName', title: '所属职位'}
                        , {field: 'reason', title: '离职原因', width: 300}
                        , {
                            field: 'createTime', title: '创建时间', sort: true, templet: function (d) {
                                return formatDateTime(d.createTime);
                            }
                        }
                        , {title: '操作', fixed: 'right', align: 'center', toolbar: '#options'}
                    ]]
                });
                // 监听工具条
                table.on('tool(resignedEmployeeList)', function (obj) {
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值

                    // 恢复
                    if (layEvent === 'reLeave') {
                        layer.confirm("确认恢复员工为在职状态吗？", function () {
                            // 请求后台，更改状态
                            main.$http.post('/employee/reLeave', {"id": data.id}, {emulateJSON: true}).then(function (res) {
                                // console.log(res.body);
                                if (res.body.code == 1) {
                                    layer.msg("操作成功");
                                    // 刷新列表
                                    table.reload("resignedEmployeeList");
                                } else {
                                    layer.msg("操作失败");
                                }
                            }, function (res) {
                                layer.msg("服务器请求异常");
                            });
                        });
                    }
                });
            }
        },
        mounted: function () {
            this.initTable();
        }
    });
});