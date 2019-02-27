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
</div>
<div class="search-tools">
    车牌号：
    <div class="layui-inline">
        <input class="layui-input" name="searchNo"autocomplete="off"  v-model="searchNo">
    </div>
    品牌型号：
    <div class="layui-inline">
        <input class="layui-input" name="searchName"autocomplete="off"  v-model="searchName">
    </div>
    车辆编号：
    <div class="layui-inline">
        <input class="layui-input" name="searchWX" autocomplete="off"  v-model="searchWX">
    </div>
    <button class="layui-btn" @click="search">搜索</button>

    <table id="carList" lay-filter="carList"></table>
    <%-- 工具条存放区域--%>

</div>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/car/car.js"></script>
</body>
</html>
