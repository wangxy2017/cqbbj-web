<%--
  Created by IntelliJ IDEA.
  User: 汇普科技有限公司
  Date: 2019/4/4
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/datetime/css/lCalendar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/performance.css">
    <title>财务管理</title>
</head>
<body>
<header>
    <div class="pull-left col-sm-2">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <div class="col-sm-8">
        <p>业绩查询</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home"
              onclick="javaScript:window.location.href='/wx/login/toHome?userKey='+ myCache.userKey"></span>
    </div>
    <div class="search" id="header">
        <div class="row">
            <div class="col-sm-3">姓名:</div>
            <div class="col-sm-3">
                <input type="text" class="form-control">
            </div>
            <div class="col-sm-6">
                <input type="button" class="btn btn-block btn-primary" value="选择员工" @click.stop="open">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">日期:</div>
            <div class="col-sm-9">
                <input id="beginTime" name="beginTime" type="text" class="form-control" value="选择日期" style="margin-bottom: 2rem">
            </div>
        </div>
        <div class="row">
            <input type="button" class="btn btn-block btn-success active" value="查询" style="margin-bottom: 2rem" @click.stop="vivw">
        </div>
        <div class="alert_model" @click.stop="end">
            <div class="alert_body">
                <input type="hidden" id="checkId" value="">
                <input type="hidden" id="checkOrderNo" value="">
                <div class="alert-title">
                    <p>提示</p>
                    <span @click.stop="hide" class="glyphicon glyphicon-remove"></span>
                </div>
                <div class="container-fluid">
                    <div class="modal-text">
                        <div class="row">
                            <div class="col-sm-4" v-for="item in emps">
                                <button @click.stop="0"  class="btn btn-default" :data-emp_no="item.emp_no">{{item.name}}({{item.account}})</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <input type="button" @click.stop="click" class="btn btn-info btn-lg btn-block"value="确定">
                    </div>
                    <div class="col-sm-6">
                        <input type="button" class="btn btn-default btn-lg btn-block" value="取消">
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div id="magnifying" @click="search">
    <img src="${pageContext.request.contextPath}/resources/wx/imge/search.png" alt="放大镜">
</div>
<div class="container-fluid" id="main">
    <div class="circulation">
        <div class="row">
            <div class="col-sm-3">订单编号:</div>
            <div class="col-sm-9" style="color: red">DT20190406201212262220021545</div>
        </div>
        <div class="row">
            <div class="col-sm-3">客户姓名:</div>
            <div class="col-sm-9">王雨燕</div>
        </div>
        <div class="row">
            <div class="col-sm-3">客户电话:</div>
            <div class="col-sm-9">138000000000</div>
        </div>
        <div class="row">
            <div class="col-sm-3">搬出地址:</div>
            <div class="col-sm-9">重庆市永川区建安大道601号小源鲜花店</div>
        </div>
        <div class="row">
            <div class="col-sm-3">搬入地址:</div>
            <div class="col-sm-9">重庆市渝北区观音桥北城天街28号清香雅筑鲜花店</div>
        </div>
        <div class="row">
            <div class="col-sm-3">完成时间:</div>
            <div class="col-sm-9">2019-04-10 15:00:16</div>
        </div>
        <div class="row">
            <div class="col-sm-3">订单状态:</div>
            <div class="col-sm-9" style="color: red">已结算</div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/datetime/js/lCalendar.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/performance.js"></script>
</body>
</html>
