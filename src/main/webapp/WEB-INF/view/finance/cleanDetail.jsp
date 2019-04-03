<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/4/2
  Time: 17:25
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/orderView.css">
</head>
<body>
<div class="main" id="main" data-id="<%=request.getParameter("id")%>">
    <div class="order-info">
        <table>
            <tr>
                <td align="right">结算方式:</td>
                <td><select v-model="cleanStyle"></select></td>
            </tr>
            <tr>
                <td align="right">预估报价：</td>
                <td><input type="text" disabled v-model="order.price" /></td>
            </tr>
            <tr>
                <td align="right">实际收款：</td>
                <td><input type="text" disabled v-model="order.receiveMoney" /></td>
            </tr>
            <tr>
                <td align="right">支出费用：</td>
                <td><input type="text" v-model="order.costMoney" /></td>
            </tr>
            <tr>
                <td align="right">支出备注：</td>
                <td><textarea  type="text" disabled v-model="order.costText" ></textarea></td>
            </tr>
            <tr>
                <td align="right">收款备注：</td>
                <td><textarea type="text" disabled v-model="order.receiveText" ></textarea></td>
            </tr>
            <tr>
                <td align="right">收款人员：</td>
                <td><input type="text" @click="chooseEmp('money')" v-model="money">
                <input type="button" @click="chooseEmp('money')" value="修改员工">
                </td>
            </tr>
            <tr>
                <td align="right">随车司机：</td>
                <td><input type="text" @click="chooseEmp('drive')" v-model="drive">
                    <input type="button" @click="chooseEmp('drive')" value="修改员工">
                </td>
            </tr>
            <tr>
                <td align="right">随车搬运工：</td>
                <td><input type="text" @click="chooseEmp('move')"  v-model="move">
                    <input type="button" @click="chooseEmp('move')" value="修改员工">
                </td>
            </tr>
            <tr>
                <td align="right">随车空调工：</td>
                <td><input type="text" @click="chooseEmp('air')" v-model="air">
                    <input type="button" @click="chooseEmp('air')" value="修改员工">
                </td>
            </tr>
        </table>


        <p v-if="order.driveEmps" v-show="false">
            <label class="order-item">司机：<span style="margin-right: 10px" v-for="item in order.driveEmps">{{item.emp_name}}&nbsp;</span></label>
        </p>
        <p v-if="order.moveEmps" v-show="false">
            <label class="order-item">搬运工：<span style="margin-right: 10px" v-for="item in order.moveEmps">{{item.emp_name}}&nbsp;</span></label>
        </p>
        <p v-if="order.airEmps" v-show="false">
            <label class="order-item">空调工：<span style="margin-right: 10px" v-for="item in order.airEmps">{{item.emp_name}}&nbsp;</span></label>
        </p>
        <p v-if="order.moneyEmps" v-show="false">
            <label class="order-item">收款人：<span style="margin-right: 10px" v-for="item in order.moneyEmps">{{item.emp_name}}</span></label>
        </p>

    </div>

    <div class="order-info">
        <table>

            <tr>
                <td align="right">预估报价：</td>
                <td><input type="text" disabled v-model="order.price" /></td>
            </tr>
            <tr>
                <td align="right">实际收款：</td>
                <td><input type="text" disabled v-model="order.receiveMoney" /></td>
            </tr>
            <tr>
                <td align="right">支出费用：</td>
                <td><input type="text" v-model="order.costMoney" /></td>
            </tr>
            <tr>
                <td align="right">支出备注：</td>
                <td><textarea  type="text"  v-model="order.costText" ></textarea></td>
            </tr>
            <tr>
                <td align="right">收款备注：</td>
                <td><textarea type="text" disabled v-model="order.receiveText" ></textarea></td>
            </tr>
            <tr>
                <td align="right">收款人员：</td>
                <td><input type="text"  v-model="money">

                </td>
            </tr>
            <tr>
                <td align="right">随车司机：</td>
                <td>{{order.driveEmps}}:<input type="text"  v-model="drive">

                </td>
            </tr>
            <tr>
                <td align="right">随车搬运工：</td>
                <td>{{order.moveEmps}}:<input type="text" @click="chooseEmp('move')"  v-model="move">

                </td>
            </tr>
            <tr>
                <td align="right">随车空调工：</td>
                <td>{{order.airEmps}}:<input type="text" @click="chooseEmp('air')" v-model="air">

                </td>
            </tr>
        </table>



    </div>


    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/finance/cleanDetail.js"></script>
</div>
</body>
</html>

