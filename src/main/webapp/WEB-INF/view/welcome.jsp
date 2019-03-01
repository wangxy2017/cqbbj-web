<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/25
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的首页</title>
    <script type="text/javascript" src="/resources/plugin/echarts/echarts.min.js"></script>
    <link rel="stylesheet" href="/resources/css/welcome.css">
</head>
<body>
<header>
    <span>系统提示</span>
    <img src="/resources/images/guangbo.png" alt="">
    <marquee direction="scroll" scrollamount="4" scroll="left"> 该出显示棒棒军平台公告该出显示棒棒军平台公告</marquee>
</header>
<div id="main">
    <div class="mainLeft">
        <p>重庆棒棒军有限公司</p>
        <p>系统版本：专业版</p>
        <p>认证信息：<span>未实名认证</span> <input type="button" value="实名认证"></p>
        <p>自助下单链接：<a href="#">www.bangbangjun.me.net</a> <span class="sPan">点击复制</span></p>
    </div>
    <div class="mainCentrt">
        <p>剩余时间:&nbsp;&nbsp;<span>2019</span>年<span>10</span>月<span>16</span>日</p>
        <br/>
        <em><b>365</b>天</em>
        <input type="button" value="续费">
        <p><a href="#">缴费明细</a></p>
    </div>
    <div class="mainRight">
        <p>短信剩余数:&nbsp;&nbsp;<span>0000</span></p>
        <br/>
        <em><b>1000</b>条</em>
        <input type="button" value="立即充值">
        <p><a href="#">充值记录</a></p>
    </div>
</div>
<div class="pic">
    <header>
        <h4>系统使用说明</h4>
        <button>查看帮助文档</button>
    </header>
    <a style="margin-top: 50px " href="javascript:;">第一步：系统设置、短信管理说明</a>
    <a href="javascript:;">第二步：用户管理、微信绑定使用说明</a>
    <a href="javascript:;">第三步：车辆管理说明</a>
    <a href="javascript:;">第四步：订单管理说明</a>
    <a href="javascript:;">第五步：财务管理说明</a>
</div>
<footer>
    <div id="container"></div>
</footer>
<aside>
    <header>
        <h4>微信订单管理</h4>
    </header>
    <div class="weixin">
        <img src="/resources/images/demo.png" alt="">
        <p style="margin-top: 0">第一步关注官方公众号</p>
        <p>随时随地订单管控</p>
        <p>独有的行业订单软件、安全、便捷、高效</p>
    </div>
    <div class="weixin">
        <img src="/resources/images/demo.png" alt="">
        <p style="margin-top: 0">第一步关注官方公众号</p>
        <p>随时随地订单管控</p>
        <p>独有的行业订单软件、安全、便捷、高效</p>
    </div>
</aside>
<script src="/resources/js/welcome.js"></script>
</body>
</html>
