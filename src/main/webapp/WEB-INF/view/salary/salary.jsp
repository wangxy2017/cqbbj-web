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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/salary/salary.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
        <div class="search-tools">

           员工名称：
            <div class="layui-inline">
                <input class="layui-input" name="emp_name" autocomplete="off" v-model="emp_name">
            </div>
           月份
            <div class="layui-inline">
                <select class="layui-input" name="month"  v-model="month">
                    <option value="">全部</option>
                    <option value="0">未付款</option>
                    <option value="1">已付款</option>

                </select>
            </div>
            <button class="layui-btn" @click="search">搜索</button>
        </div>


        <button class="layui-btn layui-btn-normal" @click="addHesuan">新增核算</button>


    <table id="signBillList" lay-filter="signBillList"></table>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/salary/salary.js"></script>
</body>
</html>
