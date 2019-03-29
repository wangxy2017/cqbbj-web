<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/24
  Time: 11:56
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/signBill.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/wx/favicon.ico"/>
    <title>财务管理</title>

</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>签单管理</p>
</header>
<div class="container-fluid" id="main">
    <div class="row header-top">
        <div class="top col-sm-6 border-buttom" @click.stop="payment($event)">
            <p>未付款</p>
        </div>
        <div class="top col-sm-6" data-show="0" @click.stop="havePaid($event)">
            <p>已付款</p>
        </div>
    </div>
    <ul class="paid">
        <li class="list-li non-payment" @click.stop="taskSwitch($event)" v-for="item in signBills">
            <input class="id" type="hidden" v-model="item.id">
            <div class="row order-No">
                <div class="col-sm-3">订单编号:</div>
                <div class="col-sm-5">
                    <p id="order_no">{{item.bill_no}}</p>
                </div>
                <div class="col-sm-4">
                    <p>未付款</p>
                </div>
            </div>
            <div class="row addTo">
                <div class="col-sm-3">
                    <p>搬出地址:</p>
                </div>
                <div class="col-sm-9">
                    <P>{{item.start}}</P>
                </div>
            </div>
            <div class="row addEnd">
                <div class="col-sm-3">
                    <P>搬入地址:</P>
                </div>
                <div class="col-sm-9">
                    <P>{{item.end}}</P>
                </div>
            </div>
            <div class="row cade-bottom">
                <div class="col-sm-6">
                    <p class="pull-left">{{item.endTime}}</p>
                </div>
                <div class="col-sm-6">
                    <p class="pull-right">客户姓名：{{item.name}}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">预估起价:</div>
                <div class="col-sm-9">{{item.price}}</div>
            </div>
            <div class="row display">
                <!--<div class="col-sm-6" style="display: none">-->
                <!--<input type="button" class="btn btn-danger btn-lg btn-block  view"  value="查看">-->
                <!--</div>-->
                <div class="col-sm-12">
                    <input type="button" class="btn btn-info btn-lg btn-block" @click.stop="receipt(item.id,$event)" value="收款">
                </div>
            </div>
        </li>
        <li class="list-li havePaid" @click.stop="taskSwitch($event)" v-for="item in signBills">
            <div class="row order-No">
                <div class="col-sm-3">订单编号:</div>
                <div class="col-sm-5">
                    <p>{{item.bill_no}}</p>
                </div>
                <div class="col-sm-4">
                    <p>已付款:{{item.receiveMoney}}</p>
                </div>
            </div>
            <div class="row addTo">
                <div class="col-sm-3">
                    <p>搬出地址:</p>
                </div>
                <div class="col-sm-9">
                    <P>{{item.start}}</P>
                </div>
            </div>
            <div class="row addEnd">
                <div class="col-sm-3">
                    <P>搬入地址:</P>
                </div>
                <div class="col-sm-9">
                    <P>{{item.end}}</P>
                </div>
            </div>
            <div class="row cade-bottom">
                <div class="col-sm-6">
                    <p class="pull-left">{{item.endTime}}</p>
                </div>
                <div class="col-sm-6">
                    <p class="pull-right">客户姓名：{{item.name}}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">预估起价:</div>
                <div class="col-sm-9">{{item.price}}</div>
            </div>
            <div class="row display">
                <!--<div class="col-sm-6" style="display: none">-->
                <!--<input type="button" class="btn btn-danger btn-lg btn-block  view"  value="查看">-->
                <!--</div>-->
                <div class="col-sm-12">
                    <input type="button" class="btn btn-info btn-lg btn-block" @click.stop="receipt" value="收款">
                </div>
            </div>
        </li>
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
    </ul>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/signBill.js"></script>
</body>
</html>