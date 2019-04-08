<%--
  Created by IntelliJ IDEA.
  User: 汇普科技有限公司
  Date: 2019/4/3
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html  lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/customer.css">
    <title>会员中心</title>
</head>
<body>
<div class="top">
    <div class="header">
        <img src="/resources/wx/imge/header.jpg" alt="">
    </div>
        <p>姜小鱼</p>
</div>
<div class="container-fluid" id="main">
    <div class="center">
        <div class="center-titel">
            <div class="col-sm-12">
                <span class="pull-left">
                我的订单
            </span>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6" @click.stop="nonPeyment">
                <img src="/resources/wx/imge/0-1.jpg" alt="代付款">待付款
            </div>
            <div class="col-sm-6" @click.stop="hasPayMent">
                <img src="/resources/wx/imge/0-2.jpg" alt="已付款">已付款
            </div>
        </div>
    </div>
    <div class="center-body">
        <%--<div class="row" style="border-bottom: 1px solid;color: #CFCFCF">--%>
            <%--<div class="col-sm-2">--%>
                <%--<span class="glyphicon glyphicon-map-marker"></span>--%>
            <%--</div>--%>
            <%--<div class="col-sm-10">--%>
                <%--地址管理--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--<div class="col-sm-2">--%>
                <%--<span class="glyphicon glyphicon-cloud" style="color: #2BBA5E"></span>--%>
            <%--</div>--%>
            <%--<div class="col-sm-10">--%>
                <%--账号管理--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
    <footer>
        <div class="row" style="border-bottom: 1px solid;color: #CFCFCF">
            <div class="col-sm-2">
                <span class="glyphicon glyphicon-time" style="color: #F51211"></span>
            </div>
            <div class="col-sm-10">
                我的预约
            </div>
        </div>
        <%--<div class="row">--%>
            <%--<div class="col-sm-2">--%>
                <%--<span class="glyphicon glyphicon-question-sign" style="color: #2E23D1"></span>--%>
            <%--</div>--%>
            <%--<div class="col-sm-10">--%>
                <%--帮助--%>
            <%--</div>--%>
        <%--</div>--%>
    </footer>
</div>



<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/customer.js"></script>
</body>
</html>
