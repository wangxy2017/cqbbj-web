<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/14
  Time: 11:04
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/orderAdd.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/datetime/css/lCalendar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <title>订单管理</title>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>添加订单</p>
</header>
<div id="main">
    <form class="form-group" action="javascript:;">
        <dl class="row">
            <dt>客户姓名:</dt>
            <dd><input type="text" id="name" name="name" placeholder="名字"></dd>
        </dl>

        <dl class="row">
            <dt>客户电话:</dt>
            <dd><input type="number" name="phone" id="phone" placeholder="电话号码\手机"></dd>
        </dl>
        <dl class="row">
            <dt>搬出地址:</dt>
            <dd><input type="address" name="start" id="start" placeholder="搬出地址"></dd>
        </dl>
        <dl class="row">
            <dt>搬入地址:</dt>
            <dd><input type="address" name="end" id="end" placeholder="搬入地址"></dd>
        </dl>
        <dl class="row">
            <dt>预估起价:</dt>
            <dd><input type="number" name="price" id="price" placeholder="金额预算"></dd>
        </dl>
        <dl class="row">
            <dt>预约时间:</dt>
            <dd><input id="beginTime" type="text" name="beginTime" placeholder="选择时间"/></dd>
            <!-- <dd><input  name="beginTime" id="beginTime" type="datetime-local" ></dd>-->
        </dl>
        <dl class="row">
            <dt>客户类型:</dt>
            <dd class="demo">
                <div class="left">
                    <input class="radio radio-inline" type="radio" name="type" value="0" checked >
                    个人
                </div>
                <div class="right">
                    <input class="radio radio-inline" type="radio" name="type" value="1">
                    公司
                </div>
            </dd>
        </dl>
        <dl class="row">
            <dt class="col-sm-3">搬运备注:</dt>
            <dd class="col-sm-9">
                <textarea class="form-control" name="textBox" id="content" name="content" cols="25" rows="6" placeholder="请输入内容"></textarea>
            </dd>
        </dl>
        <ul>
            <li id="items"></li>
        </ul>
        <div>
            <p>短信通知:</p>
            <label class="checkbox-min">
                <input type="checkbox" name="isNotice" id="isNotice" value="1"/>
                <span></span>
                <i>是否发送短信通知客户</i>
            </label>
        </div>
        <input id="submit" type="button" value="提  交">
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/datetime/js/lCalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/datetime/js/lCalendar.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/orderAdd.js"></script>
</body>
</html>
