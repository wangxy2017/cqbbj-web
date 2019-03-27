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
    <title>订单详情页</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/orderdetail.css">
</head>
<body>
<form class="form-group" id="main">
    <header>
        <div class="pic">
            <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
        </div>
        <p>订单详情</p>
    </header>
    <table class="table" id="table" data_id="<%=request.getParameter("id")%>">
        <tr>
            <th>订单编号:</th>
            <td style="color: #1e9fff">{{order.order_no}}</td>
        </tr>
        <tr>
            <th>客户类型:</th>
            <td v-if="order.type==0">个人</td>
            <td v-else>公司</td>
        </tr>
        <tr>
            <th>客户名称:</th>
            <td>{{order.name}}</td>
        </tr>
        <tr>
            <th>客户电话:</th>
            <td>{{order.phone}}</td>
        </tr>
        <tr>
            <th>搬出地址:</th>
            <td>{{order.start}}</td>
        </tr>
        <tr>
            <th>搬入地址:</th>
            <td>{{order.end}}</td>
        </tr>
        <tr>
            <th>搬运备注:</th>
            <td>{{order.content}}</td>
        </tr>
        <tr>
            <th>预估起价:</th>
            <td>{{order.price}}</td>
        </tr>
        <tr>
            <th>预约时间:</th>
            <td>{{order.beginTime}}</td>
        </tr>

        <tr v-show="isDispatch">
            <th>收款人:</th>
            <td><span v-for="item in order.moneyEmps">{{item.emp_name}}</span></td>
        </tr>
        <tr v-show="isDispatch">
            <th>司机:</th>
            <td><span v-for="item in order.driveEmps">{{item.emp_name}}</span></td>
        </tr>
        <tr v-show="isDispatch">
            <th>搬运工:</th>
            <td><span v-for="item in order.moveEmps">{{item.emp_name}}</span></td>
        </tr>
        <tr v-show="isDispatch">
            <th>空调工:</th>
            <td><span v-for="item in order.airEmps">{{item.emp_name}}</span></td>
        </tr>
        <tr>
            <th>订单状态:</th>
            <td>
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
</form>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/orderDetail.js"></script>
</body>
</html>
