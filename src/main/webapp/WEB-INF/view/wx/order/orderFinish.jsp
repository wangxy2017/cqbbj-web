<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/19
  Time: 15:24
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/orderFinish.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>辅助完成</p>
</header>
<div class="container-fluid" id="main" data_id="<%=request.getParameter("id")%>"
     data_no="<%=request.getParameter("order_no")%>">
    <div class="form-group">
        <div class="row">
            <label class="col-sm-3 control-label">订单编号:</label>
            <div class="col-sm-9">
                <input class="form-control" disabled v-model="order_no">
            </div>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label">实际收款:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" v-model="receiveMoney">
            </div>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label">收款备注:</label>
            <div class="col-sm-9">
                <textarea class="form-control" v-model="receiveText" rows="6"> </textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="checkbox">
                    <label id="checkBox">
                        是否收款： <input type="checkbox" value="1" v-model="isNotPay" name="isNotPay"><span style="color:gray">暂不收款</span>
                    </label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <button type="button" @click="submit" class="btn btn-success btn-lg">确认</button>
            </div>
            <div class="col-sm-6">
                <button type="button" class="btn btn-info btn-lg" onclick="javaScript:window.history.back()">取消
                </button>
            </div>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/orderFinish.js"></script>
</body>
</html>
