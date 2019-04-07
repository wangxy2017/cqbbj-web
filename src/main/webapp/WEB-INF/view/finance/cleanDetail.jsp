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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/finance/cleanDetail.css">
</head>
<body>
<div class="main" id="main" data-id="<%=request.getParameter("id")%>">
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li id="li1" class="layui-this" @click="auto">自动结算</li>
            <li id="li2"  @click="manual">手动结算</li>
        </ul>
        <div class="layui-tab-content">

            <div class="order-info" id="clean1">
                <table>
                    <tr>
                        <td rowspan="2" v-for=" item in order.moneyEmps">订单编号：{{order.order_no}}&nbsp;&nbsp;&nbsp;&nbsp;收款人：{{item.emp_name}}</td>
                    </tr>
                    <tr>
                        <td align="right">结算方式:</td>
                        <td><select id="selectSM" @change="load" v-model="cleanStyle"></select></td>
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
                    <tr>
                        <td colspan="2" align="center"><input type="button" @click="submit" value="确认"/>&nbsp;
                            &nbsp;<input type="button" @click="cancel" value="取消" /></td>
                    </tr>

                </table>

            </div>

            <div class="order-info" id="clean2">
                <table>
                    <tr>
                        <td rowspan="2" v-for=" item in order.moneyEmps">订单编号：{{order.order_no}}&nbsp;&nbsp;&nbsp;&nbsp;收款人：{{item.emp_name}}</td>
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
                        <td><textarea  type="text"  v-model="order.costText" ></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">收款备注：</td>
                        <td><textarea type="text" disabled v-model="order.receiveText" ></textarea></td>
                    </tr>
                    <tr ><td colspan="2">随车司机：</td></tr>
                    <tr>
                        <td colspan="2" ><span v-for="item in order.driveEmps">{{item.emp_name}}&nbsp;
                </span><input type="text"  name="driveEmps"><br/> </td>

                    </tr>
                    <tr ><td colspan="2">随车搬运工：</td></tr>
                    <tr>

                        <td colspan="2" ><span v-for="item in order.driveEmps">{{item.emp_name}}&nbsp;
                </span><input type="text"  name="moveEmps"> <br/></td>

                    </tr>
                    <tr ><td colspan="2">随车空调工：</td></tr>
                    <tr>

                        <td colspan="2" ><span v-for="item in order.driveEmps">{{item.emp_name}}&nbsp;
                </span><input type="text"  name="airEmps"></td>

                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="button" @click="submit" value="确认"/>&nbsp;
                            &nbsp;<input type="button" @click="cancel" value="取消" /></td>
                    </tr>
                </table>



            </div>

        </div>
    </div>


    <script src="${pageContext.request.contextPath}/resources/plugin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/vue/vue-resource.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/finance/cleanDetail.js"></script>
</div>
</body>
</html>

