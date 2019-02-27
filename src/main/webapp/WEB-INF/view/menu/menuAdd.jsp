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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu/menuAdd.css">
</head>
<body>
<div class="main">
<%-- 页面返回键 --%>
<a class="layui-btn go-back" href="/menu/menu">
<i class="layui-icon">&#xe603;</i>返回
</a>
<%-- 表单区域 --%>
<form class="layui-form" action="">
<div class="layui-form-item">
<label class="layui-form-label">菜单名称</label>
<div class="layui-input-block">
<input type="text" name="name" required lay-verify="required" placeholder="请输入菜单名称" autocomplete="off"
class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">上级菜单</label>
<div class="layui-input-block">
<select name="pid" id="pid" lay-verify="required">
<option value="">请选择</option>
<option value="0">无上级菜单</option>
</select>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">菜单路径</label>
<div class="layui-input-block">
<input type="text" name="url" placeholder="请输入菜单路径" autocomplete="off"
class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">是否启用</label>
<div class="layui-input-block">
<input type="radio" name="is_disabled" value="0" title="启用" checked>
<input type="radio" name="is_disabled" value="1" title="不启用">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">排序</label>
<div class="layui-input-block">
<input type="text" name="sort" value="0" required lay-verify="required" placeholder="请输入排序"
autocomplete="off"
class="layui-input">
</div>
</div>
<div class="layui-form-item">
<div class="layui-input-block">
<button class="layui-btn" lay-submit lay-filter="addMenu">立即提交</button>
<button type="reset" class="layui-btn layui-btn-primary">重置</button>
</div>
</div>
</form>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/menu/menuAdd.js"></script>
</div>
</body>
</html>
