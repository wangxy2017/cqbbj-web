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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/orderUpdate.css">
</head>
<body>
<div class="main" id="main" data-id="<%=request.getParameter("id")%>">
    <p class="page-title">修改订单</p>
    <%-- 表单区域 --%>
    <form class="layui-form" action="" v-if="order">
        <div class="layui-form-item layui-hide">
            <input type="hidden" name="id" v-model="order.id">
            <input type="hidden" name="order_no" v-model="order.order_no">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="required">*</i>客户姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" placeholder="请输入客户姓名" autocomplete="off"
                       class="layui-input" v-model="order.name">
            </div>
            <label class="layui-form-label"><i class="required">*</i>客户电话</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" required lay-verify="required" placeholder="请输入客户电话" autocomplete="off"
                       class="layui-input" v-model="order.phone">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="required">*</i>客户来源</label>
            <div class="layui-input-inline">
                <select name="source" lay-verify="required" v-model="order.source">
                    <option value="">请选择</option>
                    <option value="0">电话</option>
                    <option value="1">网络</option>
                </select>
            </div>
            <label class="layui-form-label"><i class="required">*</i>客户类型</label>
            <div class="layui-input-inline">
                <select name="type" lay-verify="required" v-model="order.type">
                    <option value="">请选择</option>
                    <option value="0">个人</option>
                    <option value="1">公司</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="required">*</i>搬出地址</label>
            <div class="layui-input-inline" style="position: relative">
                <input type="text" id="start" name="start" required lay-verify="required" placeholder="模糊地址检索"
                       autocomplete="off"
                       class="layui-input" v-model="order.start">
                <dl id="startResult" class="search-list">
                </dl>
                <input type="hidden" id="startMap" name="startMap" v-model="order.startMap">
            </div>
            <label class="layui-form-label"><i class="required">*</i>搬入地址</label>
            <div class="layui-input-inline" style="position: relative">
                <input type="text" id="end" name="end" required lay-verify="required" placeholder="模糊地址检索"
                       autocomplete="off"
                       class="layui-input" v-model="order.end">
                <dl id="endResult" class="search-list">
                </dl>
                <input type="hidden" id="endMap" name="endMap" v-model="order.endMap">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="required">*</i>订单价格</label>
            <div class="layui-input-inline">
                <input type="text" name="price" required lay-verify="required" placeholder="请输入订单价格" autocomplete="off"
                       class="layui-input" v-model="order.price">
            </div>
            <label class="layui-form-label"><i class="required">*</i>预约时间</label>
            <div class="layui-input-inline">
                <input type="text" id="beginTime" name="beginTime" required lay-verify="required"
                       placeholder="请选择预约时间"
                       autocomplete="off"
                       class="layui-input" v-model="order.beginTime">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">搬运备注</label>
            <div class="layui-input-inline" style="width: 500px;">
                <textarea id="content" name="content" placeholder="请输入内容" class="layui-textarea"
                          v-model="order.content"></textarea>
                <div id="items" style=""></div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="updateOrder">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <p class="no-data" v-else>【暂无数据】</p>
    <div id="baiduMap"></div>
    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=3.0&ak=aRGbzueRRGEY2RRS1RQTPIzVz16lnjkn"></script>
    <script src="${pageContext.request.contextPath}/resources/js/order/orderUpdate.js"></script>
</div>
</body>
</html>
