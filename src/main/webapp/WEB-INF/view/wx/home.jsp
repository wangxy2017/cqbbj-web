<%--
  Created by IntelliJ IDEA.
  User: liulei
  Date: 2019/3/14
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/wx/plugin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">

    <title>会员中心</title>
</head>
<body>
<div class="container-fluid">
    <header>
        <br/>
        <div id="pichead"></div>
        <div class="set" style="display: none">
            <a href="javascript:;">
                <img src="${pageContext.request.contextPath}/resources/wx/imge/shezhi.png" alt="">
            </a>
        </div>
        <p >{{empName}}</p>
        <div class="header-bottom">
            <ul>
                <li>
                    <a >钱包</a>
                </li>
                <li>
                    <a >我的任务</a>
                </li>
            </ul>
            <ul class="ulfen">
                <li>￥5000.00</li>
                <li>50</li>
            </ul>
        </div>
    </header>
    <div id="main">
        <ul>
            <li v-for="menu in menus">
                <a @click.stop="tiaozhuan(menu.url)">
                    <div>
                        <img :src="menu.icon" alt="">
                    </div>
                    <p>{{menu.name}}</p>
                </a>
            </li>

        </ul>
    </div>
</div>
<!--<footer></footer>-->
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/home.js"></script>
</body>
</html>
