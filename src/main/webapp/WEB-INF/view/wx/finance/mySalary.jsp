<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/24
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/salary.css">
    <title>重庆棒棒军管理系统</title>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()" ></span>
    </div>
    <p>工资管理</p>
</header>
<div class="container-fluid" id="main">
    <div class="row list-li" @click.stop="display($event)" v-for="item in salarys">
        <div class="hd">
            <img src="${pageContext.request.contextPath}/resources/wx/imge/hd.png">
        </div>
        <div class="col-sm-3 name name_no ">姓&nbsp;&nbsp;名</div>
        <div class="col-sm-9 name_no">
            <span class="glyphicon glyphicon-user"></span>
            {{item.emp_name}}
        </div>
        <div class="col-sm-3">基本工资</div><div class="col-sm-9">{{item.base_money}}</div>
        <div class="col-sm-3">提成工资</div><div class="col-sm-9">{{item.profit_money}}</div>
        <div class="col-sm-3 name">支&nbsp;&nbsp;出</div><div class="col-sm-9">{{item.other_money}}</div>
        <div class="col-sm-3">实发工资</div><div class="col-sm-9">{{item.real_money}}</div>
        <div class="footer" >
            <div class="col-sm-6">
                <input type="button" class="btn btn-info btn-lg" @click.stop="update(item.id)" value="修改">
            </div>
            <div class="col-sm-6">
                <input type="button" class="btn btn-danger" @click.stop="open($event)" value="删除">
            </div>
        </div>
        <div class="alert_model" @click.stop="end">
            <div class="alert_body">
                <div class="alert-title">
                    <p>提示</p>
                    <span @click.stop="hide" class="glyphicon glyphicon-remove"></span>
                </div>
                <div class="container-fluid">
                    <div class="modal-text">
                        <p>是否确定删除?</p>
                    </div>
                    <div class="col-sm-6">
                        <input type="button" class="btn btn-info btn-lg btn-block" @click.stop="ascertain(item.id)"  value="确定">
                    </div>
                    <div class="col-sm-6">
                        <input type="button" class="btn btn-default btn-lg btn-block" @click="outMolde" value="取消">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row loading">
        <div class="col-sm-5">
            <img class="pull-right" src="${pageContext.request.contextPath}/resources/wx/imge/loading.gif" alt="">
        </div>
        <div class="col-sm-7">
            <P class="pull-left">页面加载中...</P>
        </div>
    </div>
    <div class=" row baseLine">
        <p>---------我是有底线的----------</p>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/mySalary.js"></script>
</body>
</html>