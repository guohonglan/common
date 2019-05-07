<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="flowershop.pojo.UserInfo,java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%UserInfo currentuser=(UserInfo)session.getAttribute("currentuser"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>注册 </title>
	<link rel="stylesheet" href="assets/vendors/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/common.css">
	<link rel="stylesheet" href="assets/css/register.css">
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
					<c:if test="${sessionScope.currentuser!=null}">
					   <div class="loginArea">
						 <li>
						  	欢迎
							<span id="nickname"><%=currentuser.getNickName() %></span>
						  </li>
					   </div>
					</c:if>
					
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
					<div class="loginArea clearfix" id="mineP">
						<!-- <li>
							<a href="#" id="exit">退出</a>
						</li> -->
						<!-- <li>
							<a href="cart.jsp" id="cart">购物车</a>
						</li>
						<li>
							<a href="myBuy.jsp" id="mineBuy">我的购买</a>
						</li> -->
					</div>
					<div class="registerArea clearfix">						
                        <li>
                            <a href="${pageContext.request.contextPath}/redirect.action?flag=login">登录</a>
                        </li>
					</div>
				</ul>
			</div>
		</div>
	</div>

	<!-- 主体区域 -->
	<div class="container register">

		<div class="img-part">
			<img src="assets/img/register-pic.jpg" alt="register-pic">
		</div>

		<div class="content">
			<form action="${pageContext.request.contextPath}/userreister.action" method="post">				
				<div>
					<label>*昵称</label>
					<input name="NickName" class="nickname" type="text"/>					
				</div>
				<div class="msg">${nmsg}</div>
				<div>
					<label>*密码</label>
					<input name="pwd1" class="password" type="password" />
				</div>
				<c:if test="${pmsg!=null}">
				   <div class="msg">${pmsg}</div>
				</c:if>
				<c:if test="${pmsg==null}">
				   <div class="remind">*输入字数超过6位且由数字和字母组成</div>
				</c:if>				
				<div>
					<label>*确认密码</label>
					<input name="pwd2" class="password2" type="password" />
				</div>
				<div class="msg">${msg}</div>
				<br/>
				<input type="submit" class="registerBtn" value="确认注册" />
				<span class="info"></span>
			</form>
		</div>
	</div>
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