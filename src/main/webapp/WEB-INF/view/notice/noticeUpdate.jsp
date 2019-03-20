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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice/noticeUpdate.css">
</head>
<body>
<div class="main" id="main" data-id="<%= request.getParameter("id")%>">
    <%-- 页面返回键 --%>
    <a class="layui-btn go-back" href="javascript:window.history.back()">
        <i class="layui-icon">&#xe603;</i>返回
    </a>
    <%-- 表单区域 --%>
    <form class="layui-form" action="" v-if="notice">
        <div class="layui-form-item layui-hide">
            <%-- 表单隐藏区域 --%>
            <input type="hidden" name="id" v-model="notice.id">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="required">*</span>公告标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" required lay-verify="required" placeholder="请输入公告标题"
                       autocomplete="off"
                       class="layui-input" v-model="notice.title">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label"><span class="required">*</span>公告内容</label>
            <div class="layui-input-inline">
                <textarea style="height: 200px;" name="content" placeholder="请输入内容" class="layui-textarea" v-model="notice.content"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="updateNotice">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <p class="no-data" v-else>【暂无数据】</p>
    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/notice/noticeUpdate.js"></script>
</div>
</body>
</html>
