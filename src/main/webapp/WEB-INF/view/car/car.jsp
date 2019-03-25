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
    <div class="layui-btn-container">
        <button class="layui-btn" @click="addCar">增加汽车</button>
        <button class="layui-btn layui-btn-normal" @click="updateCar">修改汽车</button>
        <button class="layui-btn layui-btn-danger" @click="deleteCar">删除汽车</button>
    </div>
    <div class="search-tools">
        <div class="search-item">
            车牌号：
            <div class="layui-input-inline">
                <input class="layui-input" name="license" autocomplete="off" v-model="license">
            </div>
        </div>
        <div class="search-item">
            发动号：
            <div class="layui-input-inline">
                <input class="layui-input" name="engine" autocomplete="off" v-model="engine">
            </div>
        </div>
        <div class="search-item">
            车架号：
            <div class="layui-input-inline">
                <input class="layui-input" name="vin" autocomplete="off" v-model="vin">
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    </div>
    <table id="carList" lay-filter="carList"></table>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/car/car.js"></script>
</body>
</html>
