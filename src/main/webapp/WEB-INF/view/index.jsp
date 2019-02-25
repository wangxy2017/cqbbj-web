<%--
  Created by IntelliJ IDEA.
  User: 王孝元
  Date: 2019/1/18
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>重庆棒棒军后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin" id="main">
    <div class="layui-header">
        <div class="layui-logo"><h3>棒棒军后台管理系统</h3></div>
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    我
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="javascript:;" @click="logout">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域 -->
            <ul class="layui-nav layui-nav-tree" lay-filter="menu" lay-shrink="all" v-if="menus.length">
                <li class="layui-nav-item" v-for="menu in menus">
                    <a class="" href="javascript:;" :key="menu.id">{{ menu.name }}</a>
                    <dl class="layui-nav-child" v-for="child in menu.childs">
                        <dd><a href="javascript:;" :data-url="child.url" :key="child.id">{{ child.name }}</a></dd>
                    </dl>
                </li>
            </ul>
            <p class="no-data" v-else>【暂无数据】</p>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe id="body" :src="url" frameborder="0" width="100%" height="100%"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © lohoo.com - 底部固定区域
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</body>
</html>
