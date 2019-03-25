<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/25
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统公告</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home/noticePage.css">
</head>
<body>
<div class="main" id="main">
    <p class="page-title"><span class="flag">&nbsp;</span>系统公告</p>
    <ul class="notices" v-if="notices.length">
        <li v-for="item in notices">
            <span class="time">{{formatDate(item.createTime)}}</span><span class="content">{{item.content}}</span>
        </li>
    </ul>
    <p class="no-data" v-else>【暂无数据】</p>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/home/noticePage.js"></script>
</body>
</html>
