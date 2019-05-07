<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="flowershop.pojo.UserInfo,java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%UserInfo currentuser=(UserInfo)session.getAttribute("currentuser"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>物品详情 </title>

    <!-- bootstrap -->
    <link rel="stylesheet" href="assets/vendors/bootstrap-3.3.7/css/bootstrap.min.css">
    <!-- font awesome -->
    <link rel="stylesheet" href="assets/vendors/font-awesome-4.7.0/css/font-awesome.min.css">
    <!-- other -->
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/recommend.css">
    <link rel="stylesheet" href="assets/css/info.css">
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
        <!-- search area -->
        <div class="search-container">
            <form action="${pageContext.request.contextPath}/sorting.action" method="post">
                <input type="text" name="search" id="searchText">
                <input type="submit" value="搜索区域" id="searchBtn">
            </form>
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
        <div class="path"></div>

        <!-- 信息部分 -->
		<div class="info-container">
			<!-- 信息图片部分 -->
			<div class="info-img" id="IP">
					<div class="main-img">
						<img src="${flist.fimage}" alt="main-img">
					</div>
					<div class="other-img">
						<img class="first active" src="${flist.fimage}" alt="other-img">
						<img src="${flist.fimage}" alt="other-img"> <img
							src="${flist.fimage}" alt="other-img"> <img
							src="${flist.fimage}" alt="other-img">
					</div>				
			</div>
			<!-- 信息文字部分 -->
			<div class="info-text" id="IT">
					<div class="title">
						<span>${flist.fname}</span>
					</div>
					<!-- 文字信息 -->
					<div class="text-other">
						<dl>
							<dt>类别:</dt>
							<dd>${flist.fmName}</dd>
						</dl>
						<dl>
							<dt>编号:</dt>
							<dd>${flist.fid}</dd>
						</dl>
						<dl>
							<dt>花语:</dt>
							<dd>${flist.fmeaning}</dd>
						</dl>
					</div>
					<!-- 价格 -->
					<div class="price">
						<span class="cost">&yen;${flist.salePrice}</span>
					</div>
					<!-- 购买 -->														
					<c:if test="${currentuser.getNickName()!=null}">
					   <a class="buy" href="${pageContext.request.contextPath}/confirmshop.action?fids=${flist.fid}" data-id="${flist.fid}">
						<i class="fa fa-credit-card" aria-hidden="true"></i> 立即购买
					   </a>
                       <a class="cart" href="${pageContext.request.contextPath}/addcart.action?NickName=<%=currentuser.getNickName()%>&fid=${flist.fid}"> 
                       <i class="fa fa-shopping-cart"></i> 加入购物车    
                       </a>
                       <c:if test="${flist.isornotheart!=null}">
                           <a class="hadheart" href="${pageContext.request.contextPath}/deleteheartedIninfo.action?fid=${flist.fid}&heartid=${flist.isornotheart}"> 
                           <i class="fa fa-star"></i> 已收藏    
                           </a> 
                       </c:if>
                       <c:if test="${flist.isornotheart==null}">
                          <a class="heart" href="${pageContext.request.contextPath}/addhearted.action?NickName=<%=currentuser.getNickName()%>&fid=${flist.fid}"> 
                          <i class="fa fa-heart"></i> 收藏    
                          </a> 
                       </c:if>                                     
                    </c:if>
                    <c:if test="${currentuser.getNickName()==null}">
                       <a class="buy" href="${pageContext.request.contextPath}/redirect.action?flag=login">  
                       <i class="fa fa-credit-card" aria-hidden="true"></i> 立即购买  
                       </a>   
                       <a class="cart" href="${pageContext.request.contextPath}/redirect.action?flag=login">  
                       <i class="fa fa-shopping-cart"></i> 加入购物车              
                       </a>   
                       <a class="heart" href="${pageContext.request.contextPath}/redirect.action?flag=login"> 
                       <i class="fa fa-heart"></i> 收藏
                       </a> 
                    </c:if>
			</div>
		</div>

		<!-- 其余信息部分 -->
        <div class="info-other">

            <!-- 站长推荐区域 -->
            <div class="recommend">
                <div class="title">
                    <span>热销推荐</span>
                </div>
				<div class="re-list m-over">
					<c:forEach items="${commonvo.getF2()}" var="topfive" begin="0" end="${commonvo.getF2().size()}" step="1" varStatus="status">
						<div class="re-item">
							<a href="${pageContext.request.contextPath}/flowerdetail.action?id=${topfive.fid}" id="${topfive.fid}"> 
							<img src="${topfive.fimage}" class="img"/>
								<p class="re-title">${topfive.fname}</p>
								<p class="re-price">&yen; ${topfive.salePrice}</p>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			

            <!-- evaluate -->
            <div class="evaluate-container">
                <div id="evaluate">用 户 评 价</div>
                <div class="evaluate">
                    <ul>
                        <c:forEach items="${commonvo.getComment()}" var="clist" begin="0" step="1" end="${commonvo.getComment().size()}" varStatus="status">
                            <li class="evaluate-item" id="${clist.commentId}">
                               <div class="user-base">
                                   <div class="avatar">
                                       <c:if test="${clist.picture==null}">
                                          <img alt="" src="uploads/avatar.jpg">
                                       </c:if>
                                       <c:if test="${clist.picture!=null}">
                                          <img alt="" src="/Image/User/${clist.picture}">
                                       </c:if>
                                   </div>
                               <span class="user-name">${clist.nickName}</span>
                              </div>
                              <div class="evaluate-text ">
                              ${clist.commentContents}
                              </div>
                              <div class="time">
                              <span>${clist.commentDate}</span>
                         </div>
                       </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- <div class="tab-area">
                <div class="tab">
                    <ul class="clearfix">
                        <li class="first active" id="item-info">商品详情</li>
                        <li id="ensure">用户保障</li>
                    </ul>
                </div>
                <div class="tab-container">
                    <div class="item-info now">
                        <img src="assets/img/item_pic/item_show_1_1.jpg" alt="">
                        <img src="assets/img/item_pic/item_show_1_2.jpg" alt="">
                        <img src="assets/img/item_pic/item_show_1_3.jpg" alt="">
                    </div>
                    <div class="ensure ">
                        Hi,this is ensure
                    </div>
                </div>
            </div> -->
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
    <!-- jquery -->
    <script src="assets/vendors/jquery/jquery.min.js "></script>
    <!-- bootstrap -->
    <script src="assets/vendors/bootstrap-3.3.7/js/bootstrap.min.js "></script>
    <!-- artTemplate -->
    <script src="assets/vendors/artTemplate/template-native.js"></script>
</body>

</html>