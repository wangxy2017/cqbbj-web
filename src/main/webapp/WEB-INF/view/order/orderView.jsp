<%--
Created by IntelliJ IDEA.
User: 王孝元
Date: 2019/1/18
Time: 15:01
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/orderView.css">
</head>
<body>
<div class="main" id="main" data-id="<%=request.getParameter("id")%>">
    <div class="order-info">
        <p>
            <label class="order-item">客户来源：{{order.source == 0?"电话":"网络"}}</label>
            <label class="order-item">客户类型：{{order.type == 0?"个人":"公司"}}</label>
        </p>
        <p>
            <label class="order-item">客户名称：{{order.name}}</label>
            <label class="order-item">电话：{{order.phone}}</label>
            <label class="order-item">预约时间：{{formatDateTime(order.beginTime)}}</label>
        </p>
        <p>
            <label class="order-item">搬出地址：{{order.start}}</label>
        </p>
        <p>
            <label class="order-item">搬入地址：{{order.end}}</label>
        </p>
        <p>
            <label class="order-item">备注情况：{{order.content}}</label>
        </p>
        <p v-if="order.driveEmps">
            <label class="order-item">司机：<span style="margin-right: 10px" v-for="item in order.driveEmps">{{item.emp_name}}</span></label>
        </p>
        <p v-if="order.moveEmps">
            <label class="order-item">搬运工：<span style="margin-right: 10px" v-for="item in order.moveEmps">{{item.emp_name}}</span></label>
        </p>
        <p v-if="order.airEmps">
            <label class="order-item">空调工：<span style="margin-right: 10px" v-for="item in order.airEmps">{{item.emp_name}}</span></label>
        </p>
        <p v-if="order.moneyEmps">
            <label class="order-item">收款人：<span style="margin-right: 10px" v-for="item in order.moneyEmps">{{item.emp_name}}</span></label>
        </p>
        <p>
            <label class="order-item">订单价格：￥{{order.price}}</label>
            <label class="order-item">实际收款：{{order.payState == 0?"未收款":order.receiveMoney}}</label>
        </p>
        <p>
            <label class="order-item">收款备注：{{order.receiveText}}</label>
        </p>
        <p>
            <label class="order-item">结算备注：{{order.is_clean == 0?"未结算":order.cleanText}}</label>
        </p>
        <p>
            <label class="order-item">下单时间：{{formatDateTime(order.createTime)}}</label>
            <label class="order-item">完成时间：{{formatDateTime(order.endTime)}}</label>
        </p>
        <p>
            <label class="order-item">支付时间：{{formatDateTime(order.payTime)}}</label>
        </p>
        <p>
            <label class="order-item">订单状态：<span :class="['item',statusColor]">{{statusName}}</span></label>
        </p>
    </div>
    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/order/orderView.js"></script>
</div>
</body>
</html>
