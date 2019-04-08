<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/4/8
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/register.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <title>棒棒军注册界面</title>
    <link rel="icon" type="image/x-icon" href="../favicon.ico"/>
</head>
<body>
<div id="main">
    <form action="">
        <p>用户名</p>
        <input name="name" type="text" placeholder="您的姓名" v-model="name" pattern="[A-Z]{3}-[0-9]{3}">
        <p>手机号验证:</p>
        <input name="phone" type="text" placeholder="输入手机号" v-model="phone" pattern="^[1][3,4,5,7,8][0-9]{9}$">
        <input name="code" id="input" type="text" placeholder="请输入6位验证码" v-model="code">
        <button @click="getCode">获取验证码</button>
        <input class="bg" type="button" value="登录" @click="regist">
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/register.js"></script>
</body>
</html>
