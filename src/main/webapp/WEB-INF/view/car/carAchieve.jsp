<%--
  Created by IntelliJ IDEA.
  User: liulei
  Date: 2019/2/26
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/car/car.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
        <div class="search-tools">
            车牌号：
            <div class="layui-inline">
                <input class="layui-input" name="license" autocomplete="off" v-model="license">
            </div>
            发动号：
            <div class="layui-inline">
                <input class="layui-input" name="engine" autocomplete="off" v-model="engine">
            </div>
            车架号：
            <div class="layui-inline">
                <input class="layui-input" name="vin" autocomplete="off" v-model="vin">
            </div>
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    <table id="AchieveList" lay-filter="AchieveList"></table>
    <%-- 工具条存放区域--%>

</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/car/carAchieve.js"></script>
</body>
</html>
