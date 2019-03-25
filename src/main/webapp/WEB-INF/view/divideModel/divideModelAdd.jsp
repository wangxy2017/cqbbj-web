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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/divideModel/divideModelAdd.css">
</head>
<body>
<div class="main" id="main">
    <%-- 页面返回键 --%>
    <a class="layui-btn go-back" href="javascript:window.history.back()">
        <i class="layui-icon">&#xe603;</i>返回
    </a>
    <%-- 表单区域 --%>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="required">*</i>模板名称：</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" placeholder="请输入模板名称" autocomplete="off"
                       class="layui-input" v-model="name">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">司机提成设置：</label>
            <div class="layui-input-inline">
                <input type="text" name="driveInfo" placeholder="请设置提成方式"
                       autocomplete="off"
                       class="layui-input" readonly v-model="driveInfo">
            </div>
            <button class="layui-btn" type="button" @click="setting('drive')">设置提成</button>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">搬运工提成设置：</label>
            <div class="layui-input-inline">
                <input type="text" name="moveInfo" placeholder="请设置提成方式"
                       autocomplete="off"
                       class="layui-input" readonly v-model="moveInfo">
            </div>
            <button class="layui-btn" type="button" @click="setting('move')">设置提成</button>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">空调工提成设置：</label>
            <div class="layui-input-inline">
                <input type="text" name="airInfo" placeholder="请设置提成方式"
                       autocomplete="off"
                       class="layui-input" readonly v-model="airInfo">
            </div>
            <button class="layui-btn" type="button" @click="setting('air')">设置提成</button>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="addDivideModel">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <%-- 提成配置 --%>
    <form class="layui-form divide" id="divide" style="display: none">
        <dl class="divide-dl">
            <dt class="divide-dt">提成方式：</dt>
            <dd class="divide-dd">
                <div class="layui-input-inline">
                    <input type="radio" name="type" value="0" title="工时提成" checked>
                    <input type="radio" name="type" value="1" title="比例提成">
                </div>
            </dd>
        </dl>
        <dl class="divide-dl">
            <dt class="divide-dt">提成数值：</dt>
            <dd class="divide-dd">
                <div class="layui-input-inline" style="width: 222px; float: left;margin-right: 10px;">
                    <input type="text" name="value" required lay-verify="required" placeholder="请输入提成数值"
                           autocomplete="off"
                           class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">直接输入比例数字，如：15</div>
            </dd>
        </dl>
        <dl class="divide-dl">
            <dt class="divide-dt">提成额度：</dt>
            <dd class="divide-dd">
                <div class="layui-input-inline">
                    <input type="radio" name="isAll" value="0" title="全额提成">
                    <input type="radio" name="isAll" value="1" title="扣除开支提成" checked>
                </div>
            </dd>
        </dl>
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/divideModel/divideModelAdd.js"></script>
</body>
</html>
