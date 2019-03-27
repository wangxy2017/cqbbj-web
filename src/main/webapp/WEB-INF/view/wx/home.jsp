<%--
  Created by IntelliJ IDEA.
  User: liulei
  Date: 2019/3/14
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.3, user-scalable=0" />
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/wx/plugin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.css">

    <title>会员中心</title>
</head>
<body>
<div class="container-fluid">
    <header>
        <br/>
        <div id="pichead"></div>
        <div class="set" style="display: none">
            <a href="javascript:;">
                <img src="${pageContext.request.contextPath}/resources/wx/imge/shezhi.png" alt="">
            </a>
        </div>
        <p><%=request.getParameter("name")%></p>
        <div class="header-bottom">
            <ul>
                <li>
                    <a onclick="wallet()">钱包</a>
                </li>
                <li>
                    <a onclick="myTask()">我的任务</a>
                </li>
            </ul>
            <ul class="ulfen">
                <li>￥5000.00</li>
                <li>50</li>
            </ul>
        </div>
    </header>
    <div id="main">
        <ul>
            <li>
                <a onclick="OrderAdd()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0012.png" alt="">
                    </div>
                    <p>添加订单</p>
                </a>
            </li>
            <li>
                <a onclick="unSentOrder()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0002.png" alt="">
                    </div>
                    <p>未派订单</p>
                </a>
            </li>
            <li>
                <a onclick="sentOrder()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0010.png" alt="">
                    </div>
                    <p>已派订单</p>
                </a>
            </li>

            <li>
                <a onclick="completeOrder()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0014.png" alt="">
                    </div>
                    <p>完成订单</p>
                </a>
            </li>

            <li>
                <a onclick="canceledOrder()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0015.png" alt="">
                    </div>
                    <p>作废订单</p>
                </a>
            </li>

            <li style="display: none">
                <a onclick="orderSearch()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0004.png" alt="">
                    </div>
                    <p>订单查询</p>
                </a>
            </li>
            <li>
                <a onclick="financeClean()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0013.png" alt="">
                    </div>
                    <p>财务结算</p>
                </a>
            </li>
            <li>
                <a onclick="mySalary()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0007.png" alt="">
                    </div>
                    <p>工资统计</p>
                </a>
            </li>
            <li>
                <a onclick="signBill()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0011.png" alt="">
                    </div>
                    <p>签单管理</p>
                </a>
            </li>
            <li>
                <a onclick="payRecord()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0003.png" alt="">
                    </div>
                    <p>支付记录</p>
                </a>
            </li>
            <li>
                <a onclick="loginout()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/wx/imge/0008.png" alt="">
                    </div>
                    <p>退出系统</p>
                </a>
            </li>
        </ul>
    </div>
</div>
<!--<footer></footer>-->
<script src="${pageContext.request.contextPath}/resources/wx/plugin/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/plugin/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/wx/js/home.js"></script>
</body>
</html>
