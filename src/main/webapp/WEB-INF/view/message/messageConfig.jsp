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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/message/messageConfig.css">
</head>
<body>
<div class="main" id="main">
    <p class="page-title"><span class="flag">&nbsp;</span>短信配置</p>
    <%-- 表单区域 --%>
    <form class="layui-form" action="">
        <div class="layui-form-item layui-hide">
            <input type="hidden" name="id" v-model="company.id">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>短信宝账号：</label>
            <div class="layui-input-inline">
                <input type="text" name="msg_username" required lay-verify="required" placeholder="请输入短信宝账号"
                       autocomplete="off"
                       class="layui-input" v-model="company.msg_username">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>短信宝密码：</label>
            <div class="layui-input-inline">
                <input type="text" name="msg_password" required lay-verify="required" placeholder="请输入短信宝密码"
                       autocomplete="off"
                       class="layui-input" v-model="company.msg_password">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>短信签名：</label>
            <div class="layui-input-inline">
                <input type="text" name="msg_sign" required lay-verify="required" placeholder="请输入短信签名"
                       autocomplete="off"
                       class="layui-input" v-model="company.msg_sign">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>短信接口地址：</label>
            <div class="layui-input-inline">
                <input type="text" name="msg_domain" required lay-verify="required" placeholder="请输入短信接口地址"
                       autocomplete="off"
                       class="layui-input" v-model="company.msg_domain">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>短信开关：</label>
            <div class="layui-input-inline" style="width: 220px;">
                <input type="radio" name="msg_open" value="0" title="开启派单" checked v-model="company.msg_open">
                <input type="radio" name="msg_open" value="1" title="关闭派单" v-model="company.msg_open">
            </div>
            <div class="layui-form-mid layui-word-aux">设置关闭，派单后员工将不会收到派单短信通知</div>
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
    <script src="${pageContext.request.contextPath}/resources/js/message/messageConfig.js"></script>
</div>
</body>
</html>
