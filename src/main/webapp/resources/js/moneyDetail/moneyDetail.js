// JavaScript代码区域
layui.use(["table", "layer","jquery","laydate"], function () {
    var table = layui.table;
    var layer = layui.layer;
    var laydate=layui.laydate;
    var $=layui.$;
    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {

        },
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
            search:function(){
                table.reload("moneyDetailList", {
                    where: {
                        "startTime": $("#startTime").val(),
                        "endTime": $("#endTime").val()

                    }
                });
            }


        },
        mounted: function () {

            // 初始化日历插件
            this.initCalander();
        }
    });

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
            , {field: 'emp_no', title: '员工编号'}
            , {field: 'type', title: '收支类型'}
            , {field: 'money', title: '金额'}
            , {field: 'remark', title: '备注'}

            , {
                field: 'createTime', title: '创建时间', sort: true, templet: function (d) {
                    return formatDateTime(d.createTime);
                }
            }
        ]]
    });
});