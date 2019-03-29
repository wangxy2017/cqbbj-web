<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/22
  Time: 9:25
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/canceledOrder.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <title>订单管理</title>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()" ></span>
    </div>
    <p>作废订单</p>
</header>
<div class="container-fluid" id="main">
    <ul class="list-ul">
        <li class="row list-li" @click.stop="display($event)" v-for="order in orders">
            <div class="zhang">
                <img src="${pageContext.request.contextPath}/resources/wx/imge/zf.png" alt="">
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
                    <button type="button" class="btn btn-primary" @click.stop="view(order.id)">查看</button>
                </div>
                <div class="col-sm-6">
                    <button type="button" class="btn btn-success" @click.stop="restore(order.id)">恢复</button>
                </div>
            </div>
        </li>
    </ul>
</div>
<div class="row loading">
    <div class="col-sm-5">
        <img class="pull-right" src="${pageContext.request.contextPath}/resources/wx/imge/loading.gif" alt="">
    </div>
    <div class="col-sm-7">
        <P class="pull-left">页面加载中...</P>
    </div>
</div>
<div class=" row baseLine">
    <p>---------我是有底线的----------</p>
</div>
<div class="notFind">
    <img src="${pageContext.request.contextPath}/resources/wx/imge/undefind.png" alt="">
    <p>-.-.-.-.-.-暂无数据-.-.-.-.-.-</p>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/canceledOrder.js"></script>
</body>
</html>