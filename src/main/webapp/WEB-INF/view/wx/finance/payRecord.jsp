<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/26
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.3, user-scalable=0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/payRecord.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <title>支付记录</title>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()" ></span>
    </div>
    <p>支付记录</p>
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
<script src="${pageContext.request.contextPath}/resources/wx/js/payRecord.js"></script>
</body>
</html>
