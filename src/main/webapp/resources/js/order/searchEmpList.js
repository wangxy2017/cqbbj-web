// JavaScript存放区域
layui.use(["table", "jquery"], function () {
    var table = layui.table;
    var $ = layui.$;

    $(function () {
        /**
         * 搜索按钮
         */
        $("#searchTable").on("click", function () {
            table.reload("empList", {
                where: {
                    "is_onjob": 0,
                    "name": $("#name").val(),
                    "phone": $("#phone").val(),
                    "deptName": $("#deptName").val()
                }
            });
        });
        /**
         * 确认按钮
         */
        $("#selectEmp").on("click", function () {
            var checkStatus = table.checkStatus('empList');
            // 把数据存到全局参数
            parent.checkedEmps = checkStatus.data;
            //关闭自身
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });
    });
    /**
     * 加载数据
     */
    table.render({
        elem: "#empList",
        id: "empList",
        url: "/employee/queryPageList",
        page: true,
        limit: 5,
        limits: [5, 10, 20],
        where: {"is_onjob": 0},
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
            , {field: 'deptName', title: '部门名称'}
            , {field: 'name', title: '姓名'}
            , {field: 'phone', title: '手机号'}
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
            , {field: 'positionName', title: '职位'}
        ]]
    });
});