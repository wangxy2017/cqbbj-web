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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/intentionOrder/intentionOrder.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
    <div class="layui-btn-container">
        <button class="layui-btn" @click="addOrder">新增订单</button>
        <button class="layui-btn layui-btn-normal" @click="updateOrder">修改订单</button>
    </div>
    <div class="search-tools">
        <div class="search-item">
            订单编号：
            <div class="layui-input-inline">
                <input class="layui-input" name="inten_no" autocomplete="off" placeholder="输入订单编号" v-model="inten_no">
            </div>
        </div>
        <div class="search-item">
            客户名称：
            <div class="layui-input-inline">
                <input class="layui-input" name="name" autocomplete="off" placeholder="输入客户名称" v-model="name">
            </div>
        </div>
        <div class="search-item">
            创建时间：
            <div class="layui-input-inline">
                <input class="layui-input" id="createTime1" name="createTime1" autocomplete="off" placeholder="选择开始时间">
            </div>
            至
            <div class="layui-input-inline">
                <input class="layui-input" id="createTime2" name="createTime2" autocomplete="off" placeholder="选择结束时间">
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    </div>
    <table id="orderList" lay-filter="orderList"></table>
    <%-- 工具条存放区域--%>
    <script type="text/html" id="options">
        <a class="layui-btn layui-btn-xs" lay-event="follow">跟进</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="view">查看</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="cancel">作废</a>
    </script>
</div>
<%-- 跟进表单 --%>
<form class="layui-form" action="" id="intentionFollow" style="display: none">
    <div class="layui-form-item layui-hide">
        <input type="hidden" name="inten_no" id="inten_no">
        <input type="hidden" name="inten_id" id="inten_id">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">跟进时间</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="time" name="time" required lay-verify="required"
                   placeholder="选择跟进时间" autocomplete="off">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">跟进内容</label>
        <div class="layui-input-inline" style="width: 300px;">
            <textarea name="content" placeholder="请输入内容" lay-verify="required" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="addFollow">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/intentionOrder/intentionOrder.js"></script>
</body>
</html>
