<%--
  Created by IntelliJ IDEA.
  User: liulei
  Date: 2019/3/5
  Time: 9:36
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/salary/orderDivide.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
        <div class="search-tools">
            订单号：
            <div class="layui-inline">
                <input class="layui-input" name="order_no" autocomplete="off" v-model="order_no">
            </div>
            员工名称：
            <div class="layui-inline">
                <input class="layui-input" name="emp_name" autocomplete="off" v-model="emp_name">
            </div>
            员工类型：
            <div class="layui-inline">
                <select class="layui-input" name="emp_pos"  v-model="emp_pos">
                    <option value="">全部</option>
                    <option value="1">搬运工</option>
                    <option value="2">空调工</option>
                    <option value="3">初级司机</option>
                    <option value="4">中级司机</option>
                    <option value="5">高级司机</option>
                </select>
            </div>

            结算时间：
            <div class="layui-inline">
                <input type="text" class="layui-input" name="startTime" id="startTime" autocomplete="off">
            </div>
            至
            <div class="layui-inline">
                <input class="layui-input" name="endTime" id="endTime" autocomplete="off">
            </div>
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    <table id="orderDivideList" lay-filter="orderDivideList"></table>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/salary/orderDivide.js"></script>
</body>
</html>
