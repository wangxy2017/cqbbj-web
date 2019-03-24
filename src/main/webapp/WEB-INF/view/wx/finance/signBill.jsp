<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/24
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/signBill.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/wx/favicon.ico"/>
    <title>签单管理</title>

</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()" ></span>
    </div>
    <p>未收款订单</p>
</header>
<div class="container-fluid">
    <form action="">
        <div class="row">
            <div class="header-top">
                <p class=" col-sm-6 border-buttom">已付款</p>
                <p class="col-sm-6">未付款</p>
            </div>
        </div>
        <ul class="paid">
            <li class="list-li">
                <div class="row order-No">
                    <div class="col-sm-3">订单编号:</div>
                    <div class="col-sm-6">
                        <p>DT2018030608125466678987</p>
                    </div>
                    <div class="col-sm-3">
                        <p>8500￥</p>
                    </div>
                </div>
                <div class="row addTo">
                    <div class="col-sm-3">
                        <p>搬出地址:</p>
                    </div>
                    <div class="col-sm-9">
                        <P>重庆市渝北区双凤路空港大道B-1</P>
                    </div>
                </div>
                <div class="row addEnd">
                    <div class="col-sm-3">
                        <P>搬入地址:</P>
                    </div>
                    <div class="col-sm-9">
                        <P>重庆市渝北区双凤路空港大道B-9栋5-23号</P>
                    </div>
                </div>
                <div class="row cade-bottom">
                    <div class="col-sm-6">
                        <p class="pull-left">2018-03-18 12:00:00</p>
                    </div>
                    <div class="col-sm-6">
                        <p class="pull-right">客户姓名：王国栋</p>
                    </div>
                </div>
                <div class="row display">
                    <div class="col-sm-6">
                        <input type="button" class="btn btn-danger btn-lg btn-block  view" value="查看">
                    </div>
                    <div class="col-sm-6">
                        <input type="button" class="btn btn-info btn-lg btn-block  receipt" value="收款">
                    </div>
                </div>
            </li> <li class="list-li">
            <div class="row order-No">
                <div class="col-sm-3">订单编号:</div>
                <div class="col-sm-6">
                    <p>DT2018030608125466678987</p>
                </div>
                <div class="col-sm-3">
                    <p>3500￥</p>
                </div>
            </div>
            <div class="row addTo">
                <div class="col-sm-3">
                    <p>搬出地址:</p>
                </div>
                <div class="col-sm-9">
                    <P>重庆市渝北区双凤路空港大道B-1</P>
                </div>
            </div>
            <div class="row addEnd">
                <div class="col-sm-3">
                    <P>搬入地址:</P>
                </div>
                <div class="col-sm-9">
                    <P>重庆市渝北区双凤路空港大道B-9栋5-23号</P>
                </div>
            </div>
            <div class="row cade-bottom">
                <div class="col-sm-6">
                    <p class="pull-left">2018-03-18 12:00:00</p>
                </div>
                <div class="col-sm-6">
                    <p class="pull-right">客户姓名：王国栋</p>
                </div>
            </div>
            <div class="row display">
                <div class="col-sm-6">
                    <input type="button" class="btn btn-danger btn-lg btn-block  view" value="查看">
                </div>
                <div class="col-sm-6">
                    <input type="button" class="btn btn-info btn-lg btn-block  receipt" value="收款">
                </div>
            </div>
        </li> <li class="list-li">
            <div class="row order-No">
                <div class="col-sm-3">订单编号:</div>
                <div class="col-sm-6">
                    <p>DT2018030608125466678987</p>
                </div>
                <div class="col-sm-3">
                    <p>5500￥</p>
                </div>
            </div>
            <div class="row addTo">
                <div class="col-sm-3">
                    <p>搬出地址:</p>
                </div>
                <div class="col-sm-9">
                    <P>重庆市渝北区双凤路空港大道B-1</P>
                </div>
            </div>
            <div class="row addEnd">
                <div class="col-sm-3">
                    <P>搬入地址:</P>
                </div>
                <div class="col-sm-9">
                    <P>重庆市渝北区双凤路空港大道B-9栋5-23号</P>
                </div>
            </div>
            <div class="row cade-bottom">
                <div class="col-sm-6">
                    <p class="pull-left">2018-03-18 12:00:00</p>
                </div>
                <div class="col-sm-6">
                    <p class="pull-right">客户姓名：王国栋</p>
                </div>
            </div>
            <div class="row display">
                <div class="col-sm-6">
                    <input type="button" class="btn btn-danger btn-lg btn-block  view" value="查看">
                </div>
                <div class="col-sm-6">
                    <input type="button" class="btn btn-info btn-lg btn-block  receipt" value="收款">
                </div>
            </div>
        </li>
        </ul>
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/signBill.js"></script>
</body>
</html>
