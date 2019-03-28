<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/27
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/financeClean.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/wx/favicon.ico"/>
    <title>财务管理</title>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()" ></span>
    </div>
    <p>财务结算</p>
</header>
<div class="container-fluid" id="main">
    <div class="title row">
        <div class="col-sm-5 boder_bottom" data-show="0">
            <p>已结算</p>
        </div>
        <div class="col-sm-2">
            <div></div>
        </div>
        <div class="col-sm-5">
            <p>未结算</p>
        </div>
    </div>
    <div class="center">
        <div class="complete" @click.stop="view">
            <ul class="list-ul">
                <li class="row list-li">
                    <div class="row li-title">
                        <div class="col-sm-7">
                            <p>订单号：<a href="javascript:;">DT2000004567888888888</a></p>
                        </div>
                        <div class="col-sm-5">
                            <p class="pull-right">客户姓名：王晓宇</p>
                        </div>
                    </div>
                    <div class="col-sm-12 li-content">
                        <p class="toAdd">重庆市江北区北城天界108号</p>
                    </div>
                    <div class="col-sm-12">
                        <p class="formAdd">重庆市石桥铺兰美路美茵河谷998号C栋806</p>
                    </div>
                    <div class="row li-footer">
                        <div class="col-sm-8">
                            <p>2019-03-08 12:00</p>
                        </div>
                        <div class="col-sm-4">
                            <p class="pull-right">500￥</p>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="unfinished row">
            <ul class="list-ul">
                <li class="row list-li"   @click.stop="open">
                    <div class="row li-title">
                        <div class="col-sm-7">
                            <p>订单号：<a href="javascript:;">DT201903221566664721386</a></p>
                        </div>
                        <div class="col-sm-5">
                            <p class="pull-right">客户姓名：李梓萌</p>
                        </div>
                    </div>
                    <div class="col-sm-12 li-content">
                        <p class="toAdd">重庆市巴南区白市驿公交水利站家属院5棟108号</p>
                    </div>
                    <div class="col-sm-12">
                        <p class="formAdd">重庆市渝中区鸿恩寺山顶道别墅区C栋5-1</p>
                    </div>
                    <div class="row li-footer">
                        <div class="col-sm-8">
                            <p>2019-05-08 14:30</p>
                        </div>
                        <div class="col-sm-4">
                            <p class="pull-right">500￥</p>
                        </div>
                    </div>
                    <div class="row display">
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-danger" @click.stop="view(item.id)">查看</button>
                        </div>
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-info" @click.stop="0">结算</button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/financeClean.js"></script>
</body>
</html>
