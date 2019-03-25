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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/searchEmpList.css">
</head>
<body>
<div class="main">
    <div class="search-tools">
        <div class="search-item">
            部门：
            <div class="layui-input-inline" style="width: 80px;">
                <select id="deptName" class="layui-input">
                    <option value="">请选择</option>
                    <option value="搬运部">搬运部</option>
                    <option value="调度部">调度部</option>
                    <option value="运输部">运输部</option>
                    <option value="财务部">财务部</option>
                    <option value="行政部">行政部</option>
                </select>
            </div>
        </div>
        <div class="search-item">
            员工姓名：
            <div class="layui-input-inline">
                <input class="layui-input" id="name" autocomplete="off" placeholder="输入员工姓名">
            </div>
        </div>
        <div class="search-item">
            手机号：
            <div class="layui-input-inline">
                <input class="layui-input" id="phone" autocomplete="off" placeholder="输入手机号">
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" id="searchTable">搜索</button>
            <button class="layui-btn" id="selectEmp">确认选择</button>
        </div>
    </div>
    <table id="empList" lay-filter="empList"></table>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/order/searchEmpList.js"></script>
</body>
</html>
