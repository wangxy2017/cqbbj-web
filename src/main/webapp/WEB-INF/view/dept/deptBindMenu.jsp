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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dept/deptBindMenu.css">
</head>
<body>
<div class="main" id="main" data-id="<%= request.getParameter("id")%>">
    <div class="layui-btn-container">
        <%-- 页面返回键 --%>
        <a class="layui-btn go-back" href="/dept/dept">
            <i class="layui-icon">&#xe603;</i>返回
        </a>
    </div>
    <%-- 菜单列表 --%>
    <div class="menu-table">
        <div class="menu-table-title">
            权限管理
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
    <div class="menu-actions layui-btn-container">
        <button class="layui-btn" @click="bindMenu">确认分配</button>
        <button class="layui-btn" @click="menu_ids = []">重置</button>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dept/deptBindMenu.js"></script>
</body>
</html>
