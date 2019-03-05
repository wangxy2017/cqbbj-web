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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/salary/payRecord.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
        <div class="search-tools">
            订单号：
            <div class="layui-inline">
                <input class="layui-input" name="order_no" autocomplete="off" v-model="order_no">
            </div>
            交易号：
            <div class="layui-inline">
                <input class="layui-input" name="trans_no" autocomplete="off" v-model="trans_no">
            </div>
            支付类型：
            <div class="layui-inline">
                <select class="layui-input" name="payWay"  v-model="payWay">
                    <option value="">全部</option>
                    <option value="0">现金</option>
                    <option value="1">微信</option>
                    <option value="2">签单</option>
                </select>
            </div>
            支付时间：
            <div class="layui-inline">
                <input class="layui-input" name="startTime" id="startTime" autocomplete="off" v-model="startTime">
            </div>
            至
            <div class="layui-inline">
                <input class="layui-input" name="endTime" id="endTime" autocomplete="off" v-model="endTime">
            </div>
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    <table id="payRecordList" lay-filter="payRecordList"></table>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/salary/payRecord.js"></script>
</body>
</html>
