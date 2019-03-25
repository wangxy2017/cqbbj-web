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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/employee/resignedEmployee.css">
</head>
<body>
<div class="main" id="main">
    <%-- 工具栏 --%>
    <div class="search-tools">
        <div class="search-item">
            姓名：
            <div class="layui-input-inline">
                <input class="layui-input" name="name" autocomplete="off" v-model="name">
            </div>
        </div>
        <div class="search-item">
            电话：
            <div class="layui-input-inline">
                <input class="layui-input" name="phone" autocomplete="off" v-model="phone">
            </div>
        </div>
        <div class="search-item">
            员工分类：
            <div class="layui-input-inline" style="width: 80px;">
                <select class="layui-input" name="position_id" v-model="position_id">
                    <option value="">请选择</option>
                    <option value="2">普通司机</option>
                    <option value="3">中级司机</option>
                    <option value="4">高级司机</option>
                    <option value="1">搬用工</option>
                    <option value="5">空调工</option>
                </select>
            </div>
        </div>
        <div class="search-item">
            <button class="layui-btn" @click="search">搜索</button>
        </div>
    </div>
    <table id="resignedEmployeeList" lay-filter="resignedEmployeeList"></table>
    <%-- 工具条存放区域--%>
    <script type="text/html" id="options">
        <a class="layui-btn layui-btn-xs" lay-event="reLeave">恢复</a>
    </script>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/employee/resignedEmployee.js"></script>
</body>
</html>
