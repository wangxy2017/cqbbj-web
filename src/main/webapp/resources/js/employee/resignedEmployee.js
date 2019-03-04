// JavaScript代码区域
layui.use(["table", "layer"], function () {
    var table = layui.table;
    var layer = layui.layer;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            phone:"",
            name:"",
            position_id:""
        },
        methods: {

            search:function(){
                table.reload("resignedEmployeeList", {
                    where: {
                        "name": main.name,
                        "phone": main.phone,
                        "position_id":main.position_id,
                        is_onjob:1
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
            }
        }
    });

    /**
     * 加载数据
     */
    table.render({
        elem: "#resignedEmployeeList",
        id: "resignedEmployeeList",
        url: "/employee/queryPageList",
        page: true,
        where: {
            is_onjob:1
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
            , {field: 'sex', title: '性别'}
            , {field: 'is_disabled', title: '启用状态'}
            , {field: 'dept_id', title: '所属部门'}
            , {field: 'position_id', title: '所属职位'}
            , {
                field: 'createTime', title: '创建时间', sort: true, templet: function (d) {
                    return formatDateTime(d.createTime);
                }
            }
        ]]
    });
});