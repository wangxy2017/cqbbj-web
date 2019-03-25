<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/10
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>收支明细</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/moneyDetail/moneyDetail.css">
</head>
<body>
<div class="main" id="main">
    <div class="search-tools">
        <div class="search-item">
            交易时间：
            <div class="layui-input-inline">
                <input class="layui-input" name="startTime" id="startTime" autocomplete="off">
            </div>
            至：
            <div class="layui-input-inline">
                <input class="layui-input" name="endTime" id="endTime" autocomplete="off">
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    </div>
    <table id="moneyDetailList" lay-filter="moneyDetailList"></table>
    <%-- 工具条存放区域--%>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/moneyDetail/moneyDetail.js"></script>
</body>
</html>
