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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/employee/employeeAdd.css">
</head>
<body>
<div class="main">
    <%-- 页面返回键 --%>
    <a class="layui-btn go-back" href="/employee/employee">
        <i class="layui-icon">&#xe603;</i>返回
    </a>
    <%-- 表单区域 --%>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">员工姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" required lay-verify="required" placeholder="请输入员工姓名"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input type="text" name="phone" required lay-verify="required" placeholder="请输入员工手机号"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="1" title="男" checked>
                <input type="radio" name="sex" value="2" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录账号</label>
            <div class="layui-input-block">
                <input type="text" name="account" required lay-verify="required" placeholder="请设置登录账号"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录密码</label>
            <div class="layui-input-block">
                <input type="text" name="password" value="123456" required lay-verify="required" placeholder="请设置登录密码"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所在部门</label>
            <div class="layui-input-block">
                <select name="dept_id" id="dept_id" lay-verify="required">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="addEmployee">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/employee/employeeAdd.js"></script>
</div>
</body>
</html>
