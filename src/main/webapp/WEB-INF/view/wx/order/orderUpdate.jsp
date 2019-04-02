<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/15
  Time: 16:27
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
    <title>订单管理</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/model.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/orderUpdate.css">
</head>
<body>
<header>
    <div class="pull-left col-sm-2">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <div class="col-sm-8">
        <p>订单修改</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home" onclick="javaScript:window.location.href='/wx/login/toHome'"></span>
    </div>
</header>
<div class="container-fluid" id="main">
    <table class="table" id="table" data_id="<%=request.getParameter("id")%>">
        <input type="hidden" name="status" id="status" v-model="order.status">
        <tr class="row">
            <th class="col-sm-3">订单编号:</th>
            <td class="col-sm-9" style="color: #1e9fff"><input type="text" class="form-control" name="order_no" disabled
                                                               id="order_no" v-model="order.order_no"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">客户名称:</th>
            <td class="col-sm-9"><input type="text" class="form-control" name="name" id="name" v-model="order.name"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">客户电话:</th>
            <td class="col-sm-9"><input type="number" class="form-control" name="phone" id="phone" v-model="order.phone"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">搬出地址:</th>
            <td class="col-sm-9"><input type="text" class="form-control" name="start" id="start" v-model="order.start"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">搬入地址:</th>
            <td class="col-sm-9"><input type="text" class="form-control" name="end" id="end" v-model="order.end"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">客户备注:</th>
            <td class="col-sm-9"><input type="text" class="form-control" name="remark" id="remark" v-model="order.content"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">预估起价:</th>
            <td class="col-sm-9"><input type="text" class="form-control" name="price" id="price" v-model="order.price"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">预约时间:</th>
            <td class="col-sm-9"><input type="text" class="form-control" name="beginTime" id="beginTime" v-model="order.beginTime">
            </td>
        </tr>

        <%--选择要修改的收款人员--%>
        <tr class="row" v-show="isDispatch">
            <th class="col-sm-3">收款人:<span v-show="false" id="moneyEmpsList" v-for="item in order.moneyEmps">{{item.emp_name}}&nbsp;</span></th>
            <td class="col-sm-9">
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="moneyEmps_name" id="moneyEmps_name">
                    <input type="hidden" name="moneyEmps" id="moneyEmpNo">
                </div>
                <div class="col-sm-3">
                    <input type="button" @click.stop="openMoneyEmpModel($event)" class="btn btn-success btn-lg btn-block update" value="修改员工">
                </div>
            </td>

            <%--收款人模态框框--%>
            <div id="moneyEmp" class="alert_model" @click.stop="end">
                <div class="alert_body">
                    <div class="alert-title">
                        <p>选择员工</p>
                        <span  @click.stop="hide" class="glyphicon glyphicon-remove"></span></div>
                    <div class="container-fluid">
                        <div class="modal-text">
                            <div class="col-sm-4" v-for="item in money">
                                <button :data-emp_no="item.emp_no" class="btn btn-default btn-lg"@click.stop=" moneyEmpChoose($event)">{{item.name}}({{item.account}})</button>
                            </div>
                        </div>
                    </div>
                    <footer class="row">
                        <div class="col-sm-6">
                            <input type="button" class="btn btn-info btn-lg btn-block" value="添加">
                        </div>
                        <div class="col-sm-6">
                            <input class="btn btn-danger btn-lg btn-block" type="reset" @click="reset" value="重置">
                        </div>
                    </footer>
                </div>
            </div>
        </tr>

        <%--选择要修改的司机--%>
        <tr class="row" v-show="isDispatch">
            <th class="col-sm-3">司机:<span v-show="false" id="driveEmpsList" v-for="item in order.driveEmps">{{item.emp_name}}&nbsp;</span>
            </th>
            <td class="col-sm-9">
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="driveEmps_name" id="driveEmps_name">
                    <input type="hidden" name="driveEmps" id="driveEmps">
                </div>
                <div class="col-sm-3">
                    <input type="button" @click="openDriveEmp($event)" class="btn btn-success btn-lg btn-block update" value="修改员工">
                </div>
            </td>

            <%--司机模态框框--%>
            <div id="drive" class="alert_model" @click.stop="end">
                <div class="alert_body">
                    <div class="alert-title">
                        <p>选择员工</p>
                        <span  @click.stop="hide" class="glyphicon glyphicon-remove"></span></div>
                    <div class="container-fluid">
                        <div class="modal-text">
                            <div class="col-sm-4" v-for="item in drive">
                                <button :data-emp_no="item.emp_no" class="btn btn-default btn-lg"@click.stop="DriveEmpChoose($event)">{{item.name}}({{item.account}})</button>
                            </div>
                        </div>
                    </div>
                    <footer class="row">
                        <div class="col-sm-6">
                            <input type="button" class="btn btn-info btn-lg btn-block" value="添加">
                        </div>
                        <div class="col-sm-6">
                            <input class="btn btn-danger btn-lg btn-block" type="reset" @click="reset" value="重置">
                        </div>
                    </footer>
                </div>
            </div>
        </tr>

        <%--选择要修改的搬运工--%>
        <tr class="row" v-show="isDispatch">
            <th class="col-sm-3">搬运工:<span v-show="false" id="moveEmpsList" v-for="item in order.moveEmps">{{item.emp_name}}&nbsp;</span>
            </th>
            <td class="col-sm-9">
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="moveEmps_name" id="moveEmps_name">
                    <input type="hidden" name="moveEmps" id="moveEmps">
                </div>
                <div class="col-sm-3">
                    <input type="button" @click="openMoveEmp($event)" class="btn btn-success btn-lg btn-block update" value="修改员工">
                </div>
            </td>

            <%--搬用工model框--%>
            <div id="move" class="alert_model" @click.stop="end">
                <div class="alert_body">
                    <div class="alert-title">
                        <p>选择员工</p>
                        <span  @click.stop="hide" class="glyphicon glyphicon-remove"></span></div>
                    <div class="container-fluid">
                        <div class="modal-text">
                            <div class="col-sm-4" v-for="item in move">
                                <button :data-emp_no="item.emp_no" class="btn btn-default btn-lg"@click.stop="MoveEmpChoose($event)">{{item.name}}({{item.account}})</button>
                            </div>
                        </div>
                    </div>
                    <footer class="row">
                        <div class="col-sm-6">
                            <input type="button" class="btn btn-info btn-lg btn-block" value="添加">
                        </div>
                        <div class="col-sm-6">
                            <input class="btn btn-danger btn-lg btn-block" type="reset" @click="reset" value="重置">
                        </div>
                    </footer>
                </div>
            </div>
        </tr>

        <%--选择要修改的空调工--%>
        <tr class="row" v-show="isDispatch">
            <th class="col-sm-3">空调工:<span v-show="false" id="airEmpsList" v-for="item in order.airEmps">{{item.emp_name}}&nbsp;</span>
            </th>
            <td class="col-sm-9">
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="airEmps_name" id="airEmps_name">
                    <input type="hidden" name="airEmps" id="airEmps">
                </div>
                <div class="col-sm-3">
                    <input type="button" @click="openAirEmp($event)" class="btn btn-success btn-lg btn-block update" value="修改员工">
                </div>
            </td>

            <%--空调工模态框--%>
            <div id="air" class="alert_model" @click.stop="end">
                <div class="alert_body">
                    <div class="alert-title">
                        <p>选择员工</p>
                        <span  @click.stop="hide" class="glyphicon glyphicon-remove"></span></div>
                    <div class="container-fluid">
                        <div class="modal-text">
                            <div class="col-sm-4" v-for="item in air">
                                <button :data-emp_no="item.emp_no" class="btn btn-default btn-lg"@click.stop="AirEmpChoose($event)">{{item.name}}({{item.account}})</button>
                            </div>
                        </div>
                    </div>
                    <footer class="row">
                        <div class="col-sm-6">
                            <input type="button" class="btn btn-info btn-lg btn-block" value="添加">
                        </div>
                        <div class="col-sm-6">
                            <input class="btn btn-danger btn-lg btn-block" type="reset" @click="reset" value="重置">
                        </div>
                    </footer>
                </div>
            </div>
        </tr>
        <tr class="row">
            <th class="col-sm-3">订单状态:</th>
            <td id="picImg" class="col-sm-9">
                <span v-if="order.status == 0">  <img src="${pageContext.request.contextPath}/resources/wx/imge/wp.png"
                                                      alt=""></span>
                <span v-else-if="order.status == 3"> <img
                        src="${pageContext.request.contextPath}/resources/wx/imge/zf.png" alt=""></span>
                <span v-else-if="order.status == 1">  <img
                        src="${pageContext.request.contextPath}/resources/wx/imge/yp.png" alt=""></span>
                <span v-else> <img src="${pageContext.request.contextPath}/resources/wx/imge/wc.png" alt=""></span>
            </td>
        </tr>
    </table>
    <%--footer区--%>
    <footer class="row">
        <input type="button" class="form-control btn btn-info btn-lg btn-block" id="submit" @click="submit" value="提交">
    </footer>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/cache.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/orderUpdate.js"></script>
</body>
</html>
