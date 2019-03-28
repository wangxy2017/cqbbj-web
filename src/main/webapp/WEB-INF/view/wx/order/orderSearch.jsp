<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/18
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>订单管理</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/orderSearch.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/datetime/css/lCalendar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>查询订单</p>
</header>
<div class="container-fluid">
    <form action="" class="form-group">
        <div class="row">
            <label class="col-sm-3 control-label">订单编号:</label>
            <div class="col-sm-9">
                <input type="text" id="order_no" name="order_no" class="form-control input-lg" placeholder="输入查询的订单号">
            </div>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label">客户姓名:</label>
            <div class="col-sm-9">
                <input type="text" name="name" id="name" class="form-control input-lg" placeholder="名字">
            </div>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label">电话:</label>
            <div class="col-sm-9">
                <input type="text" id="phone" name="phone" class="form-control input-lg" placeholder="输入电话号码">
            </div>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label">预约时间:</label>
            <div class="col-sm-9">
                <input type="text" id="beginTime1" name="beginTime1" class="dataOn">
            </div>

        </div>
        <div class="row">
            <label class="col-sm-3 control-label">至：</label>
            <div class="col-sm-9">
                <input type="text" id="beginTime2" name="beginTime2" class="dataOn">
            </div>
        </div>
        <div class="row">
            <button class="btn btn-success" id="submit">搜索</button>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/datetime/js/lCalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/datetime/js/lCalendar.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/orderSearch.js"></script>
</body>
</html>
