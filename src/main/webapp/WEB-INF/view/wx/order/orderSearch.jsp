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
    <title>查询订单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/orderSearch.css">
</head>
<body>
<header>
    <div class="pic">

            <img src="${pageContext.request.contextPath}/resources/wx/imge/comeback.png" onclick="javaScript:window.history.back()" alt="">

    </div>
    <p>查询订单</p>
</header>
<div class="container-fluid">
    <form action="" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">订单编号:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control input-lg" placeholder="输入查询的订单号">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">客户姓名:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control input-lg" placeholder="名字">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">电话:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control input-lg" placeholder="输入电话号码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">预约时间:</label>
            <div class="col-sm-9">
                <input type="datetime-local" class="dataOn">
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <button class="btn btn-success">搜索</button>
            </div>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/orderSearch.js"></script>
</body>
</html>
