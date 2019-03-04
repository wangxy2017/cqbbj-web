<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/28
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>派单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/dispatch.css">
</head>
<body>
<div id="main" data-id="<%=request.getParameter("order_no")%>">
    <%-- 表单区域 --%>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">订单编号：</label>
            <div class="layui-input-inline">
                <input type="text" name="order_no" placeholder="请输入订单编号"
                       autocomplete="off"
                       class="layui-input" v-model="order_no" disabled>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收款人员：</label>
            <div class="layui-input-inline">
                <input type="text" name="empName" required lay-verify="required" placeholder="指定收款人员" autocomplete="off"
                       class="layui-input" v-model="moneyEmp.name">
            </div>
            <button type="button" style="margin-top: 4px;" class="layui-btn layui-btn-sm"
                    @click="queryEmpList('money')">选择员工
            </button>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">司机：</label>
            <div class="layui-input-block">
                <span class="item" v-for="item in driveEmps" v-text="item.name" :key="item.id"></span>
                <button type="button" class="layui-btn layui-btn-sm" @click="queryEmpList('drive')">选择员工
                </button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">搬运工：</label>
            <div class="layui-input-block">
                <span class="item" v-for="item in moveEmps" v-text="item.name" :key="item.id"></span>
                <button type="button" class="layui-btn layui-btn-sm" @click="queryEmpList('move')">选择员工
                </button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">空调工：</label>
            <div class="layui-input-block">
                <span class="item" v-for="item in airEmps" v-text="item.name" :key="item.id"></span>
                <button type="button" class="layui-btn layui-btn-sm" @click="queryEmpList('air')">选择员工</button>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="dispatchOrder">立即提交</button>
                <button type="button" class="layui-btn layui-btn-primary" @click="resetForm">重置</button>
            </div>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/order/dispatch.js"></script>
</body>
</html>
