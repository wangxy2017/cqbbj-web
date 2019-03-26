<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/15
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>订单修改</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/orderUpdate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/model.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>订单修改</p>
</header>
<div class="container-fluid" id="main">
    <table class="table" id="table" data_id="<%=request.getParameter("id")%>">
        <input type="hidden" name="status" id="status" v-model="order.status">
        <tr class="row">
            <th class="col-sm-3">订单编号:</th>
            <td class="col-sm-9" style="color: #1e9fff"><input class="form-control" name="order_no" disabled
                                                               id="order_no" v-model="order.order_no"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">客户名称:</th>
            <td class="col-sm-9"><input class="form-control" name="name" id="name" v-model="order.name"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">客户电话:</th>
            <td class="col-sm-9"><input class="form-control" name="phone" id="phone" v-model="order.phone"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">搬出地址:</th>
            <td class="col-sm-9"><input class="form-control" name="start" id="start" v-model="order.start"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">搬入地址:</th>
            <td class="col-sm-9"><input class="form-control" name="end" id="end" v-model="order.end"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">客户备注:</th>
            <td class="col-sm-9"><input class="form-control" name="remark" id="remark" v-model="order.content"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">预估起价:</th>
            <td class="col-sm-9"><input class="form-control" name="price" id="price" v-model="order.price"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">预约时间:</th>
            <td class="col-sm-9"><input class="form-control" name="beginTime" id="beginTime" v-model="order.beginTime">
            </td>

        </tr>

        <tr class="row" v-show="isDispatch">
            <th class="col-sm-3">收款人:<span v-show="false" id="moneyEmpsList" v-for="item in order.moneyEmps">{{item.emp_name}} </span>
            </th>
            <td class="col-sm-9">
                <div class="col-sm-6">
                    <input class="form-control" name="moneyEmps_name" id="moneyEmps_name">
                    <input type="hidden" name="moneyEmps" id="moneyEmps">
                </div>
                <div class="col-sm-3">
                    <input type="button" @click="clickMoneyEmps()" class="btn btn-success btn-lg btn-block update" value="修改员工">
                </div>
            </td>

        </tr>
        <tr class="row" v-show="isDispatch">
            <th class="col-sm-3">司机:<span v-show="false" id="driveEmpsList" v-for="item in order.driveEmps">{{item.emp_name}}</span>
            </th>
            <td class="col-sm-9">
                <div class="col-sm-6">
                    <input class="form-control" name="driveEmps_name" id="driveEmps_name">
                    <input type="hidden" name="driveEmps" id="driveEmps">
                </div>
                <div class="col-sm-3">
                    <input type="button" @click="clickDriveEmps()" class="btn btn-success btn-lg btn-block update" value="修改员工">
                </div>
            </td>
        </tr>
        <tr class="row" v-show="isDispatch">
            <th class="col-sm-3">搬运工:<span v-show="false" id="moveEmpsList" v-for="item in order.moveEmps">{{item.emp_name}}</span>
            </th>
            <td class="col-sm-9">
                <div class="col-sm-6">
                    <input class="form-control" name="moveEmps_name" id="moveEmps_name">
                    <input type="hidden" name="moveEmps" id="moveEmps">
                </div>
                <div class="col-sm-3">
                    <input type="button" @click="clickMoveEmps()" class="btn btn-success btn-lg btn-block update" value="修改员工">
                </div>
            </td>
        </tr>
        <tr class="row" v-show="isDispatch">
            <th class="col-sm-3">空调工:<span v-show="false" id="airEmpsList" v-for="item in order.airEmps">{{item.emp_name}}</span>
            </th>
            <td class="col-sm-9">
                <div class="col-sm-6">
                    <input class="form-control" name="airEmps_name" id="airEmps_name">
                    <input type="hidden" name="airEmps" id="airEmps">
                </div>
                <div class="col-sm-3">
                    <input type="button" @click="clickAirEmps()" class="btn btn-success btn-lg btn-block update" value="修改员工">
                </div>
            </td>
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
    <footer class="row">
        <input class="form-control btn btn-info btn-lg btn-block" id="submit" @click="submit" value="提交">
    </footer>


    //收款人model框
    <div class="model">
        <div class="center">
            <div class="title">选择员工 <span class="glyphicon glyphicon-remove"></span></div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4" v-for="item in moneyEmps">
                        <button :data-emp_no="item.emp_no" class="btn btn-default btn-lg"
                                @click="checkMoneyEmps($event)">{{item.name}}({{item.account}})
                        </button>
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


    //司机model框
    <div class="model">
        <div class="center">
            <div class="title">选择员工 <span class="glyphicon glyphicon-remove"></span></div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4" v-for="item in driveEmps">
                        <button :data-emp_no="item.emp_no" class="btn btn-default btn-lg"
                                @click="checkDriveEmps($event)">{{item.name}}({{item.account}})
                        </button>
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

    //搬用工model框
    <div class="model">
        <div class="center">
            <div class="title">选择员工 <span class="glyphicon glyphicon-remove"></span></div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4" v-for="item in moveEmps">
                        <button :data-emp_no="item.emp_no" class="btn btn-default btn-lg"
                                @click="checkMoveEmps($event)">{{item.name}}({{item.account}})
                        </button>
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


    //空调工model框
    <div class="model">
        <div class="center">
            <div class="title">选择员工 <span class="glyphicon glyphicon-remove"></span></div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4" v-for="item in airEmps">
                        <button :data-emp_no="item.emp_no" class="btn btn-default btn-lg"
                                @click="checkAirEmps($event)">{{item.name}}({{item.account}})
                        </button>
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


</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/orderUpdate.js"></script>
</body>
</html>
