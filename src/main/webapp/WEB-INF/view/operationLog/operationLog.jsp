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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/operationLog/operationLog.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
    <div class="layui-btn-container">
        <button class="layui-btn" @click="download">导出日志</button>
    </div>
    <%-- 搜索栏 --%>
    <div class="search-tools">
        <div class="search-item">
            操作人：
            <div class="layui-input-inline">
                <input class="layui-input" name="name" autocomplete="off" placeholder="输入操作人" v-model="name">
            </div>
        </div>
        <div class="search-item">
            操作内容：
            <div class="layui-input-inline">
                <input class="layui-input" name="content" autocomplete="off" placeholder="输入操作内容" v-model="content">
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    </div>
    <table id="operationLogList" lay-filter="operationLogList"></table>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/operationLog/operationLog.js"></script>
</body>
</html>
