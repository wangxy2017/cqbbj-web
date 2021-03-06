<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/27
  Time: 9:12
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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/financeClean.css">
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
        <p>财务结算</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home"  onclick="javaScript:window.location.href='/wx/login/toHome?userKey='+ myCache.userKey"></span>
    </div>
</header>
<div class="container-fluid" id="main">
    <div class="title row">
        <div id="left" class="col-sm-5 border_bottom" @click="unClean">
            <p>未结算</p>
        </div>
        <div class="col-sm-2">
            <div></div>
        </div>
        <div id="right" class="col-sm-5" @click="cleaned">
            <p>已结算</p>
        </div>
    </div>
    <div class="center">
        <div class="complete">
            <ul class="list-ul">
                <li class="row list-li" @click.stop="showBtn($event)" v-for="item in orders">
                    <div class="row li-title">
                        <div class="col-sm-7">
                            <p>订单号：<a href="javascript:;">{{item.order_no}}</a></p>
                        </div>
                        <div class="col-sm-5">
                            <p class="pull-right">客户姓名：{{item.name}}</p>
                        </div>
                    </div>
                    <div class="col-sm-12 li-content">
                        <p class="toAdd">{{item.start}}</p>
                    </div>
                    <div class="col-sm-12">
                        <p class="formAdd">{{item.end}}</p>
                    </div>
                    <div class="row li-footer">
                        <div class="col-sm-8">
                            <p>{{formatDateTime(item.endTime)}}</p>
                        </div>
                        <div class="col-sm-4">
                            <p class="pull-right">{{item.price}}￥</p>
                        </div>
                    </div>
                    <div class="row display">
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-danger" @click.stop="view(item.id)">查看</button>
                        </div>
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-info" @click.stop="clean(item.id)">结算</button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
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
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/financeClean.js"></script>
</body>
</html>
