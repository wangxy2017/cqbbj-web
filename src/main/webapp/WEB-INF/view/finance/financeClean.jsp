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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/finance/financeClean.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
    <div class="search-tools">
        <div class="search-item">
            订单号：
            <div class="layui-input-inline">
                <input class="layui-input" name="order_no" placeholder="输入订单编号" autocomplete="off" v-model="order_no">
            </div>
        </div>
        <div class="search-item">
            客户名称：
            <div class="layui-input-inline">
                <input class="layui-input" name="name" placeholder="输入客户姓名" autocomplete="off" v-model="name">
            </div>
        </div>
        <div class="search-item">
            状态：
            <div class="layui-input-inline" style="width: 70px;">
                <select name="is_clean" class="layui-input" v-model="is_clean">
                    <option value="">请选择</option>
                    <option value="0">未结算</option>
                    <option value="1">已结算</option>
                </select>
            </div>
        </div>
        <div class="search-item">
            完成时间：
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="beginTime1" id="beginTime1" placeholder="选择开始时间" autocomplete="off">
            </div>
            至
            <div class="layui-input-inline">
                <input class="layui-input" name="beginTime2" id="beginTime2" placeholder="选择结束时间" autocomplete="off">
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    </div>
    <table id="financeCleanList" lay-filter="financeCleanList"></table>
    <%-- 工具条存放区域--%>
    <script type="text/html" id="options">
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="view">查看</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="clean">结算</a>
    </script>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/finance/financeClean.js"></script>
</body>
</html>
