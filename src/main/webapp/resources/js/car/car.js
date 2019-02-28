// JavaScript代码区域
layui.use(["table", "layer"], function () {
    var table = layui.table;
    var layer = layui.layer;

    // 创建vue实例
    var main = new Vue({
        el: "#main",
        data: {},
        methods: {
            // 添加车辆
            addCar: function () {
                window.location.href = "/car/carAdd";
            },
            // 修改车辆
            updateCar: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus('carList');
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行进行修改");
                    return;
                }
                if (checkStatus.data.length > 1) {
                    layer.msg("只能同时操作一行数据");
                    return;
                }
                // 跳转修改界面
                window.location.href = "/car/carUpdate?id=" + checkStatus.data[0].id;
            },
            // 删除车辆
            deleteCar: function () {
                // 获取选中行数据
                var checkStatus = table.checkStatus("carList");
                if (checkStatus.data.length == 0) {
                    layer.msg("请选择一行数据");
                    return;
                }
                var item="";
                for(var i=0;i<checkStatus.data.length;i++){
                    item = item+checkStatus.data[i].id+",";
                }

                layer.confirm("删除员工将放入回收站，确认删除吗？", function () {
                    // 请求后台，删除数据
                    main.$http.post('/car/deleteActive', {"ids": item.substring(0,item.length-1)}, {emulateJSON: true}).then(function (res) {
                        console.log(res.body);
                        if (res.body.code == 1) {
                            layer.msg("删除成功");
                            // 刷新列表
                            table.reload("carList");
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
        elem: "#carList",
        id: "carList",
        url: "/car/queryPageList",
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
            , {field: 'license', title: '车牌号'}
            , {field: 'brand', title: '品牌型号'}
            , {field: 'vin', title: '车架号'}
            , {field: 'carType', title: '车辆类型'}
            , {field: 'engine', title: '发动机号'}
            , {field: 'car_no', title: '车辆编号'}
            , {field: 'emp_no', title: '默认司机'}
            , {field: 'status', title: '车辆状态'}
            , {field: 'purchase_date', title: '采购日期', sort: true, templet: function (d) {
                    return formatDateTime(d.examined_date);
                }}
            , {field: 'insurance_date', title: '保险到期', sort: true, templet: function (d) {
                    return formatDateTime(d.insurance_date);
                }}
            , {field: 'examined_date', title: '年审到期', sort: true, templet: function (d) {
                    return formatDateTime(d.examined_date);
                }}
            , {
                field: 'createTime', title: '创建时间', sort: true, templet: function (d) {
                    return formatDateTime(d.createTime);
                }
            }
        ]]
    });
});