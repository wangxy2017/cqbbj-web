// JavaScript代码区域
layui.use(["table", "layer", "form", "jquery"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var form = layui.form;
    var $ = layui.$;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {},
        methods: {
            // 添加员工
            addEmployee: function () {
                window.location.href = "/employee/employeeAdd";
            },
            // 修改员工
            updateEmployee: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus('employeeList');
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行进行修改");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("只能同时操作一行数据");
                    return;
                }
                // 跳转修改界面
                window.location.href = "/employee/employeeUpdate?id=" + checkStatus.data[0].id;
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
                    elem: "#employeeList",
                    id: "employeeList",
                    url: "/employee/queryPageList",
                    page: true,
                    where: {
                        is_onjob: 0
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
                        , {
                            field: 'createTime', title: '创建时间', sort: true, templet: function (d) {
                                return formatDateTime(d.createTime);
                            }
                        }
                        , {
                            field: 'is_disabled', title: '启用状态', templet: function (d) {
                                var checked = d.is_disabled == 0 ? "checked" : "";
                                return '<input data-empId="' + d.id + '" type="checkbox" name="is_disabled" value="0" lay-skin="switch" lay-text="启用|禁用" lay-filter="disabled" ' + checked + '>'
                            }
                        }
                    ]]
                });
                //监听禁用操作
                form.on('switch(disabled)', function (data) {
                    var id = $(data.elem).attr("data-empId");
                    var is_disabled = data.elem.checked ? 0 : 1;
                    // console.log(id, is_disabled);
                    // 请求后台，更新员工状态
                    main.$http.post('/employee/disabled', {
                        "id": id,
                        "is_disabled": is_disabled
                    }, {emulateJSON: true}).then(function (res) {
                        // console.log(res.body);
                        if (res.body.code == 1) {
                            layer.msg("操作成功");
                        } else {
                            layer.msg("操作失败");
                        }
                    }, function (res) {
                        layer.msg("服务器请求异常");
                    });
                });
            },
            /**
             * 离职
             */
            leave: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus('employeeList');
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行进行修改");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("只能同时操作一行数据");
                    return;
                }
                layer.prompt({
                        formType: 2,
                        title: '离职原因',
                        area: ['360px', '160px']
                    },
                    function (value, index, elem) {
                        // 请求后台，取消订单
                        main.$http.post('/employee/leave', {
                            "id": checkStatus.data[0].id,
                            "reason": value
                        }, {emulateJSON: true}).then(function (res) {
                            // console.log(res.body);
                            if (res.body.code == 1) {
                                layer.msg("操作成功");
                                layer.close(index);
                                // 刷新列表
                                table.reload("employeeList");
                            } else {
                                layer.msg("操作失败");
                            }
                        }, function (res) {
                            layer.msg("服务器请求异常");
                        });
                    }
                );
            }
        },
        mounted: function () {
            this.initTable();
        }
    });
});