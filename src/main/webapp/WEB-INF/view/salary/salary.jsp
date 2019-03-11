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
    <div class="layui-btn-container">
        <button class="layui-btn" @click="addHesuan">新增核算</button>
    </div>
    <div class="search-tools">
        <div class="search-item">
            员工名称：
            <div class="layui-input-inline">
                <input class="layui-input" name="emp_name" autocomplete="off" v-model="emp_name">
            </div>
        </div>
        <div class="search-item">
            月份：
            <div class="layui-input-inline" style="width: 70px;">
                <select class="layui-input" name="year" v-model="year">
                    <option value="">请选择</option>
                    <option value="2017">2017 年</option>
                    <option value="2018">2018 年</option>
                    <option value="2019">2019 年</option>
                    <option value="2020">2020 年</option>
                    <option value="2021">2021 年</option>
                    <option value="2022">2022 年</option>
                    <option value="2023">2023 年</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 70px;">
                <select class="layui-input" name="month" v-model="month">
                    <option value="">请选择</option>
                    <option value="1">1 月</option>
                    <option value="2">2 月</option>
                    <option value="3">3 月</option>
                    <option value="4">4 月</option>
                    <option value="5">5 月</option>
                    <option value="6">6 月</option>
                    <option value="7">7 月</option>
                    <option value="8">8 月</option>
                    <option value="9">9 月</option>
                    <option value="10">10 月</option>
                    <option value="11">11 月</option>
                    <option value="12">12 月</option>
                </select>
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    </div>
    <table id="salaryList" lay-filter="salaryList"></table>
    <%-- 工具条存放区域--%>
    <script type="text/html" id="options">
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="update">修改</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
    </script>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/salary/salary.js"></script>
</body>
</html>
