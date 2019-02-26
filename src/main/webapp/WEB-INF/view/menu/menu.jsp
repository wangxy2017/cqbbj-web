<%--
Created by IntelliJ IDEA.
User: 王孝元
Date: 2019/1/18
Time: 9:36
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Title</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu/menu.css">
</head>
<body>
<div class="main" id="main">
<%-- 工具栏 --%>
<div class="layui-btn-container">
<button class="layui-btn" @click="addMenu">添加菜单</button>
<button class="layui-btn layui-btn-normal" @click="updateMenu">修改菜单</button>
<button class="layui-btn layui-btn-danger" @click="deleteMenu">删除菜单</button>
</div>
<%-- 菜单列表 --%>
<div class="menu-table">
<div class="menu-table-title">
菜单设置
</div>
<ul class="menu-table-list" v-if="menus.length">
<li class="menu-table-list-li" v-for="menu in menus">
<div>
<label><input type="checkbox" :value="menu.id" :key="menu.id" v-model="menu_ids"><i>{{ menu.name
}}</i></label>
</div>
<div>
<label v-for="child in menu.childs">
<input type="checkbox" :value="child.id" :key="menu.id" v-model="menu_ids"><i>{{ child.name
}}</i>
</label>
</div>
</li>
</ul>
<p class="no-data" v-else>【暂无数据】</p>
</div>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/menu/menu.js"></script>
</body>
</html>
