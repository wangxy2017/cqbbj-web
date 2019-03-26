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
        <div class="search-item" @click="choose('day')">今天</div>
        <div class="search-item" @click="choose('week')">本周</div>
        <div class="search-item" @click="choose('month')">本月</div>
        <div class="search-item date" id="date"></div>
    </div>
    <div class="data-list">
        <p class="title">订单数据</p>
        <div class="infos">
            <div class="info">
                <p>意向订单</p>
                <p><em>{{returnInt(data.intention)}}</em>单</p>
                <p><em>{{returnDouble(data.intentionMoney)}}</em>元</p>
            </div>
            <div class="info">
                <p>尚未派单</p>
                <p><em>{{returnInt(data.unDispatch)}}</em>单</p>
                <p><em>{{returnDouble(data.unDispatchMoney)}}</em>元</p>
            </div>
            <div class="info">
                <p>已经派单</p>
                <p><em>{{returnInt(data.dispatch)}}</em>单</p>
                <p><em>{{returnDouble(data.dispatchMoney)}}</em>元</p>
            </div>
            <div class="info">
                <p>完成订单</p>
                <p><em>{{returnInt(data.done)}}</em>单</p>
                <p><em>{{returnDouble(data.doneMoney)}}</em>元</p>
            </div>
            <div class="info">
                <p>作废订单</p>
                <p><em>{{returnInt(data.cancel)}}</em>单</p>
                <p><em>{{returnDouble(data.cancelMoney)}}</em>元</p>
            </div>
        </div>
    </div>
    <div class="data-list">
        <p class="title">财务数据</p>
        <div class="infos">
            <div class="info">
                <p>已收款订单</p>
                <p><em>{{returnInt(data.pay)}}</em>单</p>
                <p><em>{{returnDouble(data.payMoney)}}</em>元</p>
            </div>
            <div class="info">
                <p>未收款订单</p>
                <p><em>{{returnInt(data.unPay)}}</em>单</p>
                <p><em>{{returnDouble(data.unPayMoney)}}</em>元</p>
            </div>
            <div class="info">
                <p>已结算订单</p>
                <p><em>{{returnInt(data.clean)}}</em>单</p>
                <p><em>{{returnDouble(data.cleanMoney)}}</em>元</p>
            </div>
            <div class="info">
                <p>未结算订单</p>
                <p><em>{{returnInt(data.unClean)}}</em>单</p>
                <p><em>{{returnDouble(data.unCleanMoney)}}</em>元</p>
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
