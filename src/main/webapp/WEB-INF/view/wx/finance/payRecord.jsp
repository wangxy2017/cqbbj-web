<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/26
  Time: 9:22
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/payRecord.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <title>财务管理</title>
</head>
<body>
<header>
    <div class="pull-left col-sm-2">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <div class="col-sm-8">
        <p>支付记录</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home"  onclick="javaScript:window.location.href='/wx/login/toHome?userKey='+ myCache.userKey"></span>
    </div>
</header>
<div class="container-fluid" id="main">
    <form action="" class="form-horizontal">
        <div class="form-group">
            <div class="row">
                <h1>支付凭证</h1>
            </div>
            <div class="container center">
                <p>付款金额</p>
                <span class="glyphicon glyphicon-yen">500</span>
            </div>
            <ul>
                <li class="form-group">
                    <label class="col-sm-3 control-label ">
                        <p class="text-center">收款方:</p>
                    </label>
                    <div class="col-sm-9">
                        <p class="text-center">重庆棒棒军有限公司</p>
                    </div>
                </li>
                <li class="form-group">
                    <label class="col-sm-3 control-label">
                        <p class="text-center">交易状态:</p>
                    </label>
                    <div class="col-sm-9">
                        <p class="text-center">支付成功，对方已收款</p>
                    </div>
                </li>
                <li class="row li-next">
                    <a href="view.html">
                        <div class="col-sm-11">
                            <p>查看账单详情</p>
                        </div>
                        <div class="col-sm-1">
                            <span class="glyphicon glyphicon-menu-right"></span>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/payRecord.js"></script>
</body>
</html>
