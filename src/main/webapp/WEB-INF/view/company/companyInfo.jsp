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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/company/companyInfo.css">
</head>
<body>
<div class="main" id="main">
    <p class="page-title"><span class="flag">&nbsp;</span>商户配置</p>
    <%-- 表单区域 --%>
    <form class="layui-form" action="">
        <div class="layui-form-item layui-hide">
            <input type="hidden" name="id" v-model="company.id">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>公司名称：</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" placeholder="请输入公司名称" autocomplete="off"
                       class="layui-input" v-model="company.name">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>公司地址：</label>
            <div class="layui-input-inline">
                <input type="text" name="address" required lay-verify="required" placeholder="请输入公司地址"
                       autocomplete="off"
                       class="layui-input" v-model="company.address">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>公司电话：</label>
            <div class="layui-input-inline">
                <input type="text" name="telephone" required lay-verify="required" placeholder="请输入公司电话"
                       autocomplete="off"
                       class="layui-input" v-model="company.telephone">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">关键词配置</label>
            <div class="layui-input-inline" style="width: 480px;">
                <textarea name="keyword" placeholder="请输入内容" class="layui-textarea"
                          v-model="company.keyword"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="update">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/company/companyInfo.js"></script>
</div>
</body>
</html>
