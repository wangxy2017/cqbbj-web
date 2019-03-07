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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/salary/SignBill.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
        <div class="search-tools">
            订单号：
            <div class="layui-inline">
                <input class="layui-input" name="order_no" autocomplete="off" v-model="order_no">
            </div>
           客户名称：
            <div class="layui-inline">
                <input class="layui-input" name="name" autocomplete="off" v-model="name">
            </div>
            员工类型：
            <div class="layui-inline">
                <select class="layui-input" name="status"  v-model="status">
                    <option value="">全部</option>
                    <option value="0">未付款</option>
                    <option value="1">已付款</option>

                </select>
            </div>

            结算时间：
            <div class="layui-inline">
                <input type="text" class="layui-input" name="startTime" id="startTime" autocomplete="off">
            </div>
            至
            <div class="layui-inline">
                <input class="layui-input" name="finishTime" id="finishTime" autocomplete="off">
            </div>
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    <table id="signBillList" lay-filter="signBillList"></table>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/salary/SignBill.js"></script>
</body>
</html>
