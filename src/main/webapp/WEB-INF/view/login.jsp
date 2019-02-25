<%--
  Created by IntelliJ IDEA.
  User: 王孝元
  Date: 2019/1/27
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>重庆棒棒军后台管理系统登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
</head>
<body>
<div class="login-bg"></div>
<div class="login-box" id="main">
    <div class="login-text">
        <h1>{{ system }}</h1>
        <span>版权所有 © {{ support }}</span>
    </div>
    <div class="login-form">
        <form class="layui-form" action="">
            <div class="group">
                <label>登录账号</label>
                <div class="input-box">
                    <span class="layui-icon layui-icon-username" style="background: #28B779;"></span>
                    <input type="text" name="account" required lay-verify="required"
                           placeholder="请输入登录账号" autocomplete="off"/>
                </div>
            </div>
            <div class="group">
                <label>登录密码</label>
                <div class="input-box">
                    <span class="layui-icon layui-icon-password" style="background: #FFB848;"></span>
                    <input type="password" name="password" required lay-verify="required"
                           placeholder="请输入登录密码" autocomplete="off"/>
                </div>
            </div>
            <div :class="{'error':error}" v-text="error"></div>
            <div class="actions">
                <button type="button" class="layui-btn layui-btn-fluid" lay-submit lay-filter="login">登&nbsp;&nbsp;&nbsp;&nbsp;录
                </button>
            </div>
        </form>
    </div>
    <div class="login-text">
        <span>推荐使用webkit内核浏览器，如chrome等</span>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
</body>
</html>