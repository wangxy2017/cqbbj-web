<%--
  Created by IntelliJ IDEA.
  User: 汇普科技有限公司
  Date: 2019/4/4
  Time: 9:43
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/dividendDetails.css">
    <title>提成统计</title>
</head>
<body>
<header>
    <div class="pull-left col-sm-2">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <div class="col-sm-8">
        <p>查看详情</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home"
              onclick="javaScript:window.location.href='/wx/login/toHome?userKey='+ myCache.userKey"
              style="color: white"></span>
    </div>
</header>
<div class="container-fluid" id="main">

        <div class="row">
            <div class="col-sm-3">订单编号:</div>
            <div class="col-sm-9" style="color: red">DT2019080606060655566666</div>
        </div>
        <div class="row">
            <div class="col-sm-3">客户姓名:</div>
            <div class="col-sm-9">罗小姐</div>
        </div>
        <div class="row">
            <div class="col-sm-3">客户电话:</div>
            <div class="col-sm-9">15000000000</div>
        </div>
        <div class="row">
            <div class="col-sm-3">搬出地址:</div>
            <div class="col-sm-9">北京市永定区长安街66号</div>
        </div>
        <div class="row">
            <div class="col-sm-3">搬入地址:</div>
            <div class="col-sm-9">重庆市渝北区空港大道观月路观月山水E栋501</div>
        </div>
        <div class="row">
            <div class="col-sm-3">订单金额:</div>
            <div class="col-sm-9" style="color: #e38d13">10000</div>
        </div>
        <div class="row">
            <div class="col-sm-3">完成时间:</div>
            <div class="col-sm-9">2019-04-06 14:00:50</div>
        </div>
        <div class="row">
            <div class="col-sm-3">提成员工:</div>
            <div class="col-sm-9">熊超&nbsp;刘磊&nbsp;王孝元&nbsp;甄军</div>
        </div>
        <div class="row">
            <div class="col-sm-3">提成金额:</div>
            <div class="col-sm-9" style="color: #e38d13">500</div>
        </div>
        <div class="row">
            <div class="col-sm-3">提成方式:</div>
            <div class="col-sm-9">比例提成</div>
        </div>
        <div class="row">
            <div class="col-sm-3">核算人:</div>
            <div class="col-sm-9">李梓萌</div>
        </div>
        <div class="row">
            <div class="col-sm-3">结算时间:</div>
            <div class="col-sm-9">2019-04-10 10:25:00</div>
        </div>

</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/dividendDetails.js"></script>
</body>
</html>
