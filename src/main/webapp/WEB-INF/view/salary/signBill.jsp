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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/salary/signBill.css">
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
            客户名称：
            <div class="layui-input-inline">
                <input class="layui-input" name="name" autocomplete="off" v-model="name">
            </div>
        </div>
        <div class="search-item">
            收款状态：
            <div class="layui-input-inline" style="width: 66px;">
                <select class="layui-input" name="status" v-model="status">
                    <option value="">全部</option>
                    <option value="0">未收款</option>
                    <option value="1">已收款</option>

                </select>
            </div>
        </div>
        <div class="search-item">
            完成时间：
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="startTime" id="startTime" autocomplete="off">
            </div>
            至
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="finishTime" id="finishTime" autocomplete="off">
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    </div>
    <table id="signBillList" lay-filter="signBillList"></table>
    <%-- 工具条存放区域--%>
    <script type="text/html" id="options">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="receive">收款</a>
    </script>
    <%-- 辅助收款 --%>
    <form class="layui-form" action="" id="receiveForm" style="display: none;margin-top: 20px">
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
            <label class="layui-form-label">收款金额</label>
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
<script src="${pageContext.request.contextPath}/resources/js/salary/signBill.js"></script>
</body>
</html>
