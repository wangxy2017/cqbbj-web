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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customer/customer.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
    <div class="layui-btn-container">

        <button class="layui-btn layui-btn-normal" @click="updateCustomer">修改客户信息</button>
        <button class="layui-btn layui-btn-danger" @click="deleteCustomer">删除客户信息</button>
    </div>
        <div class="search-tools">

            <div class="layui-inline">
                客户账号： <input class="layui-input" name="searchNo"autocomplete="off"  v-model="searchNo">
                姓名： <input class="layui-input" name="searchName"autocomplete="off"  v-model="searchName">
                微信名称： <input class="layui-input" name="searchWX"autocomplete="off"  v-model="searchWX">
            </div>
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    <table id="customerList" lay-filter="customerList"></table>
    <%-- 工具条存放区域--%>

</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/customer/customer.js"></script>
</body>
</html>
