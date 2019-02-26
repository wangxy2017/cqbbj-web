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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dept/dept.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
    <div class="layui-btn-container">
        <button class="layui-btn" @click="addDept">增加客户</button>
        <button class="layui-btn layui-btn-normal" @click="updateDept">修改客户</button>
        <button class="layui-btn layui-btn-danger" @click="deleteDept">删除客户</button>
    </div>
    <table id="deptList" lay-filter="deptList"></table>
    <%-- 工具条存放区域--%>
    <script type="text/html" id="options">
        <a class="layui-btn layui-btn-xs" lay-event="bindMenu">设置权限</a>
    </script>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dept/car.js"></script>
</body>
</html>
