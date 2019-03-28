<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/22
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/callback.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <title>订单管理</title>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()" ></span>
    </div>
    <p>回访详情</p>
</header>
<div class="container-fluid" id="main" dataid="<%=request.getParameter("id")%>">
    <h1>备注记录</h1>
    <textarea class="form-control" rows="12" id="visit" placeholder="请输入内容"></textarea>
    <div class="row">
        <input type="button" class="btn btn-success btn-lg btn-block" value="提交" @click.stop="submit">
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/callback.js"></script>
</body>
<html>
