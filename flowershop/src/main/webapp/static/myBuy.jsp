<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="flowershop.pojo.UserInfo,java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%UserInfo currentuser=(UserInfo)session.getAttribute("currentuser");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的购买 </title>

    <link rel="stylesheet" href="assets/vendors/bootstrap-3.3.7/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/vendors/font-awesome-4.7.0/css/font-awesome.min.css">
    <link href="assets/css/common.css" rel="stylesheet" />
    <link href="assets/css/myBuy.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/openwindow.css">
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
                            <span id="nickname"><%=currentuser.getNickName()%></span>
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
                    <!-- 登录后展示 -->
                    <c:if test="${sessionScope.currentuser!=null}">
                       <div class="loginArea clearfix" id="mineP">                     
                        <li>
                            <a href="${pageContext.request.contextPath}/cart.action?NickName=<%=currentuser.getNickName()%>" id="cart">购物车</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/myBuy.action" id="mineBuy">我的购买</a>
                        </li>                       
                    </div>
                    </c:if>                   
                    <!-- 登录后展示 end -->
                    <!-- 登录前展示 -->
                    <c:if test="${sessionScope.currentuser==null}">
                       <div class="registerArea clearfix">
                       <li>
                            <a href="${pageContext.request.contextPath}/redirect.action?flag=register">注册</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/redirect.action?flag=login">登录</a>
                        </li>
                    </div>
                    </c:if>                    
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

    <!-- 导航部分 -->
    <div class="nav">
        <div class="nav-container"></div>
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

        <!-- 所在的位置 -->
        <div class="path">
            <i class="fa fa-location-arrow"></i>
            <span>所在的位置：</span>
            <a href="${pageContext.request.contextPath}/index.action">首页</a>
            <span> / </span>
            <a class="now-place">我的购买</a>
        </div>

        <!-- 商品列表 -->
        <div class="content-pro">
            <ul class="pro-list">
                <li>商品名称</li>
                <li>操作</li>
                <li>数量</li>
                <li>价格</li>
            </ul>
            <c:forEach items="${orderlist}" var="list">
                  <div class="list" data-orderId="${list.orderId}">
                  <div class="myBuyD">
                    <i class="fa fa-globe"></i>
                    <span>订单编号:</span>
                    <span class="order-id">
                        ${list.orderId}
                    </span>
                    <i class="fa fa-calendar"></i>
                    <span>订单日期:</span>
                    <span class="order-date">
                        ${list.orderDate}
                    </span>
                    <a href="${pageContext.request.contextPath}/detail.action?orderId=${list.orderId}" class="check">
                        <i class="fa fa-eye"></i>
                        查看
                    </a>
                   
                      <c:if test="${list.status=='交易中'}">
                          <a class="confirm-ok" data-id="${list.orderId}" href="${pageContext.request.contextPath}/modifystatus.action?orderId=${list.orderId}">
                            <i class="fa fa-clock-o"></i>
                            确认收货
                          </a>
                      </c:if>
                          
                       <c:if test="${list.status=='已收货'}">
                          <a class="confirm-ok" data-id="${list.orderId}" disable>
                                    <i class="fa fa-check"></i>
                                    交易成功
                                </a>
                       </c:if>
                </div>
                <c:forEach items="${list.orderDetails}" var="details">                   
                    <ul class="list_pro">
                        <li>
                            <img src="${details.fimage}" width="70px" height="70px" />
                        </li>
                        <li>
                            <div class="name-pro">
                                ${details.fname}
                            </div>
                        </li>
                        <li>
                            <div class="price_pro">
                                &yen;
                                ${details.salePrice}
                            </div>
                        </li>
                        <li>
                            <div class="acount_pro">
                                ${details.quantity}
                            </div>
                        </li>
                        <li>
                            <div class="operate-pro">                              
                                    <c:if test="${list.status == '已收货'&&details.isCommented == '未评价'}">
                                        <a class="say-something">
                                          <i class="fa fa-pencil-square-o"></i>
                                        评价
                                        </a>
                                    </c:if>
                                        
                                     <c:if test="${details.isCommented == '已评价'}">
                                          <span class="allready-say-something">
                                                <i class="fa fa-check-circle" aria-hidden="true"></i>
                                                已评价
                                            </span>
                                    </c:if>
                            </div>
                        </li>
                    </ul>     
                    <form action="${pageContext.request.contextPath}/writecomment.action?nickname=<%=currentuser.getNickName()%>&orderId=${list.orderId}&fid=${details.fid}" method="post">
                         <div class="say" style="display: none;">
                        <textarea rows="5" cols="90" id="com" name="comment" placeholder="请写下您的评价哦！"></textarea>
                        <!-- <input type="hidden" name="comment" id="comm" value=""/> -->
                        <input type="submit" class="submit-say" data-id="${details.fid}" value="提交评论">
                      </div>   
                    </form>                                                                     
                </c:forEach>                
            </div>
            </c:forEach>
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
    <script src="assets/js/header.js"></script>
    <script src="assets/vendors/artTemplate/template-native.js"></script>   

    <script>
        $(function () {          
                $('.say-something').on('click', function (e) {
                    $(e.target).parent().parent().parent().next().children().show();
                });   
                var com=$('#com');
                com.onchange=function()
                {
                	var content=com.val();
                	$('#comm').attr("value",content);
                }
        })
    </script>

</body>

</html>