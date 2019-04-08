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
            <li id="li2" @click="manual">手动结算</li>
        </ul>
        <div class="layui-tab-content">
            <div class="order-info layui-form" id="clean1">
                <div class="layui-form-item">
                    <label class="layui-form-label">结算方式:</label>
                    <div class="layui-input-inline">
                        <select id="selectSM" @change="load" v-model="cleanStyle" lay-verify="required">
                            <option value="">请选择</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">订单价格:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="price" required lay-verify="required" placeholder="请输入订单价格"
                               autocomplete="off" class="layui-input" readonly v-model="order.price">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">实际收款:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="receiveMoney" required lay-verify="required" placeholder="请输入实际收款"
                               autocomplete="off" class="layui-input" readonly v-model="order.receiveMoney">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">收款备注:</label>
                    <div class="layui-input-inline">
                        <textarea name="receiveText" placeholder="请输入收款" class="layui-textarea" v-model="order.receiveText" readonly></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">支出费用:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="costMoney" required lay-verify="required" placeholder="请输入支出费用"
                               autocomplete="off" class="layui-input" v-model="order.costMoney">
                    </div>
                </div>
                 <div class="layui-form-item">
                    <label class="layui-form-label">支出备注:</label>
                    <div class="layui-input-inline">
                        <textarea name="costText" placeholder="请输入支出备注" class="layui-textarea" v-model="order.costText"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">收款人员:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="money" required lay-verify="required" placeholder="请选择收款人员"
                               autocomplete="off" class="layui-input" disabled v-model="money">
                    </div>
                    <div class="layui-input-inline">
                        <button type="button" class="layui-btn layui-btn-sm" @click="chooseEmp('money')">修改员工</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">随车司机:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="drive" placeholder="请选择随车司机"
                               autocomplete="off" class="layui-input" disabled v-model="drive">
                    </div>
                    <div class="layui-input-inline">
                        <button type="button" class="layui-btn layui-btn-sm" @click="chooseEmp('drive')">修改员工</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">随车搬运工:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="move" placeholder="请选择随车搬运工"
                               autocomplete="off" class="layui-input" disabled v-model="move">
                    </div>
                    <div class="layui-input-inline">
                        <button type="button" class="layui-btn layui-btn-sm" @click="chooseEmp('move')">修改员工</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">随车空调工:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="air" placeholder="请选择随车空调工"
                               autocomplete="off" class="layui-input" disabled v-model="air">
                    </div>
                    <div class="layui-input-inline">
                        <button type="button" class="layui-btn layui-btn-sm" @click="chooseEmp('air')">修改员工</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="handleClean">立即提交</button>
                        <button type="button" class="layui-btn layui-btn-primary" @click="cancel">取消</button>
                    </div>
                </div>
                <%--<table>--%>
                    <%--<tr>--%>
                    <%--<td rowspan="2" v-for=" item in order.moneyEmps">订单编号：{{order.order_no}}&nbsp;&nbsp;&nbsp;&nbsp;收款人：{{item.emp_name}}</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td align="right">结算方式:</td>--%>
                    <%--<td><select id="selectSM" @change="load" v-model="cleanStyle"></select></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td align="right">预估报价：</td>--%>
                    <%--<td><input type="text" disabled v-model="order.price" /></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td align="right">实际收款：</td>--%>
                        <%--<td><input type="text" disabled v-model="order.receiveMoney"/></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td align="right">支出费用：</td>--%>
                        <%--<td><input type="text" v-model="order.costMoney"/></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td align="right">支出备注：</td>--%>
                        <%--<td><textarea type="text" disabled v-model="order.costText"></textarea></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td align="right">收款备注：</td>--%>
                        <%--<td><textarea type="text" disabled v-model="order.receiveText"></textarea></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td align="right">收款人员：</td>--%>
                        <%--<td><input type="text" @click="chooseEmp('money')" v-model="money">--%>
                            <%--<input type="button" @click="chooseEmp('money')" value="修改员工">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td align="right">随车司机：</td>--%>
                        <%--<td><input type="text" @click="chooseEmp('drive')" v-model="drive">--%>
                            <%--<input type="button" @click="chooseEmp('drive')" value="修改员工">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td align="right">随车搬运工：</td>--%>
                        <%--<td><input type="text" @click="chooseEmp('move')" v-model="move">--%>
                            <%--<input type="button" @click="chooseEmp('move')" value="修改员工">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td align="right">随车空调工：</td>--%>
                        <%--<td><input type="text" @click="chooseEmp('air')" v-model="air">--%>
                            <%--<input type="button" @click="chooseEmp('air')" value="修改员工">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td colspan="2" align="center"><input type="button" @click="submit" value="确认"/>&nbsp;--%>
                            <%--&nbsp;<input type="button" @click="cancel" value="取消"/></td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            </div>
            <div class="order-info" id="clean2">

                <table>
                    <tr>
                        <td rowspan="2" v-for=" item in order.moneyEmps">订单编号：{{order.order_no}}&nbsp;&nbsp;&nbsp;&nbsp;收款人：{{item.emp_name}}</td>
                    </tr>
                    <tr>
                        <td align="right">预估报价：</td>
                        <td><input type="text" disabled v-model="order.price"/></td>
                    </tr>
                    <tr>
                        <td align="right">实际收款：</td>
                        <td><input type="text" disabled v-model="order.receiveMoney"/></td>
                    </tr>
                    <tr>
                        <td align="right">支出费用：</td>
                        <td><input type="text" v-model="order.costMoney"/></td>
                    </tr>
                    <tr>
                        <td align="right">支出备注：</td>
                        <td><textarea type="text" v-model="order.costText"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">收款备注：</td>
                        <td><textarea type="text" disabled v-model="order.receiveText"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2">随车司机：</td>
                    </tr>
                    <tr>
                        <td colspan="2"><span v-for="item in order.driveEmps">{{item.emp_name}}&nbsp;
                </span><input type="text" name="driveEmps"><br/></td>

                    </tr>
                    <tr>
                        <td colspan="2">随车搬运工：</td>
                    </tr>
                    <tr>

                        <td colspan="2"><span v-for="item in order.driveEmps">{{item.emp_name}}&nbsp;
                </span><input type="text" name="moveEmps"> <br/></td>

                    </tr>
                    <tr>
                        <td colspan="2">随车空调工：</td>
                    </tr>
                    <tr>

                        <td colspan="2"><span v-for="item in order.driveEmps">{{item.emp_name}}&nbsp;
                </span><input type="text" name="airEmps"></td>

                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="button" @click="submit" value="确认"/>&nbsp;
                            &nbsp;<input type="button" @click="cancel" value="取消"/></td>
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

