<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/14
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>订单管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/unSentOrder.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>未派订单</p>
</header>
<div class="container-fluid" id="main">
    <form action="" class="form-group">
        <ul class="list-ul">
            <li class="row list-li" v-for="(item, index) in orders" @click="showBtns($event)">
                <input type="hidden" name="orderId" id="orderId" v-model="item.id">
                <div class="zhang">
                    <img src="${pageContext.request.contextPath}/resources/wx/imge/wp.png" alt="">
                </div>
                <div class="row li-title">
                    <div class="col-sm-7">
                        <p>
                            订单号：
                            <a  href="javascript:;" @click.stop="view(item.id)"><span >{{item.order_no}}</span></a></p>
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
                        <p>{{formatDateTime(item.beginTime)}}</p>
                    </div>
                    <div class="col-sm-4">
                        <p class="pull-right">{{item.price}}￥</p>
                    </div>
                </div>
                <div class="row display">
                    <div class="col-sm-3">
                        <a class="view">
                            <button type="button" class="btn btn-primary" @click.stop="view(item.id)">查看</button>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a class="sent">
                            <button type="button" class="btn btn-success" @click.stop="dispatch(item.order_no)">派单</button>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a class="view">
                            <button type="button" class="btn btn-primary" @click.stop="modify(item.id)">修改</button>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a class="abolish">
                            <button type="button" class="btn btn-default" @click.stop="cancel(item.id,$event)">作废</button>
                        </a>
                    </div>
                </div>
            </li>
            <div class="alert_model" @click.stop="end">
                <div class="alert_body">
                    <input type="hidden" id="checked" value="">
                    <div class="alert-title">
                        <p>提示</p>
                        <span @click.stop="hide" class="glyphicon glyphicon-remove"></span>
                    </div>
                    <div class="container-fluid">
                        <div class="modal-text">
                            <p>是否确定作废?</p>
                        </div>
                        <div class="col-sm-6">
                            <input type="button" class="btn btn-info btn-lg btn-block" @click.stop="ascertain"  value="确定">
                        </div>
                        <div class="col-sm-6">
                            <input type="button" class="btn btn-default btn-lg btn-block" value="取消">
                        </div>
                    </div>
                </div>
            </div>
        </ul>
        <div class="loading" style="display: none;">.....我是有底线的....</div>
    </form>
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
<script src="${pageContext.request.contextPath}/resources/wx/js/unSentOrder.js"></script>
</body>
</html>
