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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/employee/employeeUpdate.css">
</head>
<body>
<div class="main" id="main" data-id="<%= request.getParameter("id")%>">
    <%-- 页面返回键 --%>
    <a class="layui-btn go-back" href="/employee/employee">
        <i class="layui-icon">&#xe603;</i>返回
    </a>
    <%-- 表单区域 --%>
    <form class="layui-form" action="" v-if="employee">
        <div class="layui-form-item layui-hide">
            <%-- 表单隐藏区域 --%>
            <input type="hidden" name="id" v-model="employee.id">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" required lay-verify="required" placeholder="请输入员工姓名"
                       autocomplete="off"
                       class="layui-input" v-model="employee.name">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input type="text" name="phone" required lay-verify="required" placeholder="请输入员工手机号"
                       autocomplete="off"
                       class="layui-input" v-model="employee.phone">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="1" title="男" v-model="employee.sex">
                <input type="radio" name="sex" value="2" title="女" v-model="employee.sex">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录账号</label>
            <div class="layui-input-block">
                <input type="text" name="account" required lay-verify="required" placeholder="请设置登录账号"
                       autocomplete="off"
                       class="layui-input" v-model="employee.account">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input type="text" name="new_password" placeholder="设置新密码"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属部门</label>
            <div class="layui-input-block">
                <select name="dept_id" lay-verify="required" v-model="employee.dept_id">
                    <option value="">请选择</option>
                    <option v-for="item in depts" :value="item.id" v-text="item.name" :key="item.id"></option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属职位</label>
            <div class="layui-input-block">
                <select name="position_id" lay-verify="required" v-model="employee.position_id">
                    <option value="">请选择</option>
                    <option v-for="item in positions" :value="item.id" v-text="item.name" :key="item.id"></option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="updateEmployee">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <p class="no-data" v-else>【暂无数据】</p>
    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/employee/employeeUpdate.js"></script>
</div>
</body>
</html>
