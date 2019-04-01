<%--
  Created by IntelliJ IDEA.
  User: js3
  Date: 2019/3/24
  Time: 12:45
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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/myTask.css">
    <title>我的任务</title>
</head>
<body>
<header>
    <div class="pull-left col-sm-2">
        <span class="glyphicon glyphicon-menu-left" onclick="javaScript:window.history.back()"></span>
    </div>
    <div class="col-sm-8">
        <p>我的任务</p>
    </div>
    <div class="pull-right col-sm-2">
        <span class="glyphicon glyphicon-home" onclick="javaScript:window.location.href='/wx/login/toHome'"></span>
    </div>
</header>
<div class="container-fluid" id="main">
    <div class="title row">
        <div id="left" class="col-sm-5 border_bottom">
            <p @click="unComplete">未完成</p>
        </div>
        <div class="col-sm-2">
            <div></div>
        </div>
        <div id="right" class="col-sm-5 " data-show="0">
            <p @click="complete">已完成</p>
        </div>
    </div>
    <div class="center">
        <div class="unfinished row">
            <ul class="list-ul">
                <li class="row list-li" @click.stop="open($event)" v-for="order in orders">
                    <div class="zhang">
                    <span v-if="order.status==2"><img src="${pageContext.request.contextPath}/resources/wx/imge/wc.png"
                                                      alt=""></span>
                        <span v-else><img src="${pageContext.request.contextPath}/resources/wx/imge/no.png"
                                          alt=""></span>
                    </div>
                    <div class="row li-title">
                        <div class="col-sm-7">
                            <p>订单号：<a href="javascript:;">{{order.order_no}}</a></p>
                        </div>
                        <div class="col-sm-5">
                            <p class="pull-right">客户姓名：{{order.name}}</p>
                        </div>
                    </div>
                    <div class="col-sm-12 li-content">
                        <p class="toAdd">{{order.start}}</p>
                    </div>
                    <div class="col-sm-12">
                        <p class="formAdd">{{order.end}}</p>
                    </div>
                    <div class="row li-footer">
                        <div class="col-sm-8">
                            <p>{{formatDateTime(order.beginTime)}}</p>
                        </div>
                        <div class="col-sm-4">
                            <p class="pull-right">{{order.price}}￥</p>
                        </div>
                    </div>
                    <div class="row display">
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-danger btn-block" @click.stop="view(order.id)">查看
                            </button>
                        </div>
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-success btn-block"
                                    @click.stop="finish(order.id,order.order_no,$event)">完成
                            </button>
                        </div>
                    </div>
                </li>
                <%--模态框--%>
                <div class="alert_model" @click.stop="end">
                    <div class="alert_body">
                        <input type="hidden" id="checkId" value="">
                        <input type="hidden" id="checkOrderNo" value="">
                        <div class="alert-title">
                            <p>选择付款方式</p>
                            <span @click.stop="hide" class="glyphicon glyphicon-remove"></span>
                        </div>
                        <div class="container-fluid">
                            <div class="modal-text">
                                <div class="row">
                                    <div class="col-sm-3">微信支付</div>
                                    <div class="col-sm-9">
                                        <input type="button" class="btn btn-success btn-block" @click.stop="0" value="微信支付">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">现金支付</div>
                                    <div class="col-sm-9">
                                        <input type="number" @click.stop="2" class="form-control" placeholder="请输入收款金额" onfocus="this.placeholder=''" onblur="this.placeholder='请输入收款金额'">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">暂不收款:</div>
                                    <div class="col-sm-9">
                                        <div class="checkbox" @click.stop="1">
                                            <label id="checkBox">
                                                <input type="checkbox">
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <input type="button" class="btn btn-primary btn-lg btn-block" @click.stop="ascertain"
                                       value="确定">
                            </div>
                            <div class="col-sm-6">
                                <input type="button" class="btn btn-default btn-lg btn-block" value="取消">
                            </div>
                        </div>
                    </div>
                </div>
            </ul>
        </div>
    </div>
</div>
<div class="preloader">
    <div class="loader"></div>
</div>
<div class=" row baseLine">
    <p>---------我是有底线的----------</p>
</div>
<div class="notFind">
    <img src="${pageContext.request.contextPath}/resources/wx/imge/undefind.png" alt="">
    <p>-.-.-.-.-.-暂无数据-.-.-.-.-.-</p>
</div>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/Vue/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/myTask.js"></script>
</body>
</html>