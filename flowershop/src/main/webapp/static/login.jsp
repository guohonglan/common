<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="userinfo" class="flowershop.pojo.UserInfo" scope="request"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录 </title>

    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/login.css" />
    <link href="assets/vendors/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>

  <!-- 头部导航 -->
    <div class="header-nav">
        <div class="header-container">
            <!-- 左部条目 -->
            <div class="l-info">
                <ul class="clearfix">
                    <li class="collect">
                        <a href="">
                            <i class="fa fa-star" aria-hidden="true"></i>
                            收藏浪漫花房
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/blogin.action">进入后台</a>                   
                    </li>
                   
                   <!--  <div class="loginArea">
                        <li>
                            欢迎
                            <span id="NickName"></span>
                        </li>
                    </div> -->
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/index.action">首页</a>
                    </li>
                </ul>
            </div>
            <!-- 右部条目 -->
            <div class="r-info">
                <ul class="clearfix">
                    <li>
                        <a href="">联系客服</a>
                    </li>
                    <!-- 登录后展示 -->
                    <!-- <div class="loginArea clearfix" id="mineP">
                        <li>
                            <a href="#" id="exit">退出</a>
                        </li>
                        <li>
                            <a href="cart.jsp" id="cart">购物车</a>
                        </li>
                        <li>
                            <a href="myBuy.jsp" id="mineBuy">我的购买</a>
                        </li>
                    </div> -->
                    <!-- 登录后展示 end -->
                    <!-- 登录前展示 -->
                    <div class="registerArea clearfix">
                        <li>
                            <a href="${pageContext.request.contextPath}/redirect.action?flag=register">注册</a>
                        </li>
                    </div>
                    <!-- 登录前展示 end -->
                </ul>
            </div>
        </div>
    </div>

   <form action="${pageContext.request.contextPath}/tologin.action" method="post">
       <div class="container">
        <div class="content">
            <div class="avatar">
                <img src="uploads/avatar.jpg" alt=""/>
            </div>
            <div class="acount mb-10">
                <label>昵称:</label>
                <input class="nickname" name="NickName" type="text" autocomplete="off"/>
                <span class="msg">${nmsg}</span>
            </div>           
            <div class="password">
                <label>密码:</label>
                <input id="password" name="Password" type="password"/>
                <span class="msg">${pmsg}</span>
            </div>
            <div class="forget">
                <a href="#">忘记密码?</a>
                
            </div>         
            <div class="login">
                <input type="submit" value="登录" id="up" />
            </div>
            <div class="info">
                <span></span>
            </div>
            <div class="info_more">
                <div class="line"></div>
                <span class="txt">更多登录方式</span>
                <div class="line"></div>
            </div>
            <div class="icon">
                <a href="#">
                    <i class="fa fa-qq"></i>
                </a>
                <a href="#">
                    <i class="fa fa-weixin"></i>
                </a>
                <a href="#">
                    <i class="fa fa-github" style="font-size: 40px"></i>
                </a>
            </div>
        </div>
    </div>
   </form>
    
    <hr>

    <!-- 底部部分 -->
    <div class="footer">
        <div class="footer-container">
            <span class="footer-title">/ · 友情链接 · /</span>
            <div class="footer-link">
                <img src="assets/img/link_pic/link_pic_1.png" alt="link_pic">
                <span> / </span>
                <img src="assets/img/link_pic/link_pic_3.jpg" alt="link_pic">
                <span> / </span>
                <img src="assets/img/link_pic/link_pic_4.jpg" alt="link_pic">
                <span> / </span>
                <img src="assets/img/link_pic/link_pic_5.jpg" alt="link_pic">
            </div>
            <span>Copyright© &nbsp;&nbsp;&nbsp; 2017-2027 &nbsp;&nbsp;&nbsp;版权所有&nbsp;&nbsp;严禁复制</span>
        </div>
    </div>
</body>
</html>