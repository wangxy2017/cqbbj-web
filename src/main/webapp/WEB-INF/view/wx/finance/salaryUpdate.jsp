<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/27
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/datetime/css/lCalendar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/updateSalary.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/wx/favicon.ico"/>
    <title>财务管理</title>
</head>
<body>
<header>
    <div class="pull-left col-sm-2">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <div class="col-sm-8">
        <p>修改工资</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home" onclick="javaScript:window.location.href='/wx/login/toHome'"></span>
    </div>
</header>
<div class="container-fluid" id="main">
    <form class="center" v-if="salary">
        <div class="row">
            <div class="col-sm-3">员工姓名:</div>

            <div class="col-sm-9">
                <span id="name" type="text" class="form-control">{{salary.emp_name}}</span>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">基本工资:</div>
            <div class="col-sm-9">
                <input type="number" class="form-control" v-model="salary.base_money">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">提成工资:</div>
            <div class="col-sm-9">
                <input type="number" class="form-control" v-model="salary.profit_money">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">其他开支:</div>
            <div class="col-sm-9">
                <input type="number" class="form-control" v-model="salary.other_money">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">实发工资:</div>
            <div class="col-sm-9">
                <input type="number" class="form-control" v-model="salary.real_money">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">年:</div>
            <div class="col-sm-9">
                <input type="text" id="years" class="form-control" v-model="salary.year">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">月:</div>
            <div class="col-sm-9">
                <select class="form-control" id="montn" v-model="salary.month">
                    <option value="">请选择</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">薪资备注:</div>
            <div class="col-sm-9 textBox">
                <textarea class="form-control" rows="6" v-model="salary.remark"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <input type="button" class="btn btn-info btn-block" @click.stop="submit" value="提交修改">
            </div>
            <div class="col-sm-6">
                <input type="reset" class="btn btn-danger btn-block" value="重置">
            </div>
        </div>
    </form>
    <p class="no-data" v-else>【暂无数据】</p>
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/datetime/js/lCalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/datetime/js/lCalendar.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/salaryUpdate.js"></script>
</body>
</html>
