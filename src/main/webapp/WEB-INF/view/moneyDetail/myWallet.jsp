<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/10
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>我的钱包</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/moneyDetail/myWallet.css">
</head>
<body>
<div class="main" id="main">
    <h1 class="title"><span class="flag">&nbsp;</span>我的钱包</h1>
    <p class="moneyInfo">可用余额：<em class="money">1000.00</em>元</p>
    <hr>
    <p style="padding-left: 10px;">提成记录：</p>
    <table id="divideList" lay-filter="divideList"></table>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/moneyDetail/myWallet.js"></script>
</body>
</html>
