<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/27
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css?time=2">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/wallet.css?time=2">
    <title>我的零钱</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/wx/favicon.ico"/>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>我的钱包</p>
</header>
<div class="main">
    <div class="main-center">
        <p>余额账户（元）</p>
        <h1>0.00</h1>
    </div>
</div>
<section>
    <p><span class="glyphicon glyphicon-calendar"></span> 收支明细</p>
</section>
<form action="" class="form-group">
    <div class="container-fluid">
        <article class="list">
            <ul>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
                <li class="row">
                    <div class="col-sm-6">
                        <p class="h1">在线收入</p>
                        <p>2018-01-02 08:30:22</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">100元</p>
                    </div>
                </li>
            </ul>
            <div class="loading" style="display: none;">.....我是有底线的....</div>
        </article>
    </div>
</form>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/wallet.js"></script>
</body>
</html>
