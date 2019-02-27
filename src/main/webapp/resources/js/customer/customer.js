// JavaScript代码区域
layui.use(["table", "layer"], function () {
    var table = layui.table;
    var layer = layui.layer;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {
            searchNo:"",
            searchName:"",
            searchWX:""
        },
        methods: {
            search:function(){

            },
            // 修改Customer信息
            updateCustomer: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus('customerList');
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行进行修改");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("只能同时操作一行数据");
                    return;
                }
                // 跳转修改界面
                window.location.href = "/customer/customerUpdate?id=" + checkStatus.data[0].id;
            },
            // 删除员工
            deleteCustomer: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus("customerList");

                if (checkStatus.data.length == 0) {
                    layer.msg("请至少选择一行数据");
                    return;
                }
                var item="";
                for(var i=0;i<checkStatus.data.length;i++){
                    item = item+checkStatus.data[i].id+",";
                }

                layer.confirm("删除客户将放入回收站，确认删除吗？", function () {
                    // 请求后台，删除数据
                    main.$http.post('/customer/deleteActiveBatch', {"ids": item.substring(0,item.length-1)}, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            layer.msg("删除成功");
                            // 刷新列表
                            table.reload("customerList");
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
        elem: "#customerList",
        id: "customerList",
        url: "/customer/queryPageList",
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
            , {field: 'cust_no', title: '客户编号'}
            , {field: 'phone', title: '客户电话'}
            , {field: 'wxname', title: '微信昵称'}
            , {field: 'name', title: '客户姓名'}
            , {
                field: 'createTime', title: '注册时间', sort: true, templet: function (d) {
                    return formatDateTime(d.createTime);
                }
            }
        ]]
    });
});