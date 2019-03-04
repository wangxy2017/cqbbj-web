<%--
  Created by IntelliJ IDEA.
  User: 王孝元
  Date: 2019/1/18
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/orderList_02.css">
</head>
<body>
<div class="main" id="main">
    <div class="search-tools">
        订单编号：
        <div class="layui-inline">
            <input class="layui-input" name="order_no"autocomplete="off" placeholder="输入订单编号" v-model="order_no">
        </div>
        客户名称：
        <div class="layui-inline">
            <input class="layui-input" name="name"autocomplete="off" placeholder="输入客户名称" v-model="name">
        </div>
        预约时间：
        <div class="layui-inline">
            <input class="layui-input" id="beginTime1" name="beginTime1"autocomplete="off" placeholder="YYYY-MM-DD" v-model="beginTime1">
        </div>
        至
        <div class="layui-inline">
            <input class="layui-input" id="beginTime2" name="beginTime2"autocomplete="off" placeholder="YYYY-MM-DD" v-model="beginTime2">
        </div>
        <button class="layui-btn" @click="search">搜索</button>
    </div>
    <table id="orderList" lay-filter="orderList"></table>
    <%-- 工具条存放区域--%>
    <script type="text/html" id="options">
        <a class="layui-btn layui-btn-xs" lay-event="dispatch">派单</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="update">修改</a>
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="cancel">取消</a>
    </script>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/order/orderList_02.js"></script>
</body>
</html>
