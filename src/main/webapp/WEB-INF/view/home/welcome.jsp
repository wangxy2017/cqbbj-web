<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/26
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home/welcome.css">
</head>
<body>
<div class="main" id="main">
    <div class="notice">
        <span class="title">系统提示：</span>
        <marquee direction="scroll" scrollamount="4" scroll="left">{{notice}}</marquee>
    </div>
    <div class="content">
        <div class="left">
            <div class="task">
                <div class="info">
                    <p class="myTask">我的任务</p>
                    <p><em class="num">{{task}}</em>条</p>
                    <p>
                        <button style="margin-top: 10px" class="layui-btn layui-btn-normal layui-btn-sm" @click="view">
                            查看任务
                        </button>
                    </p>
                </div>
                <div class="list">
                    <p class="list-title">最新派单：</p>
                    <p class="list-item" v-for="item in tasks">
                        预约时间：<i class="text">{{formatDate(item.beginTime)}}</i>
                        搬出地址：<i class="text">{{item.start}}</i>
                        搬入地址：<i class="text">{{item.end}}</i></p>
                    <p v-if="!tasks.length">【暂无派单】</p>
                </div>
            </div>
            <div class="table"></div>
        </div>
        <div class="right">
            <div class="help">
                <p class="title">系统使用说明</p>
                <ul class="list">
                    <li>1. 录入订单：【订单管理 - 意向订单 - 添加订单】</li>
                    <li>2. 下单：【订单管理 - 订单列表 - 添加订单】</li>
                    <li>3. 派单：【订单管理 - 未派订单 - 派单】</li>
                    <li>4. 辅助完成：【订单管理 - 已派订单 - 辅助完成】</li>
                    <li>5. 结算：【财务管理 - 财务结算 - 结算】</li>
                </ul>
            </div>
            <div class="code">
                <p class="title">微信订单管理</p>
                <dl>
                    <dt><img src="/resources/wx/imge/gzh_code.jpg" alt="微信公众号" style="width: 140px;height: 140px"></dt>
                    <dd>
                        <p>第一步：扫一扫，关注公众号</p>
                        <p>第二步：点击 “进入公众号” 按钮，进入公众号首页</p>
                        <p>第三步：点击【企业天地-员工入口】进行登录操作</p>
                        <p>第四步：登录成功，进入管理系统首页</p>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/home/welcome.js"></script>
</body>
</html>
