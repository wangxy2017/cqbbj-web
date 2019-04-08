<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/27
  Time: 9:14
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/payment.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/wx/favicon.ico"/>
    <title>财务管理</title>
</head>
<body>
<header>
    <div class="pull-left col-sm-2">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <div class="col-sm-8">
        <p>收款界面</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home"  onclick="javaScript:window.location.href='/wx/login/toHome?userKey='+ myCache.userKey"></span>
    </div>
</header>
<div id="main" class="container-fluid">
    <div class="form-group">
        <input type="hidden" name="id">
        <div class="row">
            <label class="col-sm-3 control-label">订单编号:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" v-model="order_no">
            </div>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label" >收款金额:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" v-model="receiveMoney">
            </div>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label">收款备注:</label>
            <div class="col-sm-9">
                <textarea rows="5" class="form-control" v-model="receiveText"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <input type="button" class="btn btn-info btn-block" @click.stop="receive" value="确认">
            </div>
            <div class="col-sm-6">
                <input type="button" class="btn btn-default btn-block" value="取消">
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/payment.js"></script>
</body>
</html>
