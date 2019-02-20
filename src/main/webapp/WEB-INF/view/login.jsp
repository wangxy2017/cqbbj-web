<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/20
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>登录系统</h1>
<form action="/doLogin">
    <label>用户名：<input type="text" name="account"/></label>
    <label>密码：<input type="password" name="password"/></label>
    <button type="submit">登录</button>
</form>
</body>
</html>
