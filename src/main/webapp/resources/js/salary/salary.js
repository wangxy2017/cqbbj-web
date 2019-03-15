// JavaScript代码区域
layui.use(["table", "layer", "laydate", "jquery"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var laydate = layui.laydate;
    var $ = layui.$;
    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            emp_name: "",
            year: "",
            month: ""
        },
        methods: {
            addHesuan: function () {
                window.location.href = "/salary/addSalary";

            },
            search: function () {
                table.reload("salaryList", {
                    where: {
                        "emp_name": main.emp_name,
                        "year": main.year,
                        "month": main.month
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
                    elem: "#salaryList",
                    id: "salaryList",
                    url: "/salary/queryPageList",
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
                        , {field: 'emp_pos', title: '员工类型'}
                        , {field: 'emp_name', title: '员工姓名', align: "center"}
                        , {field: 'real_money', title: '实发工资', align: "center"}
                        , {field: 'base_money', title: '基本工资', align: "center"}
                        , {field: 'profit_money', title: '提成工资', align: "center"}
                        , {field: 'other_money', title: '其它开支', align: "center"}
                        , {
                            field: 'month', title: '月份', align: "center", templet: function (d) {
                                return d.year + "年" + d.month + "月";
                            }
                        }
                        , {title: '操作', fixed: 'right', align: 'center', toolbar: '#options', width: 120}
                    ]]
                });
                // 监听工具条
                table.on('tool(salaryList)', function (obj) {
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值

                    // 修改
                    if (layEvent === 'update') {
                        window.location.href = "/salary/updateSalary?id=" + data.id;
                    }
                    // 删除
                    if (layEvent === 'delete') {
                        layer.confirm("数据删除后不可恢复，确认删除吗？", function () {
                            // 请求后台，删除数据
                            main.$http.post('/salary/delete', {"id": data.id}, {emulateJSON: true}).then(function (res) {
                                if (res.body.code == 1) {
                                    layer.msg("删除成功");
                                    // 刷新列表
                                    table.reload("salaryList");
                                } else {
                                    layer.msg("删除失败");
                                }
                            }, function (res) {
                                layer.msg("服务器请求异常");
                            });
                        })
                    }
                });
            }

        }
        ,
        mounted: function () {
            // 初始化表格
            this.initTable();

        }
    });
});