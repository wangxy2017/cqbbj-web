<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/19
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>辅助完成</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/orderFinish.css">
</head>
<body>
<header>
    <div class="pic">
            <img src="${pageContext.request.contextPath}/resources/wx/imge/comeback.png" onclick="javaScript:window.history.back()" alt="">
    </div>
    <p>辅助完成</p>
</header>
<div class="container-fluid" id="main" data_id="<%=request.getParameter("id")%>" data_no="<%=request.getParameter("order_no")%>">
    <form action="" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">订单编号:</label>
            <div class="col-sm-9">
                <input  class="form-control" disabled v-model="order_no">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">实际收款:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" v-model="receiveMoney">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">收款备注:</label>
            <div class="col-sm-9">
                <textarea class="form-control" v-model="receiveText" rows="6"> </textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-6">
                    <button @click="submit" class="btn btn-success btn-lg">确认</button>
                </div>
                <div class="col-sm-6">
                    <button class="btn btn-info btn-lg" onclick="javaScript:window.history.back()">取消</button>
                </div>
            </div>
        </div>
    </form>
</div>


<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/orderFinish.js"></script>
</body>
</html>
