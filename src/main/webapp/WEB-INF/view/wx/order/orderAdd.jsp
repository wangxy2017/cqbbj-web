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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/datetime/css/lCalendar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/orderAdd.css">
    <title>订单管理</title>
</head>
<body>
<header>
    <div class="pull-left col-sm-2">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <div class="col-sm-8">
        <p>添加订单</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home"  onclick="javaScript:window.location.href='/wx/login/toHome?userKey='+ myCache.userKey"></span>
    </div>
</header>
<div class="container-fluid" id="main">
    <div class="row">
        <div class="col-sm-2"><span class="glyphicon glyphicon-user" style="color: #20A3DB"></span></div>
        <div class="col-sm-10">
            <input class="form-control" type="text" id="name" name="name" placeholder="请输入用户名字">
        </div>
    </div>
    <div class="row">
        <div class="col-sm-2"><span class="glyphicon glyphicon-phone" style="color: #1AB679"></span></div>
        <div class="col-sm-10">
            <input class="form-control" type="number" name="phone" id="phone" placeholder="电话号码\手机">
        </div>
    </div>

    <div class="row">
        <div class="col-sm-2" id="toAdd">
            <img src="/resources/wx/imge/foadd.png" alt="">
        </div>
        <div class="col-sm-10">
            <input class="form-control" type="adivress" name="start" id="start" placeholder="搬出地址">
        </div>
    </div>

    <div class="row">
        <div class="col-sm-2" id="formAdd">
            <img src="/resources/wx/imge/toAd.png" alt="">
        </div>
        <div class="col-sm-10">
            <input class="form-control" type="adivress" name="end" id="end" placeholder="搬入地址">
        </div>
    </div>

    <div class="row">
        <div class="col-sm-2"><span class="glyphicon glyphicon-jpy" style="color: #EF1C7B"></span></div>
        <div class="col-sm-10">
            <input class="form-control" type="number" name="price" id="price" placeholder="初步金额预算">
        </div>
    </div>

    <div class="row">
        <div class="col-sm-2"><span class="glyphicon glyphicon-time" style="color: red"></span></div>
        <div class="col-sm-10">
            <input class="form-control" id="beginTime" type="text" name="beginTime" placeholder="请选择配送时间"/>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-2"><span class="glyphicon glyphicon-briefcase" style="color: #1AB679"></span></div>
        <div class="demo col-sm-10">
            <select name="type" class="form-control" name="" id="typeSelect">
                <option value="">请选择类型</option>
                <option value="0">个人</option>
                <option value="1">公司</option>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-2"><span class="glyphicon glyphicon-tag" style="color: #EF1C7B"></span></div>
        <div class="col-sm-10">
                 <textarea class="form-control" name="textBox" id="content" name="content" rows="6"
                           placeholder="请输入搬运备注内容"></textarea>
        </div>
    </div>
    <ul>
        <li id="items" class="row">
            <input class='col-sm-4' type='button' value='电视'/>
        </li>
    </ul>
    <div class="row">
        <div class="col-sm-2"><span class="glyphicon glyphicon-bell" style="color: #1AB679"></span></div>
        <div class="col-sm-10">
            <label class="checkbox-min">
                <input type="checkbox" name="isNotice" id="isNotice" value="1"/>
                <span></span>
                <i>是否发送短信通知客户</i>
            </label>
        </div>
    </div>
    <input id="submit" type="button" value="提  交">
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/datetime/js/lCalendar.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/orderAdd.js"></script>
</body>
</html>


