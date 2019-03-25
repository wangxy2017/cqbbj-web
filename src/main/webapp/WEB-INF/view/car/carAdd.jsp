<%--
  Created by IntelliJ IDEA.
  User: liulei
  Date: 2019/1/18
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/car/carAdd.css">
</head>
<body>
<div class="main" id="main">
    <%-- 页面返回键 --%>
    <a class="layui-btn go-back" href="javascript:window.history.back()">
        <i class="layui-icon">&#xe603;</i>返回
    </a>
    <%-- 表单区域 --%>
    <form class="layui-form" action="/car/save" method="post">
        <div class="layui-form-item layui-hide">
            <%-- 表单隐藏区域 --%>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">车牌号</label>
            <div class="layui-input-inline">
                <input type="text" name="license" required lay-verify="required" placeholder="请输入车辆车牌号"
                       autocomplete="off"
                       class="layui-input">
            </div>

            <label class="layui-form-label">车架号</label>
            <div class="layui-input-inline">
                <input type="text" name="vin" required lay-verify="required" placeholder="请输入车架号"
                       autocomplete="off"
                       class="layui-input" v-model="car.vin">
            </div>


        </div>
            <div class="layui-form-item">
                <label class="layui-form-label">发动机号</label>
                <div class="layui-input-inline">
                    <input type="text" name="engine" required lay-verify="required" placeholder="请输入车辆发动机号"
                           autocomplete="off"
                           class="layui-input">
                </div>
                <label class="layui-form-label">品牌型号</label>
                <div class="layui-input-inline">
                    <input type="text" name="brand" required lay-verify="required" placeholder="请输入车辆品牌型号"
                           autocomplete="off"
                           class="layui-input">
                </div>


            </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">保险到期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="insurance_date" id="insurance_date" required lay-verify="required"
                               placeholder="YYYY-MM-DD"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                    <label class="layui-form-label">年审到期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="examined_date" id="examined_date" required lay-verify="required"
                               placeholder="YYYY-MM-DD"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">采购日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="purchase_date" id="purchase_date" required lay-verify="required"
                                   placeholder="YYYY-MM-DD"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">默认司机</label>
                        <div class="layui-input-inline">
                            <input type="text" name="emp_no" required lay-verify="required" placeholder="请输入车辆司机名称"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">车辆类型</label>
                        <div class="layui-input-inline">
                            <select name="carType">
                                <option value="">请选择类型</option>
                                <option value="0">大货车</option>
                                <option value="1">小货车</option>
                                <option value="2">轿车</option>
                            </select>

                        </div>
                        <label class="layui-form-label">车辆状态</label>
                        <div class="layui-input-inline">
                            <select name="status" lay-verify="">
                                <option value="">请选择状态</option>
                                <option value="0">正常</option>
                                <option value="1">锁定</option>
                                <option value="2">报废</option>
                            </select>
                        </div>
                    </div>



                    <div class="layui-form-item">
                        <div class="layui-input-inline">
                            <button class="layui-btn" lay-submit lay-filter="addCar">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
    </form>

    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/car/carAdd.js"></script>
</div>
</body>
</html>
