// JavaScript代码区域
layui.use(["table", "layer", "jquery", "laydate"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var laydate = layui.laydate;
    var $ = layui.$;
    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {},
        methods: {
            /**
             * 初始化日历
             */
            initCalander: function () {
                //开始时间
                laydate.render({
                    elem: '#startTime',
                    type: "datetime"
                });
                //结束时间
                laydate.render({
                    elem: '#endTime',
                    type: "datetime"
                });
            },
            /**
             * 搜索
             */
            search: function () {
                table.reload("moneyDetailList", {
                    where: {
                        "startTime": $("#startTime").val(),
                        "endTime": $("#endTime").val()
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
                    elem: "#moneyDetailList",
                    id: "moneyDetailList",
                    url: "/moneyDetail/queryPageList",
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
                        , {field: 'money_no', title: '交易单号', width: 200}
                        , {
                            field: 'type', title: '收支类型', align: "center", width: 120, templet: function (d) {
                                return d.type == 0 ? "<span style='color: #009688'>收入</span>" : "<span style='color: #FF5722'>支出</span>";
                            }
                        }
                        , {field: 'money', title: '收入金额', align: "center", width: 120}
                        , {field: 'restMoney', title: '可用余额', align: "center", width: 120}
                        , {field: 'remark', title: '备注', align: "center"}
                        , {
                            field: 'createTime', title: '创建时间', width: 200, sort: true, templet: function (d) {
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