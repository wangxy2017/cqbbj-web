<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/14
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <title>订单管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/sentOrder.css">
</head>
<body>
<header>
    <div class="pic">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <p>查询结果</p>
</header>
<div class="container-fluid" id="main">
    <form action="" class="form-group">
        <ul class="list-ul">
            <c:forEach items="${list}" varStatus="i" var="item">
            <li class="row list-li"  @click="showBtns($event)">
                <div class="zhang">
                    <img src="${pageContext.request.contextPath}/resources/wx/imge/yp.png" alt="">
                </div>
                <div class="row li-title">
                    <div class="col-sm-7">
                        <p >订单号：<a href="javascript:;" @click.stop="view(item.id)"><span id="order_no">${item.order_no}</span></a></p>
                    </div>
                    <div class="col-sm-5">
                        <p class="pull-right">客户姓名：${item.name}</p>
                    </div>
                </div>
                <div class="col-sm-12 li-content">
                    <p class="toAdd">${item.start}</p>
                </div>
                <div class="col-sm-12">
                    <p class="formAdd">${item.end}</p>
                </div>
                <div class="row li-footer">
                    <div class="col-sm-8">
                        <p>{{formatDateTime(${item.beginTime})}}</p>
                    </div>
                    <div class="col-sm-4">
                        <p class="pull-right">${item.price}￥</p>
                    </div>
                </div>
                <div class="row display">
                    <div class="col-sm-3">
                        <a class="view">
                            <button type="button" @click.stop="view(${item.id})" class="btn btn-primary">查看</button>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a class="sent">
                            <button type="button"  @click.stop="modify(${item.id})" class="btn btn-success">修改</button>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a class="assist">
                            <button type="button"  @click.stop="finish(${item.id},${item.order_no})" class="btn btn-info">辅助</button>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a class="abolish">
                            <button type="button" class="btn btn-default"  @click.stop="cancel(item.id,item.order_no)">取消</button>
                        </a>
                    </div>
                </div>
            </li>
            </c:forEach>
        </ul>
        <div class="loading" style="display: none;">.....我是有底线的....</div>
    </form>
</div>


<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/sentOrder.js"></script>
</body>
</html>
