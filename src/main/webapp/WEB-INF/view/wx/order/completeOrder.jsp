<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/22
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/completeOrder.css">
    <title>订单管理</title>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()" ></span>
    </div>
    <p>完成订单</p>
</header>
<div class="container-fluid" id="main">
    <ul class="list-ul">
        <li class="row list-li" @click.stop="display($event)" v-for="order in orders">
            <div class="zhang">
                <img src="${pageContext.request.contextPath}/resources/wx/imge/wc.png"  alt="">
            </div>
            <div class="row li-title">
                <div class="col-sm-7">
                    <p>订单号：<a href="javascript:;">{{order.order_no}}</a></p>
                </div>
                <div class="col-sm-5">
                    <p class="pull-right">客户姓名：{{order.name}}</p>
                </div>
            </div>
            <div class="col-sm-12 li-content">
                <p class="toAdd">{{order.start}}</p>
            </div>
            <div class="col-sm-12">
                <p class="formAdd">{{order.end}}</p>
            </div>
            <div class="row li-footer">
                <div class="col-sm-8">
                    <p>{{formatDateTime(order.beginTime)}}</p>
                </div>
                <div class="col-sm-4">
                    <p class="pull-right">
                        <span>{{order.price}}￥</span>
                    </p>
                </div>
            </div>
            <div class="row display">
                <div class="col-sm-6">
                    <button class="btn btn-primary" @click.stop="view(order.id)">查看</button>
                </div>
                <div class="col-sm-6">
                    <button  class="btn btn-success" @click.stop="callback(order.id)">回访</button>
                </div>
            </div>
        </li>
    </ul>
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/completeOrder.js"></script>
</body>
<html>

