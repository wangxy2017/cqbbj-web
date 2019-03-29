<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/27
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css?time=2">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/wallet.css?time=2">
    <title>财务管理</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/wx/favicon.ico"/>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>我的钱包</p>
</header>
<div id="main">
<div class="main">
    <div class="main-center">
        <p>余额账户（元）</p>
        <h1>{{employee.money}}</h1>
    </div>
</div>
<section>
    <p><span class="glyphicon glyphicon-calendar"></span> 收支明细</p>
</section>
<form action="" class="form-group">
    <div class="container-fluid">
        <article class="list">
            <ul>
                <li class="row" v-for="wallet in wallets">
                    <div class="col-sm-6">
                        <p class="h1"><span v-if="wallet.type==0">在线收入</span> <span v-else>在线支出</span></p>
                        <p>{{formatDateTime(wallet.createTime)}}</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pg">{{wallet.money}}元</p>
                    </div>
                </li>

            </ul>
            <div class="loading" style="display: none;">.....我是有底线的....</div>
        </article>
    </div>
</form>
</div>
<div class="row loading">
    <div class="col-sm-5">
        <img class="pull-right" src="${pageContext.request.contextPath}/resources/wx/imge/loading.gif" alt="">
    </div>
    <div class="col-sm-7">
        <P class="pull-left">页面加载中...</P>
    </div>
</div>
<div class="notFind" style="padding: 0">
    <img src="${pageContext.request.contextPath}/resources/wx/imge/undefind.png" alt="">
    <p>-.-.-.-.-.-暂无数据-.-.-.-.-.-</p>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/wallet.js"></script>
</body>
</html>
