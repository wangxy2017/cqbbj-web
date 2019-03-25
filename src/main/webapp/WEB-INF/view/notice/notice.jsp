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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice/notice.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
    <div class="layui-btn-container">
        <button class="layui-btn" @click="addNotice">添加公告</button>
        <button class="layui-btn layui-btn-normal" @click="updateNotice">修改公告</button>
        <button class="layui-btn layui-btn-danger" @click="deleteNotice">删除公告</button>
    </div>
        <%-- 搜索栏 --%>
        <div class="search-tools">
            <div class="search-item">
                公告标题：
                <div class="layui-input-inline">
                    <input class="layui-input" name="title" autocomplete="off" placeholder="输入公告标题" v-model="title">
                </div>
            </div>
            <div class="search-item">
                发布人：
                <div class="layui-input-inline">
                    <input class="layui-input" name="empName" autocomplete="off" placeholder="输入客户名称" v-model="empName">
                </div>
            </div>
            <div class="search-item">
                <button class="layui-btn" @click="search">搜索</button>
            </div>
        </div>
    <table id="noticeList" lay-filter="noticeList"></table>
    <%-- 工具条存放区域--%>
    <script type="text/html" id="options">
        <a class="layui-btn layui-btn-xs" lay-event="push">推送</a>
    </script>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notice/notice.js"></script>
</body>
</html>
