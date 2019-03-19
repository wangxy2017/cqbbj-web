<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/15
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>派单管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/sentOrder.css">
</head>
<body>
<header>
    <div class="pic">
            <img src="${pageContext.request.contextPath}/resources/wx/imge/comeback.png" onclick="javaScript:window.history.back()" alt="">
    </div>
    <p>派单管理</p>
</header>
<div class="container-fluid">
    <form action="" class="form-horizontal">
        <div class="form-group" id="main">
            <div class="row list-div">
                <label class="col-sm-3 control-label">订单编号:</label>
                <div class="col-sm-9">
                    <input class="form-control" type="text" id="disabledInput" value="<%=request.getParameter("id")%>" disabled>
                </div>
            </div>
            <div class="row list-div">
                <label class="col-sm-3 control-label">收款人员:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="moneyEmp" v-modul="moneyEmp">
                </div>
                <div class="col-sm-3">
                    <button type="button" @click="add1" class="btn btn-primary" >添加人员</button>
                </div>

            </div>
            <div class="row list-div">
                <label class="col-sm-3 control-label">司机:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="driver" v-modul="driver">
                </div>
                <div class="col-sm-3">
                    <button type="button" @click="add2" class="btn btn-primary" >添加人员</button>

                </div>
            </div>



            <div class="row list-div">
                <label class="col-sm-3 control-label">搬运工:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="hamal" v-modul="hamal">
                </div>
                <div class="col-sm-3">
                    <button type="button" @click="add3" class="btn btn-primary" >添加人员</button>

                </div>
            </div>

            <div class="row list-div">
                <label class="col-sm-3 control-label">空调工:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="techniCian" v-modul="techniCian">
                </div>
                <div class="col-sm-3">
                    <button type="button" @click="add4" class="btn btn-primary" >添加人员</button>
                </div>
            </div>



            <div class="row list-div">
                <div class="col-sm-6">
                    <button type="submit" class="btn btn-success btn-lg">提交</button>
                </div>
                <div class="col-sm-6">
                    <button id="rest" type="reset" class="btn btn-info btn-lg">重置</button>
                </div>
            </div>
        </div>
    </form>
</div>


<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/dispachOrder.js"></script>
</body>
</html>