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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/orderAdd.css">
</head>
<body>
<div class="main">
    <p class="page-title">添加订单</p>
    <%-- 表单区域 --%>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="required">*</i>客户姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" placeholder="请输入客户姓名" autocomplete="off"
                       class="layui-input">
            </div>
            <label class="layui-form-label"><i class="required">*</i>客户电话</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" required lay-verify="required" placeholder="请输入客户电话" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="required">*</i>搬出地址</label>
            <div class="layui-input-inline" style="position: relative">
                <input type="text" id="start" name="start" required lay-verify="required" placeholder="模糊地址检索"
                       autocomplete="off"
                       class="layui-input">
                <dl id="startResult" class="search-list">
                </dl>
                <input type="hidden" id="startMap" name="startMap">
            </div>
            <label class="layui-form-label"><i class="required">*</i>搬入地址</label>
            <div class="layui-input-inline" style="position: relative">
                <input type="text" id="end" name="end" required lay-verify="required" placeholder="模糊地址检索"
                       autocomplete="off"
                       class="layui-input">
                <dl id="endResult" class="search-list">
                </dl>
                <input type="hidden" id="endMap" name="endMap">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="required">*</i>订单价格</label>
            <div class="layui-input-inline">
                <input type="text" name="price" required lay-verify="required" placeholder="请输入订单价格" autocomplete="off"
                       class="layui-input">
            </div>
            <label class="layui-form-label"><i class="required">*</i>预约时间</label>
            <div class="layui-input-inline">
                <input type="text" id="beginTime" name="beginTime" required lay-verify="required"
                       placeholder="请选择预约时间"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">搬运备注</label>
            <div class="layui-input-inline" style="width: 500px;">
                <textarea id="content" name="content" placeholder="请输入内容" class="layui-textarea"></textarea>
                <div id="items" style=""></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">短信提醒</label>
            <div class="layui-input-inline">
                <input type="checkbox" name="isNotice" value="1" title="是否发送短信，提醒客户" lay-skin="primary">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="addOrder">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <div id="baiduMap"></div>
    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=3.0&ak=aRGbzueRRGEY2RRS1RQTPIzVz16lnjkn"></script>
    <script src="${pageContext.request.contextPath}/resources/js/order/orderAdd.js"></script>
</div>
</body>
</html>
