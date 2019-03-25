<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/25
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>经营数据</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home/operateData.css">
</head>
<body>
<div class="main" id="main">
    <p class="page-title"><span class="flag">&nbsp;</span>经营数据</p>
    <div class="search">
        <div class="search-item">本日</div>
        <div class="search-item">本周</div>
        <div class="search-item">本月</div>
        <div class="search-item date">2019-02-23 至 2019-03-25</div>
    </div>
    <div class="data-list">
        <p class="title">订单数据</p>
        <div class="infos">
            <div class="info">
                <p>订单录入</p>
                <p><em>1</em>单</p>
                <p><em>200.00</em>元</p>
            </div>
            <div class="info">
                <p>尚未派单</p>
                <p><em>1</em>单</p>
                <p><em>200.00</em>元</p>
            </div>
            <div class="info">
                <p>已经派单</p>
                <p><em>1</em>单</p>
                <p><em>200.00</em>元</p>
            </div>
            <div class="info">
                <p>完成订单</p>
                <p><em>1</em>单</p>
                <p><em>200.00</em>元</p>
            </div>
            <div class="info">
                <p>作废订单</p>
                <p><em>1</em>单</p>
                <p><em>200.00</em>元</p>
            </div>
        </div>
    </div>
    <div class="data-list">
        <p class="title">财务数据</p>
        <div class="infos">
            <div class="info">
                <p>现金已收</p>
                <p><em>1</em>单</p>
                <p><em>200.00</em>元</p>
            </div>
            <div class="info">
                <p>欠款已收</p>
                <p><em>1</em>单</p>
                <p><em>200.00</em>元</p>
            </div>
            <div class="info">
                <p>欠款未收</p>
                <p><em>1</em>单</p>
                <p><em>200.00</em>元</p>
            </div>
            <div class="info">
                <p>已结算订单</p>
                <p><em>1</em>单</p>
                <p><em>200.00</em>元</p>
            </div>
            <div class="info">
                <p>未结算订单</p>
                <p><em>1</em>单</p>
                <p><em>200.00</em>元</p>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/home/operateData.js"></script>
</body>
</html>
