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
        <div class="form-group">
            <div class="row list-div">
                <label class="col-sm-3 control-label">订单编号:</label>
                <div class="col-sm-9">
                    <input class="form-control" type="text" id="disabledInput" value="DT215465875485214586" disabled>
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
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target=".bs-example-modal-lg">添加人员
                    </button>
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
                                        <div class="col-sm-4">
                                            <button data-empNo="5465142321312" type="button"
                                                    class="btn btn-default btn-lg">王小鱼
                                            </button>
                                        </div>
                                        <div class="col-sm-4">
                                            <button type="button" class="btn btn-default btn-lg">李莉</button>
                                        </div>
                                        <div class="col-sm-4">
                                            <button type="button" class="btn btn-default btn-lg">欧阳明月</button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <button type="button" class="btn btn-default  btn-lg">刘小美</button>
                                        </div>
                                        <div class="col-sm-4">
                                            <button type="button" class="btn btn-default btn-lg">姜梓嫣</button>
                                        </div>
                                        <div class="col-sm-4">
                                            <button type="button" class="btn btn-default btn-lg">钱多多</button>
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
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#motorMan">添加人员
                    </button>
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
                                    <div class="col-sm-4">
                                        <button data-divNum="0000000321312" type="button"
                                                class="btn btn-default btn-lg">王小鱼
                                        </button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">李莉</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">欧阳明月</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default  btn-lg">刘小美</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">姜梓嫣</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">钱多多</button>
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
            <!--随车搬运工模态框-->
            <div class="row list-div">
                <label class="col-sm-3 control-label">搬运工:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="hamal">
                    <input type="hidden" class="form-control" id="ham">
                </div>
                <div class="col-sm-3">
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#porter">添加人员
                    </button>
                </div>
            </div>
            <div id="porter" class="modal fade" tabindex="-1" role="dialog"
                 aria-labelledby="myLargeModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-title">
                            <h4>选择随车搬运工</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <button data-empNo="5465142321312" type="button"
                                                class="btn btn-default btn-lg">王小鱼
                                        </button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">李莉</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">欧阳明月</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default  btn-lg">刘小美</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">姜梓嫣</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">钱多多</button>
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
            <!--随车空调工模态框-->
            <div class="row list-div">
                <label class="col-sm-3 control-label">空调工:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="techniCian">
                    <input type="hidden" class="form-control" id="techNo">
                </div>
                <div class="col-sm-3">
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#hvac">添加人员
                    </button>
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
                                    <div class="col-sm-4">
                                        <button data-empNo="5465142321312" type="button"
                                                class="btn btn-default btn-lg">王小鱼
                                        </button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">李莉</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">欧阳明月</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default  btn-lg">刘小美</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">姜梓嫣</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-default btn-lg">钱多多</button>
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
<script src="${pageContext.request.contextPath}/resources/wx/js/dispach.js"></script>
</body>
</html>