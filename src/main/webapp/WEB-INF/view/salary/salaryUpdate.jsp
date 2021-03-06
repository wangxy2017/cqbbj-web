<%--
  Created by IntelliJ IDEA.
  User: liulei
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/salary/salaryUpdate.css">
</head>
<body>
<div class="main" id="main" data-id="<%=request.getParameter("id")%>">
    <%-- 页面返回键 --%>
    <a class="layui-btn go-back" href="javascript:window.history.back()">
        <i class="layui-icon">&#xe603;</i>返回
    </a>
    <%-- 表单区域 --%>
    <form class="layui-form" action="" method="post">
        <div class="layui-form-item layui-hide">
            <%-- 表单隐藏区域 --%>
            <input type="hidden" name="id" id="id" v-model="salary.id">
            <input type="hidden" name="emp_no" id="emp_no" v-model="salary.emp_no">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工姓名：</label>
            <div class="layui-input-inline">
                <input type="text" name="emp_name" id="emp_name" required lay-verify="required" placeholder="请输入员工姓名"
                       autocomplete="off"
                       class="layui-input" readonly v-model="salary.emp_name">
            </div>
            <button type="button" class="layui-btn" @click="chooseEmployee">选择员工</button>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">基本工资：</label>
            <div class="layui-input-inline">
                <input type="text" name="base_money" required lay-verify="required" placeholder="请输入基本工资"
                       autocomplete="off"
                       class="layui-input" v-model="salary.base_money">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">提成工资：</label>
            <div class="layui-input-inline">
                <input type="text" name="profit_money" required lay-verify="required" placeholder="请输入提成工资"
                       autocomplete="off"
                       class="layui-input" v-model="salary.profit_money">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">其它开支：</label>
            <div class="layui-input-inline">
                <input type="text" name="other_money" required lay-verify="required" placeholder="请输入其它开支"
                       autocomplete="off"
                       class="layui-input" v-model="salary.other_money">
            </div>
            <div class="layui-form-mid layui-word-aux">提示：可输入100 或 -100，用于奖金派发、借款扣除等</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">实发工资：</label>
            <div class="layui-input-inline">
                <input type="text" name="real_money" required lay-verify="required" autocomplete="off"
                       class="layui-input" v-model="salary.real_money">
            </div>
            <div class="layui-form-mid layui-word-aux">提示：实发工资 = 基本工资 + 提成工资 + 其它开支</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年：</label>
            <div class="layui-input-inline">
                <select class="layui-input" name="year" v-model="salary.year">
                    <option value="">请选择年</option>
                    <option value="2017">2017 年</option>
                    <option value="2018">2018 年</option>
                    <option value="2019">2019 年</option>
                    <option value="2020">2020 年</option>
                    <option value="2021">2021 年</option>
                    <option value="2022">2022 年</option>
                    <option value="2023">2023 年</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">月：</label>
            <div class="layui-input-inline">
                <select class="layui-input" name="month" v-model="salary.month">
                    <option value="">请选择月</option>
                    <option value="1">1 月</option>
                    <option value="2">2 月</option>
                    <option value="3">3 月</option>
                    <option value="4">4 月</option>
                    <option value="5">5 月</option>
                    <option value="6">6 月</option>
                    <option value="7">7 月</option>
                    <option value="8">8 月</option>
                    <option value="9">9 月</option>
                    <option value="10">10 月</option>
                    <option value="11">11 月</option>
                    <option value="12">12 月</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">薪资备注：</label>
            <div class="layui-input-inline" style="width: 500px;">
                <textarea name="remark" id="remark" placeholder="请输入内容" class="layui-textarea"
                          v-model="salary.remark"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="updateSalary">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/salary/salaryUpdate.js"></script>
</body>
</html>
