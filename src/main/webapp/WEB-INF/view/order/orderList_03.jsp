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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/orderList_03.css">
</head>
<body>
<div class="main" id="main">
    <div class="search-tools">
        订单编号：
        <div class="layui-inline">
            <input class="layui-input" name="order_no" autocomplete="off" placeholder="输入订单编号" v-model="order_no">
        </div>
        客户名称：
        <div class="layui-inline">
            <input class="layui-input" name="name" autocomplete="off" placeholder="输入客户名称" v-model="name">
        </div>
        预约时间：
        <div class="layui-inline">
            <input class="layui-input" id="beginTime1" name="beginTime1" autocomplete="off" placeholder="选择开始时间">
        </div>
        至
        <div class="layui-inline">
            <input class="layui-input" id="beginTime2" name="beginTime2" autocomplete="off" placeholder="选择结束时间">
        </div>
        <button class="layui-btn" @click="search">搜索</button>
    </div>
    <table id="orderList" lay-filter="orderList"></table>
    <%-- 工具条存放区域--%>
    <script type="text/html" id="options">
        <a class="layui-btn layui-btn-xs" lay-event="helpDone">辅助完成</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="view">查看</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="update">修改</a>
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="cancel">取消</a>
    </script>
    <%-- 辅助收款 --%>
    <form class="layui-form" action="" id="helpDoneForm" style="display: none;margin-top: 20px">
        <div class="layui-form-item layui-hide">
            <input type="hidden" id="id">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单编号</label>
            <div class="layui-input-inline">
                <input type="text" id="order_no" placeholder="请输入订单编号"
                       autocomplete="off"
                       class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">实际收款</label>
            <div class="layui-input-inline">
                <input type="text" id="receiveMoney" placeholder="请输入实际收款"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收款备注</label>
            <div class="layui-input-inline">
                <textarea id="receiveText" placeholder="请输入备注" class="layui-textarea" style="width: 300px"></textarea>
            </div>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/order/orderList_03.js"></script>
</body>
</html>
