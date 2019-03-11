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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/intentionOrder/intentionOrderView.css">
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
            <label class="order-item">搬运内容：{{order.content}}</label>
        </p>
    </div>
    <div class="order-follow">
        <p class="title">跟进记录：</p>
        <ul class="layui-timeline" v-if="order.follows">
            <li class="layui-timeline-item" v-for="item in order.follows">
                <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                <div class="layui-timeline-content layui-text">
                    <p class="layui-timeline-title">{{formatDateTime(item.time)}}</p>
                    <p>{{item.content}}</p>
                </div>
            </li>
        </ul>
        <p class="no-data" v-else>【暂无数据】</p>
    </div>
    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/intentionOrder/intentionOrderView.js"></script>
</div>
</body>
</html>
