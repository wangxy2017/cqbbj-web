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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/datetime/css/lCalendar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/onlineOrder.css">
    <title>在线下单</title>
</head>
<body>
<%--herder区--%>
<header>
    <p>重庆棒棒军在线下单系统</p>
</header>
<%--banner区--%>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item">
            <img src="${pageContext.request.contextPath}/resources/wx/imge/banner.jpg" alt="">
        </div>
        <div class="item active">
            <img src="${pageContext.request.contextPath}/resources/wx/imge/bannerTow%20.jpg" alt="">
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<%--广告区--%>
<div class="advertising row">
    <div class="title col-sm-2">
        <p>公告<span class="glyphicon glyphicon-volume-down"></span></p>
    </div>
    <div class="col-sm-10">
        <marquee behavior="" direction="">这是一段测试滚动广告词......</marquee>
    </div>
</div>
<%--main区--%>
<div class="container-fluid" id="main">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                搬出地址<span class="glyphicon glyphicon-map-marker"></span>
            </label>
            <div class="col-sm-10">
                <input id="start" name="start" type="text" class="form-control" placeholder="搬出地址">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">
               搬入地址<span class="glyphicon glyphicon-map-marker"></span>
            </label>
            <div class="col-sm-10">
                <input id="end" name="end" type="text" class="form-control" placeholder="搬入地址">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">
                <p>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名<span class="glyphicon glyphicon-asterisk" style="font-size: 1.5rem"></span></p>
            </label>
            <div class="col-sm-10">
                <input id="name" name="name" type="text" class="form-control" placeholder="请输入您的姓名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">
                <p>电话号码<span class="glyphicon glyphicon-asterisk" style="font-size: 1.5rem"></span></p>
            </label>
            <div class="col-sm-10">
                <input name="phone" id="phone" type="number" class="form-control" placeholder="请输入您的联系方式">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <input @click.stop="submit" id="submit" class="btn btn-block" type="button" value="下单">
            </div>
        </div>
    </form>
</div>


<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/datetime/js/lCalendar.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/onlineOrder.js"></script>
</body>
</html>


