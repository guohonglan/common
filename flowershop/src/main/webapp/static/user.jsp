<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="flowershop.pojo.UserInfo,java.util.*,java.io.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%UserInfo currentuser=(UserInfo)session.getAttribute("currentuser");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的信息</title>

    <!-- bootstrap -->
    <link rel="stylesheet" href="assets/vendors/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-3.3.7/bootstrap-datetimepicker.min.css">
    <!-- font awesome -->
    <link rel="stylesheet" href="assets/vendors/font-awesome-4.7.0/css/font-awesome.min.css">
    <!-- other -->
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/user.css">
    <link rel="stylesheet" href="assets/css/openwindow.css">
    <script type="text/javascript" src="assets/vendors/timeselect/jquery.js"></script>
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
                    <div class="loginArea">
                        <li>
                            欢迎
                            <span id="nickname"><%=currentuser.getNickName() %></span>
                        </li>
                    </div>
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
                    <div class="loginArea clearfix" id="mineP">                      
                        <li>
                            <a href="${pageContext.request.contextPath}/cart.action?NickName=<%=currentuser.getNickName()%>" id="cart">购物车</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/myBuy.action" id="mineBuy">我的购买</a>
                        </li>                       
                    </div>
                    <!-- 登录后展示 end -->
                    <!-- 登录前展示 -->
                    <!-- <div class="registerArea clearfix">
                        <li>
                            <a href="register.html">注册</a>
                        </li>
                        <li>
                            <a href="login.html">登录</a>
                        </li>
                    </div> -->
                    <!-- 登录前展示 end -->
                </ul>
            </div>
        </div>
    </div>

    <!-- 搜索区域 -->
    <div class="search-area">
        <!-- logo -->
        <div class="logo-container">
            <img src="assets/img/logo.jpg" alt="logo">
        </div>
    </div>
    <!-- 弹出窗口end -->
    <div class="mui-mbar-tabs">
       <div class="quick_links_wrap"> 
          <div class="quick_link_mian">
             <c:if test="${sessionScope.currentuser==null}">
                <div class="quick_links_panel">
                 <div class="quick_links">
                    <li class="user">
                       <a href="${pageContext.request.contextPath}/redirect.action?flag=login">
                          <img class="imguser" alt="..." src="uploads/avatar.jpg"  class="imguser">                          
                       </a>
                       <div class="no-login">您还未登录哦，点击登录</div>
                    </li>
                  </div>
                </div>
             </c:if>
             <c:if test="${sessionScope.currentuser!=null}">
                <div class="quick_links_panel">
                 <div class="quick_links">
                    <li class="user">
                       <a href="${pageContext.request.contextPath}/redirect.action?flag=user">
                          <c:if test="${sessionScope.currentuser.getPicture()==null}">
                           <img src="uploads/avatar.jpg" alt="avatar"  class="imguser"/>
                          </c:if>
                          <c:if test="${sessionScope.currentuser.getPicture()!=null}">
                             <img src="/Image/User/<%=currentuser.getPicture()%>" alt="avatar"  class="imguser">
                          </c:if>
                          <c:if test="${sessionScope.currentuser.getSex()=='男'}">
                             <i class="fa fa-mars"></i>
                          </c:if>
                          <c:if test="${sessionScope.currentuser.getSex()=='女'}">
                             <i class="fa fa-venus"></i>
                          </c:if>
                       </a>                       
                    </li>
                    <li class="shopcart">
                       <a class="ico_cart" href="${pageContext.request.contextPath}/cart.action?NickName=<%=currentuser.getNickName()%>">
                          <i class="fa fa-shopping-cart fa-lg"></i>
                          <div class="span">购物车</div>
                          <span class="cart_num" id="cart_num">0</span>
                       </a>
                    </li>
                    <li class="mybuy"> 
                       <a class="paper-plane" href="${pageContext.request.contextPath}/myBuy.action">
                          <i class="fa fa-tasks fa-lg"></i>
                          <div class="span">我的订单</div>
                       </a>               
                    </li>
                    <li class="myheart"> 
                       <a class="fa-heart-o" href="${pageContext.request.contextPath}/hearted.action?nickname=<%=currentuser.getNickName()%>">
                          <i class="fa fa-heart fa-lg"></i>
                          <div class="span">收藏</div>
                       </a>
                    </li>
                    <li class="mycomment">                      
                       <a class="fa-commenting" href="${pageContext.request.contextPath}/mycomment.action?nickname=<%=currentuser.getNickName()%>">
                          <i class="fa fa-commenting-o fa-lg"></i>
                          <div class="span">我的评论</div>
                       </a>
                    </li>           
                 </div>
              </div>
             </c:if>            
          </div>
       </div>
    </div>
    
    <!-- 主体区域 -->
    <div class="container">
        <div class="inner">
            <!-- 标题 -->
            <div class="title">
                <p>用 户 信 息</p>
            </div>
            <!-- 内容 -->
            <div class="info">

                <!-- tab -->
                <div class="tab-list">
                    <ul>
                        <li class="now" data-tabId="0">
                            <i class="fa fa-picture-o"></i>
                            用户头像
                        </li>
                        <li data-tabId="1">
                            <i class="fa fa-asterisk"></i>
                            用户信息
                        </li>
                        <li data-tabId="2">
                            <i class="fa fa-key"></i>
                            修改密码
                        </li>
                        <li data-tabid="3">
                            <i class="fa fa-ban"></i>
                            注销账户
                        </li>
                    </ul>
                </div>

                <!-- tab container -->
                <div class="tab-container">

                    <!-- 头像表单 -->
                    <div class="avatar now-tab" data-tabId="0">
                        <form id="ex-avatar" action="${pageContext.request.contextPath}/changuserimage.action" method="post" enctype="multipart/form-data">
                            <div class="inner-avatar">                             
                                <c:if test="${sessionScope.currentuser.getPicture()==null}">
                                    <img src="uploads/avatar.jpg" id="avatar" alt="avatar" name="Picture">
                                </c:if>
                                <c:if test="${sessionScope.currentuser.getPicture()!=null}">
                                    <img src="/Image/User/<%=currentuser.getPicture()%>" id="avatar" alt="avatar" name="Picture">
                                </c:if>
                                
                                <input type="file" name="Picture" id="avatarBtn" onchange="showAvatar(this)" accept=".jpg, .png, .bmp, .jpeg">
                            </div>
                            <p>用户头像 <span style="margin-left:5px;color:red;font-size:10px;">${msgimg}</span></p>
                            <input type="submit" value="确认上传" id="avatar-up" style="display: none">
                        </form>
                    </div>

                    <!-- 用户基础信息表单 -->
                    <div class="base-info" data-tabId="1">
                        <form action="${pageContext.request.contextPath}/changeuserinfo.action" id="ex-baseInfo" method="post">
                            <div class="nick">
                                <span class="text">昵称：</span>
                                <span class="nickname real"><%=currentuser.getNickName()%></span>
                                <div class="ex">
                                    <input type="text" class="ex-nickname" name="NickName" autocomplete="off" value="<%=currentuser.getNickName()%>">
                                </div>
                            </div>
                            <div class="sex">
                                <span class="text">性别：</span>
                                <span class="sex real"><%=currentuser.getSex()%></span>
                                <div class="ex">                                   
                                    <label for="">
                                        <span>男</span>                                       
                                        <input type="radio" name="Sex" value="男" checked="checked">                                                                 
                                    </label>
                                    <label for="">
                                        <span>女</span>
                                        <input type="radio" name="Sex" value="女">
                                    </label>
                                </div>
                            </div>
                            <div class="birth">
                                <span class="text">生日：</span>
                                <span class="birth real"><%=currentuser.getBirthDay()%></span>
                                <div class="ex">
                                    <p id="timeselect">
                                        <select class="sel_year" rel="2000"></select>年
                                        <select class="sel_month" rel="01"></select>月
                                        <select class="sel_day" rel="01"></select>日
                                    </p>
                                    <input type="hidden" id="BirthDay" name="BirthDay" value="2000-01-01">
                                </div>
                            </div>
                            <div class="xinzuo">
                                <span class="text">星座：</span>
                                <span class="xinzuo real"><%=currentuser.getConstellation() %></span>
                            </div>
                            <input type="button" class="exInfo" value="修改信息">
                            <p class="msg">${nmsg}</p>
                            <input id="confirm" class="ex-btn" type="submit" value="确认修改">
                            <input id="miss" class="ex-btn" type="button" value="取消修改">
                        </form>
                    </div>

                    <!-- 用户修改密码 -->
					<div class="password" data-tabId="2">
						<form action="${pageContext.request.contextPath}/changeuserpwd.action" method="post">
							<div class="changeP">
								<div class="changePInner">
									<p>请 输 入 新  密  码</p> 
									<input type="password" id="newPwd" name="pwd1">
									<div class="msg">${pmsg}</div>
									<p>请再次输入新密码</p>
									<input type="password" id="newPwd2" name="pwd2" /> 
									<br/>
									<p class="msg">${msg}</p>
									<input type="submit" value="确认修改" id="confirmCPwd">
								</div>
							</div>
							<!-- <div class="info">
								<span class="error" style="display: none">修改失败</span> 
								<span class="success" style="display: none">修改成功</span>
							</div> -->
						</form>
					</div>
                    <div class="delete" data-tabid="3">
                        <img alt="..." class="cry" src="uploads/cry.jpg">
                        <p>真的要和我分手吗?</p>
                        <br>
                        <span class="deleteuser"><a href="${pageContext.request.contextPath}/deleteuser.action">确定</a></span>
                        <span class="deleteuser"><a href="${pageContext.request.contextPath}/index.action">取消</a></span>
                    </div>
				</div>
            </div>
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

    <script src="assets/vendors/jquery/jquery.min.js"></script>
    <script src="assets/vendors/jquery/JQuery.Form.js"></script>
    <script src="assets/vendors/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script src="assets/vendors/bootstrap-3.3.7/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/vendors/bootstrap-3.3.7/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="assets/vendors/timeselect/birthday.js"></script>
    <script>
    window.onload=function(){
    	var $tabContainer = $('.tab-container > div');
    	var $tablist=$('.tab-list > ul > li');
    	var tabid;
    	if(<%=request.getAttribute("tabid")%>==null)
    	{
    		tabid=0;
    	}
    	else
    	{
    		tabid=<%=request.getAttribute("tabid")%>;   		
    	}
    	for (let index = 0; index < $tabContainer.length; index++) {
			var tar = $(($tabContainer)[index]);
            var list=$(($tablist)[index]);
			if (tar.data('tabid') == tabid) {
				tar.siblings().removeClass('now-tab').end().addClass(
						'now-tab');
				list.siblings().removeClass('now').end().addClass(
				'now');
			}			
		}
    	   	
    }
    </script>
	<script>
	   $(function () {
		  $.ms_DatePicker({
	            YearSelector: ".sel_year",
	            MonthSelector: ".sel_month",
	            DaySelector: ".sel_day"
	      });
		   $.ms_DatePicker();
		   
		   // connect date
		   var selyear=document.querySelectorAll('.sel_year')[0];
		   var selmonth=document.querySelectorAll('.sel_month')[0];
		   var selDay = document.querySelectorAll('.sel_day')[0];   				
		   selyear.onchange=function()
		   {
			   var birth=$('#BirthDay');
			   var year=$('.sel_year').val();
			   var month=$('.sel_month').val();
			   var day=$('.sel_day').val();
			   var birthday=year+"-"+month+"-"+day;				
			   birth.attr("value",birthday);
		   }
		   selmonth.onchange=function()
		   {
			   var birth=$('#BirthDay');
			   var year=$('.sel_year').val();
			   var month=$('.sel_month').val();
			   var day=$('.sel_day').val();
			   var birthday=year+"-"+month+"-"+day;				
			   birth.attr("value",birthday);
		   }
		   selDay.onchange = function() {				
			   var birth=$('#BirthDay');
			   var year=$('.sel_year').val();
			   var month=$('.sel_month').val();
			   var day=$('.sel_day').val();
			   var birthday=year+"-"+month+"-"+day;				
			   birth.attr("value",birthday);
			}
	    });     
	
		function showAvatar(file) {
			var $avatarUp = $('#avatar-up'), 
			  $avatarBtn = $('#avatarBtn');

			if ($avatarBtn[0].files.length) {
				$avatarUp.show();
			}
			if (!file.files || !file.files[0]) {
				return;
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
				document.getElementById('avatar').src = evt.target.result;
				
			}
			reader.readAsDataURL(file.files[0]);			
		}
	</script>

</body>

</html>