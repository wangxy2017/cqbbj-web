<%--
  Created by IntelliJ IDEA.
  User: 汇普科技有限公司
  Date: 2019/4/3
  Time: 15:29
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/dividends.css">
    <title>财务管理</title>
</head>
<body>
<header>
    <div class="pull-left col-sm-2">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <div class="col-sm-8">
        <p>提成统计</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home"
              onclick="javaScript:window.location.href='/wx/login/toHome?userKey='+ myCache.userKey"></span>
    </div>
</header>
<div class="container-fluid" id="main">
    <div class="card" @click.stop="vive">
        <div class="row">
            <label class="col-sm-3 control-label">订单编号:</label>
            <div class="col-sm-9">
                <p style="color: red">DT20190825545465465564654</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">客户姓名:</div>
            <div class="col-sm-9">
                <p>熊超</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">客户电话:</div>
            <div class="col-sm-9">
                <p>15736072128</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3" id="formAdd">搬出地址:</div>
            <div class="col-sm-8">
                <p>重庆市渝北区回兴街道办事处</p>
            </div>
            <div class="col-sm-1">
                <img src="/resources/wx/imge/foadd.png" alt="起点">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">搬入地址:</div>
            <div class="col-sm-8">
                <p>金开大道牛三北路一支路9888号</p>
            </div>
            <div class="col-sm-1" id="toAdd">
                <img src="/resources/wx/imge/toAd.png" alt="终点">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">提成金额:</div>
            <div class="col-sm-9">
                <p style="color: #e38d13">500</p>
            </div>
        </div>
        <div class="display">
                <input type="button" class="btn btn-block btn-primary" value="查看" @click.stop="detail">
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/dividends.js"></script>
</body>
</html>
