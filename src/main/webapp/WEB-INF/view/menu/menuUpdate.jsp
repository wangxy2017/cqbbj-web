<%--
Created by IntelliJ IDEA.
User: 王孝元
Date: 2019/1/18
Time: 15:01
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu/menuUpdate.css">
</head>
<body>
	<div class="main" id="main" data-id="<%= request.getParameter("id")%>">
	<%-- 页面返回键 --%>
	<a class="layui-btn go-back" href="javascript:window.history.back()">
	    <i class="layui-icon">&#xe603;</i>返回
	</a>
        <%-- 表单区域 --%>
        <form class="layui-form" action="" v-if="menu">
            <div class="layui-form-item layui-hide">
                <input type="hidden" name="id" v-model="menu.id">
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜单类型</label>
                <div class="layui-input-block">
                    <select name="type" lay-verify="required" v-model="menu.type">
                        <option value="">请选择</option>
                        <option value="0">PC端</option>
                        <option value="1">微信端</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜单名称</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required" placeholder="请输入菜单名称" autocomplete="off"
                    class="layui-input" v-model="menu.name">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">上级菜单</label>
                <div class="layui-input-block">
                    <select name="pid" lay-verify="required" v-model="menu.pid">
                        <option value="">请选择</option>
                        <option value="0">无上级菜单</option>
                        <option v-for="item in menus" :value="item.id" v-text="item.name"></option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜单路径</label>
                <div class="layui-input-block">
                    <input type="text" name="url" placeholder="请输入菜单路径" autocomplete="off"
                    class="layui-input" v-model="menu.url">
                </div>
            </div>
                <div class="layui-form-item">
                        <label class="layui-form-label">图标路径</label>
                        <div class="layui-input-block">
                                <input type="text" name="icon" placeholder="请输入图标路径" autocomplete="off"
                                class="layui-input" v-model="menu.icon">
                        </div>
                </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否启用</label>
                <div class="layui-input-block">
                    <input type="radio" name="is_disabled" value="0" title="启用" v-model="menu.is_disabled">
                    <input type="radio" name="is_disabled" value="1" title="不启用" v-model="menu.is_disabled">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">排序</label>
                <div class="layui-input-block">
                    <input type="text" name="sort" required lay-verify="required" placeholder="请输入排序" autocomplete="off"
                    class="layui-input" v-model="menu.sort">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="updateMenu">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
        <p class="no-data" v-else>【暂无数据】</p>
	</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/menu/menuUpdate.js"></script>
</body>
</html>
