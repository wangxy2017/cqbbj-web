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
                        , {field: 'id', title: 'ID编号'}
                        , {field: 'emp_pos', title: '员工类型'}
                        , {field: 'emp_name', title: '员工姓名'}
                        , {field: 'real_money', title: '实发工资'}
                        , {field: 'base_money', title: '基本工资'}
                        , {field: 'profit_money', title: '提成工资'}
                        , {field: 'other_money', title: '其它开支'}
                        , {
                            field: 'month', title: '月份', templet: function (d) {
                                return d.year + " - " + d.month;
                            }
                        }

                    ]]
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