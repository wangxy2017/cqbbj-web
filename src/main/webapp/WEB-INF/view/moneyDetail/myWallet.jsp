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
<h2>我的钱包</h2>
<p>可用余额：<span id="yue"></span>元</p>
    <p color="gray">温馨提示：账户余额用于系统续费和短信充值使用</p><hr/>
    <div class="search-tools">
        充值金额：
    <div class="layui-inline">
        <input class="layui-input" name="money" autocomplete="off" v-model="money">
        <span color="gray">交易限额说明：每笔充值金额不能大于3000，可多次充值！</span>
    </div>
        <button class="layui-btn" @click="charge">充值</button>
</div>

</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/moneyDetail/myWallet.js"></script>
</body>
</html>
