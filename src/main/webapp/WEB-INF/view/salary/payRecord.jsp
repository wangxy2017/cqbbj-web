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
        <div class="search-item">
            订单号：
            <div class="layui-input-inline">
                <input class="layui-input" name="order_no" autocomplete="off" v-model="order_no">
            </div>
        </div>
        <div class="search-item">
            交易号：
            <div class="layui-input-inline">
                <input class="layui-input" name="trans_no" autocomplete="off" v-model="trans_no">
            </div>
        </div>
        <div class="search-item">
            支付类型：
            <div class="layui-input-inline" style="width: 60px;">
                <select class="layui-input" name="payWay" v-model="payWay">
                    <option value="">全部</option>
                    <option value="0">现金</option>
                    <option value="1">微信</option>
                    <option value="2">欠条</option>
                </select>
            </div>
        </div>
        <div class="search-item">
            支付时间：
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="startTime" id="startTime" autocomplete="off">
            </div>
            至
            <div class="layui-input-inline">
                <input class="layui-input" name="endTime" id="endTime" autocomplete="off">
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" @click="search">搜索</button>
        </div>
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
