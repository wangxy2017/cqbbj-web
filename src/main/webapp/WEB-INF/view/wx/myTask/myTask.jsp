<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/24
  Time: 12:45
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/myTask.css">
    <title>重庆棒棒军管理有限公司</title>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>我的任务</p>
</header>
<div class="container-fluid" id="main">
    <div class="title row">
        <div class="col-sm-5 boder_bottom">
            <p>未完成</p>
        </div>
        <div class="col-sm-2">
            <div></div>
        </div>
        <div class="col-sm-5 " data-show="0">
            <p>已完成</p>
        </div>
    </div>
    <div class="center">
        <div class="unfinished row">
            <ul class="list-ul">
                <li class="row list-li"   @click.stop="open" v-for="order in orders">
                    <div class="zhang">
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/no.png" alt="">
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
                        <p class="toAdd">{{star}}</p>
                    </div>
                    <div class="col-sm-12">
                        <p class="formAdd">{{end}}</p>
                    </div>
                    <div class="row li-footer">
                        <div class="col-sm-8">
                            <p>{{order.beginTime}}</p>
                        </div>
                        <div class="col-sm-4">
                            <p class="pull-right">{{order.price}}￥</p>
                        </div>
                    </div>
                    <%--<div class="row display">--%>
                        <%--<div class="col-sm-4">--%>
                            <%--<button type="button" class="btn btn-info" @click.stop="0">支付</button>--%>
                        <%--</div>--%>
                        <%--<div class="col-sm-4">--%>
                            <%--<button type="button" class="btn btn-success" @click.stop="1">完成</button>--%>
                        <%--</div>--%>
                        <%--<div class="col-sm-4">--%>
                            <%--<button type="button" class="btn btn-danger" @click.stop="2">查看</button>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </li>
            </ul>
        </div>
        <div class="complete" @click.stop="view()">
            <ul class="list-ul">
                <li class="row list-li">
                    <div class="zhang">
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/yes.png" alt="">
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
                        <p class="toAdd">{{star}}</p>
                    </div>
                    <div class="col-sm-12">
                        <p class="formAdd">{{end}}</p>
                    </div>
                    <div class="row li-footer">
                        <div class="col-sm-8">
                            <p>{{order.beginTime}}</p>
                        </div>
                        <div class="col-sm-4">
                            <p class="pull-right">{{order.price}}￥</p>
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
<script src="${pageContext.request.contextPath}/resources/wx/js/myTask.js"></script>
</body>
</html>