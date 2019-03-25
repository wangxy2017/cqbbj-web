// JavaScript代码区域
layui.use(["jquery", "form", "layer", "laydate"], function () {
    var $ = layui.$;
    var form = layui.form;
    var layer = layui.layer;
    var laydate = layui.laydate;

    var main = new Vue({
        el: "#main",
        data: {
            order: null
        },
        methods: {
            /**
             * 遍历items
             */
            showItems: function () {
                $.ajax({
                    url: "/order/queryConfig",
                    dataType: "json",
                    data: {},
                    type: "POST",
                    success: function (result) {
                        if (result.code == 1) {
                            // 遍历关键词
                            var arr = typeof result.data.keyword == "undefined" ? [] : result.data.keyword.split("/");
                            var html = "";
                            for (var i = 0; i < arr.length; i++) {
                                if (arr[i] != "")
                                    html += "<span class='item'>" + arr[i] + "</span>";
                            }
                            $("#items").empty().append(html);
                            // 绑定点击事件
                            $("#items .item").on("click", function () {
                                var _this = $(this);
                                var text = _this.text() + "/";
                                var content = $("#content").val();
                                if (_this.hasClass("active")) {
                                    _this.removeClass("active");
                                    if (content.indexOf(text) != -1)
                                        $("#content").val(content.replace(text, ""));
                                } else {
                                    _this.addClass("active");
                                    if (content.indexOf(text) == -1)
                                        $("#content").val(content + text);
                                }
                            });
                        }
                    },
                    error: function () {
                        layer.msg("服务器异常");
                    }
                });
            },
            /**
             * 初始化form
             */
            initForm: function () {
                //监听提交
                form.on('submit(updateOrder)', function (data) {
                    // console.log(data.field);
                    // 请求后台保存数据
                    $.ajax({
                        url: "/order/update",
                        dataType: "json",
                        data: data.field,
                        type: "POST",
                        success: function (result) {
                            // console.log(result);
                            // 保存成功，跳转页面
                            if (result.code == 1) {
                                window.location.href = "/order/orderList?page=2";
                            }
                        },
                        error: function () {
                            layer.msg("服务器异常");
                        }
                    });
                    return false;// 阻止表单跳转
                });
                // 初始化时间插件
                laydate.render({
                    elem: '#beginTime',
                    type: 'datetime',
                    btns: ['clear', 'confirm'],
                    value: new Date(main.order.beginTime)
                });
            },
            /**
             * 初始化地图
             */
            initMap: function () {
                // 百度地图API功能
                var map = new BMap.Map("baiduMap");
                map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);

                main.initSearchMap(map, $("#start"), $("#startResult"), $("#startMap"));
                main.initSearchMap(map, $("#end"), $("#endResult"), $("#endMap"));
            },
            /**
             * 初始化搜索控件
             * @param map
             * @param input
             * @param result
             */
            initSearchMap: function (map, input, result, inputMap) {
                var _map = map;
                var _input = $(input);
                var _result = $(result);
                var _inputMap = $(inputMap);
                var local = new BMap.LocalSearch(_map, {
                    onSearchComplete: function (results) {
                        // 判断状态是否正确
                        if (local.getStatus() == BMAP_STATUS_SUCCESS) {
                            var html = "";
                            for (var i = 0; i < results.getCurrentNumPois(); i++) {
                                var position = results.getPoi(i);
                                // console.log(position);
                                html += "<dd class='search-result' data-lng='" + position.point.lng + "' data-lat='" + position.point.lat + "'><span>" + position.city + position.title + "</span><i>" + position.address + "</i></dd>";
                            }
                            _result.empty().append(html).show();
                            // 绑定点击事件
                            _result.find("dd").on("click", function () {
                                var _this = $(this);
                                _input.val(_this.find("span").text());
                                _inputMap.val(_this.attr("data-lng") + "," + _this.attr("data-lat"));
                                _result.hide();
                            });
                        }
                    }
                });
                // 绑定搜索
                var flag = true;
                _input.on("compositionstart", function () {
                    flag = false;
                });
                _input.on("compositionend", function () {
                    flag = true;
                });
                _input.on("input", function () {
                    setTimeout(function () {
                        if (flag && _input.val() != "") {
                            local.search("重庆市" + _input.val());
                        }
                    }, 0);
                });
                _input.on("blur", function () {
                    setTimeout(function () {
                        _result.hide();
                    }, 200);
                });
            }

        },
        mounted: function () {
            this.$http.post("/order/queryById", {"id": $("#main").attr("data-id")}, {emulateJSON: true}).then(function (res) {
                // console.log(res.body);
                // 加载数据
                if (res.body.code == 1) {
                    main.order = res.body.data;
                    this.$nextTick(function () {
                        // 重新渲染表单
                        form.render();
                        this.showItems();
                        this.initForm();
                        this.initMap();
                    });
                } else {
                    layer.msg("查询数据异常");
                }
            }, function (res) {
                layer.msg("服务器请求异常");
            });
        }
    });
});