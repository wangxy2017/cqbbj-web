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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home/myTask.css">
</head>
<body>
<div class="main" id="main">
    <div class="search-tools">
        <div class="search-item">
            预约时间：
            <div class="layui-input-inline">
                <input class="layui-input" id="beginTime1" name="beginTime1" autocomplete="off" placeholder="选择开始时间">
            </div>
            至
            <div class="layui-input-inline">
                <input class="layui-input" id="beginTime2" name="beginTime2" autocomplete="off" placeholder="选择结束时间">
            </div>
        </div>
        <div class="search-item">
            任务状态：
            <div class="layui-input-inline" style="width: 70px;">
                <select class="layui-input" v-model="status">
                    <option value="1">未完成</option>
                    <option value="2">已完成</option>
                </select>
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    </div>
    <table id="myTaskList" lay-filter="myTaskList"></table>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/home/myTask.js"></script>
</body>
</html>
