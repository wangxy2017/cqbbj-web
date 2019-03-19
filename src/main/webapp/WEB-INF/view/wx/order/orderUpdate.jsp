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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/orderdetail.css">
</head>
<body>
<form class="form-group" id="main">
    <header>
        <div class="pic">
            <img src="${pageContext.request.contextPath}/resources/wx/imge/comeback.png"
                 onclick="javaScript:window.history.back()" alt="">
        </div>
        <p>订单修改</p>
    </header>
    <table class="table" id="table" data_id="<%=request.getParameter("id")%>">
        <tr>
            <th>订单编号:</th>
            <td style="color: #1e9fff"><input  name="order_no" disabled id="order_no"  v-model="order_no"></td>

        </tr>
        <tr>
            <th>客户名称:</th>
            <td><input name="name" id="name" v-model="order.name"> </td>

        </tr>
        <tr>
            <th>客户电话:</th>
            <td><input name="phone" id="phone" v-model="order.phone"></td>

        </tr>
        <tr>
            <th>搬出地址:</th>
            <td><input name="start" id="start" v-model="order.start"></td>

        </tr>
        <tr>
            <th>搬入地址:</th>
            <td><input name="end" id="end" v-model="order.end"></td>

        </tr>
        <tr>
            <th>客户备注:</th>
            <td><input name="remark" id="remark" v-model="order.remark"></td>

        </tr>
        <tr>
            <th>预估起价:</th>
            <td><input name="price" id="price" v-model="order.price"></td>

        </tr>
        <tr>
            <th>预约时间:</th>
            <td><input name="beginTime" id="beginTime" v-model="order.beginTime"></td>

        </tr>
        <div v-if="order.status == 0">
            <tr>
                <th>订单状态:</th>
                <td>
                    <img src="${pageContext.request.contextPath}/resources/wx/imge/wp.png" alt="">
                </td>
            </tr>
        </div>
        <div v-else-if="order.status == 3">
            <tr>
                <th>订单状态:</th>
                <td>
                    <img src="${pageContext.request.contextPath}/resources/wx/imge/zf.png" alt="">
                </td>
            </tr>
        </div>
        <div v-else>
            <tr >
                <th>收款人:</th>
                <td><span v-for="item in order.moenyEmps">{{item.emp_name}}&nbsp;</span></td>
<button id="addMoneyEmps">添加人员</button>
            </tr>

            <tr>
                <th>司机:</th>
                <td><span v-for="item in order.dirveEmps">{{item.emp_name}} &nbsp;</span></td>
                <button id="addDirveEmps">添加人员</button>
            </tr>
            <tr v-for="item in moveEmps">
                <th>搬运工:</th>
                <td><span v-for="item in order.moveEmps">{{item.emp_name}} &nbsp;</span></td>
                <button id="addMoveEmps">添加人员</button>
            </tr>
            <tr v-for="item in airEmps">
                <th>空调工:</th>
                <td><span v-for="item in order.airEmps">{{item.emp_name}}&nbsp; </span></td>
                <button id="addAoneyEmps">添加人员</button>
            </tr>
            <tr>
                <th>订单状态:</th>
                <td>
                    <img src="${pageContext.request.contextPath}/resources/wx/imge/yp.png" alt="">
                </td>
            </tr>
        </div>
        <tr>
            <td>
                <button id="submit"  @click="submit">提  交</button>

            </td>

        </tr>
    </table>
</form>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/orderUpdate.js"></script>
</body>
</html>
