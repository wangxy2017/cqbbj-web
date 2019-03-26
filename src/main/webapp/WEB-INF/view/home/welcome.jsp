<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home/welcome.css">
</head>
<body>
<div class="main">
    <div class="notice">
        <span class="title">系统提示</span>
        <marquee direction="scroll" scrollamount="4" scroll="left"> 该出显示棒棒军平台公告该出显示棒棒军平台公告</marquee>
    </div>
    <div class="content">
        <div class="left">
            <div class="task">
                <div class="info">
                    <p class="myTask">我的工作</p>
                    <p><em class="num">100</em>条</p>
                    <p>
                        <button style="margin-top: 10px" class="layui-btn layui-btn-normal layui-btn-sm">查看任务</button>
                    </p>
                </div>
                <div class="list">
                    <p class="list-title">工作列表</p>
                    <p>任务1</p>
                    <p>任务1</p>
                    <p>任务1</p>
                    <p>任务1</p>
                </div>
            </div>
            <div class="table"></div>
        </div>
        <div class="right">
            <div class="help">
                <p class="title">系统使用说明</p>
                <ul class="content">
                    <li>第一步：系统设置、短信管理说明</li>
                    <li>第一步：系统设置、短信管理说明</li>
                    <li>第一步：系统设置、短信管理说明</li>
                    <li>第一步：系统设置、短信管理说明</li>
                    <li>第一步：系统设置、短信管理说明</li>
                    <li>第一步：系统设置、短信管理说明</li>
                </ul>
            </div>
            <div class="code">
                <p class="title">微信订单管理</p>
                <dl>
                    <dt><img src="/resources/images/demo.png" alt="微信公众号" style="width: 100px;height: 100px"></dt>
                    <dd>
                        <p>第一步关注官方公众号</p>
                        <p>第一步关注官方公众号</p>
                        <p>第一步关注官方公众号</p>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/home/welcome.js"></script>
</body>
</html>
