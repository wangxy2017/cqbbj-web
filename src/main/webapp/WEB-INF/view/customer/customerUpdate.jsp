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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customer/customerUpdate.css">
</head>
<body>
<div class="main" id="main" data-id="<%= request.getParameter("id")%>">
    <%-- 页面返回键 --%>
    <a class="layui-btn go-back" href="javascript:window.history.back()">
        <i class="layui-icon">&#xe603;</i>返回
    </a>
    <%-- 表单区域 --%>
    <form class="layui-form" action="" v-if="customer">
        <div class="layui-form-item layui-hide">
            <%-- 表单隐藏区域 --%>
            <input type="hidden" name="id" v-model="customer.id">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" required lay-verify="required" placeholder="请输入客户姓名"
                       autocomplete="off"
                       class="layui-input" v-model="customer.name">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户电话</label>
            <div class="layui-input-block">
                <input type="text" name="phone" required lay-verify="required" placeholder="请输入客户手机号"
                       autocomplete="off"
                       class="layui-input" v-model="customer.phone">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">客户账号</label>
            <div class="layui-input-block">
                <input type="text" name="cust_no" required lay-verify="required" placeholder="请客户账号"
                       autocomplete="off"
                       class="layui-input" v-model="customer.cust_no">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="updateCustomer">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <p class="no-data" v-else>【暂无数据】</p>
    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/customer/customerUpdate.js"></script>
</div>
</body>
</html>
