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
        <span class="glyphicon glyphicon-home"
              onclick="javaScript:window.location.href='/wx/login/toHome?userKey='+myCache.userKey"></span>
    </div>
</header>
<div class="container-fluid" id="main">
    <table class="table" id="table" data_id="<%=request.getParameter("id")%>">
        <input type="hidden" name="status" id="status" v-model="order.status">
        <tr class="row">
            <th class="col-sm-3">订单编号:</th>
            <td class="col-sm-9" style="color: #1e9fff">
                <input type="text" class="form-control" name="order_no" disabled id="order_no" v-model="order.order_no">
            </td>
        </tr>
        <tr class="row">
            <th class="col-sm-3">客户名称:</th>
            <td class="col-sm-9">
                <input type="text" class="form-control" name="name" id="name" v-model="order.name">
            </td>
        </tr>
        <tr class="row">
            <th class="col-sm-3">客户电话:</th>
            <td class="col-sm-9">
                <input type="number" class="form-control" name="phone" id="phone" v-model="order.phone">
            </td>
        </tr>
        <tr class="row">
            <th class="col-sm-3">搬出地址:</th>
            <td class="col-sm-9">
                <input type="text" class="form-control" name="start" id="start" v-model="order.start">
            </td>
        </tr>
        <tr class="row">
            <th class="col-sm-3">搬入地址:</th>
            <td class="col-sm-9">
                <input type="text" class="form-control" name="end" id="end" v-model="order.end">
            </td>
        </tr>
        <tr class="row">
            <th class="col-sm-3">客户备注:</th>
            <td class="col-sm-9">
                <input type="text" class="form-control" name="remark" id="remark" v-model="order.content"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">预估起价:</th>
            <td class="col-sm-9">
                <input type="text" class="form-control" name="price" id="price" v-model="order.price"></td>

        </tr>
        <tr class="row">
            <th class="col-sm-3">预约时间:</th>
            <td class="col-sm-9">
                <input type="text" class="form-control" name="beginTime" id="beginTime"
                       :value="formatDateTime(order.beginTime)">
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
