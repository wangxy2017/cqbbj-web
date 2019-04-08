<%--
  Created by IntelliJ IDEA.
  User: 汇普科技有限公司
  Date: 2019/4/8
  Time: 8:59
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/nonPeyMent.css">
    <title>会员中心</title>
</head>
<body>
<header>
    <div class="pull-left col-sm-2">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <div class="col-sm-8">
        <p>待付款</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home"  onclick="javaScript:window.location.href='/wx/customer/customer?userKey='+ myCache.userKey"></span>
    </div>
</header>
<div class="container-fluid" id="main">
    <div class="card" @click.stop="checkOver($event)">
        <div class="row">
            <div class="col-sm-3">订单编号:</div>
            <div class="col-sm-9" style="color: red">DT20190406080212332124596</div>
        </div>
        <div class="row">
            <div class="col-sm-3">客户姓名:</div>
            <div class="col-sm-9">李梓萌</div>
        </div>
        <div class="row">
            <div class="col-sm-3">客户电话:</div>
            <div class="col-sm-9">138000000000</div>
        </div>
        <div class="row">
            <div class="col-sm-3">搬出地址:</div>
            <div class="col-sm-9">重庆市渝高新城美好星空2栋206</div>
        </div>
        <div class="row">
            <div class="col-sm-3">搬入地址:</div>
            <div class="col-sm-9">重庆市合川区盐井镇荷花村六组21号</div>
        </div>
        <%--<div class="display">--%>
            <%--<div class="row">--%>
                <%--<div class="col-sm-12">--%>
                    <%--<input type="button" class="btn btn-block btn-primary" value="查看" @click.stop="lineItem">--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/nonPeyMent.js"></script>
</body>
</html>
