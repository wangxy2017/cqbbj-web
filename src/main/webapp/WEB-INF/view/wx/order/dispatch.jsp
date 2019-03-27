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
    <meta name="viewport" content="width=device-width, initial-scale=0.3, user-scalable=0" />
    <title>派单管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/dispatch.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/wx/favicon.ico"/>
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>未派订单</p>
</header>
<div class="container-fluid" id="main" dataid="<%=request.getParameter("order_no")%>">
    <!--<form action="" class="form-horizontal">-->
    <div class="form-group">
        <div class="row list-div">
            <label class="col-sm-3 control-label">订单编号:</label>
            <div class="col-sm-9">
                <input id="order_no" name="order_no" class="form-control" v-model="order_no"    disabled>
            </div>
        </div>
        <!--随车收款人员模态框-->
        <div class="row list-div">
            <label class="col-sm-3 control-label">收款人员:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="moneyEmp">
                <input type="hidden" class="form-control" id="moneyEmpNo">
            </div>
            <div class="col-sm-3">
                <button type="button" class="btn btn-primary" data-toggle="modal"data-target=".bs-example-modal-lg"  @click="chooseEmp">添加人员</button>
            </div>
            <div id="cashier" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
                 aria-labelledby="myLargeModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-title">
                            <h4>选择收款员工</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-4 emp" v-for="item in emps">
                                        <button type="button" :data-emp_no="item.emp_no"
                                                class="btn btn-default btn-lg" @click="checkEmp($event)">{{item.name}}({{item.account}})</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer row">
                            <div class="col-sm-6">
                                <button class="btn btn-success" data-dismiss="modal">提交</button>
                            </div>
                            <div class="col-sm-6">
                                <button class="btn btn-default" type="reset">重置</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>






        <!--随车司机模态框-->
        <div class="row list-div">
            <label class="col-sm-3 control-label">司机:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="driver">
                <input type="hidden" class="form-control" id="divNum">
            </div>
            <div class="col-sm-3">
                <button class="btn btn-primary" data-toggle="modal" data-target="#motorMan" @click="chooseDriver">添加人员</button>
            </div>
        </div>
        <div id="motorMan" class="modal fade" tabindex="-1" role="dialog"
             aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-title">
                        <h4>选择随车司机</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4" v-for="item in motorMans">
                                    <button :data-emp_no="item.emp_no"
                                            class="btn btn-default btn-lg" @click="checkDriver($event)">{{item.name}}({{item.account}})</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer row">
                        <div class="col-sm-6">
                            <button class="btn btn-success" data-dismiss="modal">提交</button>
                        </div>
                        <div class="col-sm-6">
                            <button class="btn btn-default" type="reset" @click="reset">重置</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>







        <!--随车搬运工模态框-->
        <div class="row list-div">
            <label class="col-sm-3 control-label">搬运工:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="hamal">
                <input type="hidden" class="form-control" id="ham">
            </div>
            <div class="col-sm-3">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#porter" @click="chooseHamal">添加人员</button>
            </div>
        </div>
        <div id="porter" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-title">
                        <h4>选择随车搬运工</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4" v-for="item in hamals">
                                    <button :data-emp_no="item.emp_no"
                                            class="btn btn-default btn-lg" @click="checkHamal($event)">{{item.name}}({{item.account}})</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer row">
                        <div class="col-sm-6">
                            <button class="btn btn-success" data-dismiss="modal">提交</button>
                        </div>
                        <div class="col-sm-6">
                            <button class="btn btn-default" type="reset" @click="reset">重置</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!--随车空调工模态框-->
        <div class="row list-div">
            <label class="col-sm-3 control-label">空调工:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="techniCian">
                <input type="hidden" class="form-control" id="techNo">
            </div>
            <div class="col-sm-3">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#hvac" @click="chooseHvac">添加人员</button>
            </div>
        </div>
        <div id="hvac" class="modal fade" tabindex="-1" role="dialog"
             aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-title">
                        <h4>选择随车空调工</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4" v-for="item in hvacs">
                                    <button :data-emp_no="item.emp_no"  class="btn btn-default btn-lg" @click="checkHvac">{{item.name}}({{item.account}}) </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer row">
                        <div class="col-sm-6">
                            <button class="btn btn-success" data-dismiss="modal">提交</button>
                        </div>
                        <div class="col-sm-6">
                            <button class="btn btn-default" type="reset" @click="reset">重置</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row list-div">
            <div class="col-sm-6">
                <button type="button" class="btn btn-success btn-lg" @click="submit">提交</button>
            </div>
            <div class="col-sm-6">
                <button id="rest" type="reset" class="btn btn-info btn-lg" @click="reset">重置</button>
            </div>
        </div>
    </div>
    <!--</form>-->
</div>

<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/dispatch.js"></script>
</body>
</html>