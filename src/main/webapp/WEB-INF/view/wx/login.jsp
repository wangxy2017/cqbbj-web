<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/13
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.3, user-scalable=0" />
    <title>登录注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
<div class="login">
    <div class="logoPic">
        <p class="h1">棒棒军</p>
        <span>公众号版</span>
    </div>
    <div id="center">
        <form action="" method="">
            <%--<input id="account" type="text" placeholder="请输入账号\邮箱\手机号" onfocus="this.placeholder='' "--%>
                   <%--onblur="this.placeholder='请输入账号\\邮箱\\手机号'" autocomplete="off">--%>
            <%--<input id="password" type="password" placeholder="请输入您的密码" onfocus="this.placeholder=''"--%>
                   <%--onblur="this.placeholder='请输入您的密码'" autocomplete="off">--%>

            <div class="row">
                <div class="col-sm-1">
                    <span class="glyphicon glyphicon-user"></span>
                </div>
                <div class="col-sm-11">
                    <input id="account" type="text" placeholder="请输入账号\邮箱\手机号" onfocus="this.placeholder='' " onblur="this.placeholder='请输入账号\\邮箱\\手机号'" autocomplete="off">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-1">
                    <span class="glyphicon glyphicon-lock"></span>
                </div>
                <div class="col-sm-11">
                    <input id="password" type="password" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'" autocomplete="off">
                </div>
            </div>



            <%--<div class="col-sm-6">--%>
                <%--<label class="checkbox-min row">--%>
                    <%--<input type="checkbox"/>--%>
                    <%--<span></span>--%>
                    <%--<i>自动登录</i>--%>
                <%--</label>--%>
            <%--</div>--%>
            <%--<div class="col-sm-6">--%>
                <%--<div class="weiXin">--%>
                    <%--<p>微信登录</p>--%>
                <%--</div>--%>
            <%--</div>--%>
            <input id="inPut" type="button" onclick="doLogin()" value="登录">
            <!--<footer class="col-sm-12">-->
            <!--<a href="#">忘记密码?</a>-->
            <!--</footer>-->

        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/login.js"></script>
</body>
</html>
