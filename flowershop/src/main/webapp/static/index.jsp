<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="flowershop.pojo.UserInfo,java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%UserInfo currentuser=(UserInfo)session.getAttribute("currentuser");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>

    <!-- bootstrap -->
    <link rel="stylesheet" href="assets/vendors/bootstrap-3.3.7/css/bootstrap.min.css">
    <!-- font awesome -->
    <link rel="stylesheet" href="assets/vendors/font-awesome-4.7.0/css/font-awesome.min.css">
    <!-- other -->
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/index.css">
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
                    <!-- session中存在currentuser则显示这部分 -->
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

    <!-- 商品导航区域 -->
    <nav class="default">
       <div class="container">
          <div class="category">
             <h3 class="category-title">商品导航</h3>
             <div class="droplist">
                <h4>鲜花花材</h4>
                  <ul class="fmlist">              
                  <c:forEach items="${commonvo.getFm()}" var="fmlist" begin="0" end="${commonvo.getFm().size()}" step="1" varStatus="status">
                     <li data-kind="${status.index}">
                     <a href="${pageContext.request.contextPath}/sortingbyfmid.action?id=${fmlist.fmid}">                  
                      ${fmlist.fmName}
                     </a>
                    </li>
                  </c:forEach>
                 </ul>
                <h4>鲜花用途</h4>
                <ul class="fmlist">                               
                   <li>
                     <a href="${pageContext.request.contextPath}/sortingbycondition.action?condition=爱情鲜花">                  
                                                           爱情鲜花
                     </a>
                   </li>
                   <li>
                     <a href="${pageContext.request.contextPath}/sortingbycondition.action?condition=友情鲜花">                  
                                                        友情鲜花
                     </a>
                   </li>
                   <li>
                     <a href="${pageContext.request.contextPath}/sortingbycondition.action?condition=问候长辈">                  
                                                          问候长辈
                     </a>
                   </li>
                   <li>
                     <a href="${pageContext.request.contextPath}/sortingbycondition.action?condition=生日鲜花">                  
                                                          生日鲜花
                     </a>
                   </li>
                   <li>
                     <a href="${pageContext.request.contextPath}/sortingbycondition.action?condition=探病慰问">                  
                                                          探病慰问
                     </a>
                   </li>
                   <li>
                     <a href="${pageContext.request.contextPath}/sortingbycondition.action?condition=哀思鲜花">                  
                                                          哀思鲜花
                     </a>
                   </li>
                   <li>
                     <a href="${pageContext.request.contextPath}/sortingbycondition.action?condition=婚庆鲜花">                  
                                                          婚庆鲜花
                     </a>
                   </li>
                   <li>
                     <a href="${pageContext.request.contextPath}/sortingbycondition.action?condition=道歉鲜花">                  
                                                         道歉鲜花
                     </a>
                   </li>
                 </ul>
                 <h4>鲜花颜色</h4>
                 <ul class="fmlist fm3">
                   <li>
                     <span class="colorcircle white"></span>
                     <a href="${pageContext.request.contextPath}/sortingbycolor.action?color=白色">
                                                    白色
                     </a>
                   </li>
                   <li>
                    <span class="colorcircle yellow"></span>
                     <a href="${pageContext.request.contextPath}/sortingbycolor.action?color=黄色">
                                                     黄色
                     </a>
                   </li>
                   <li>
                     <span class="colorcircle lemonchiffon"></span>
                     <a href="${pageContext.request.contextPath}/sortingbycolor.action?color=香槟色">
                                                     香槟色
                     </a>
                   </li>
                   <li>
                     <span class="colorcircle red"></span>
                     <a href="${pageContext.request.contextPath}/sortingbycolor.action?color=红色">
                                                     红色
                     </a>
                   </li>                  
                   <li>
                     <span class="colorcircle purple"></span>
                     <a href="${pageContext.request.contextPath}/sortingbycolor.action?color=紫色">
                                                     紫色
                     </a>
                   </li>
                   <li>
                     <span class="colorcircle pink"></span>
                     <a href="${pageContext.request.contextPath}/sortingbycolor.action?color=粉红色">
                                                     粉红色
                     </a>
                   </li>
                 </ul>
             </div>
          </div>
       </div>
    </nav>
            
             
    <!-- 轮播图区域 -->
    <div class="pic-around">
        <div id="picAroundInner" class="carousel slide" data-ride="carousel" data-interval="2000">			
			 <!-- 轮播图下方控制的小点点-->
            <ol class="carousel-indicators">
               <c:forEach items="${commonvo.getSlide()}" var="slideshow" begin="0" end="${commonvo.getSlide().size()}" step="1" varStatus="status">
                    <li data-target="#picAroundInner" data-slide-to="${status.index}" class="${status.index eq ''?'':'active'}"></li>
               </c:forEach>
            </ol> 
			<!-- 轮播图 -->
            <div class="carousel-inner" role="listbox">
                <c:forEach items="${commonvo.getSlide()}" var="slideshow" begin="0" end="${commonvo.getSlide().size()}" step="1" varStatus="status">
                   <div class="item ${status.index eq 0?'active':''}">
                       <img src="./${slideshow.slideImage}" alt="..."/>
                   </div>
                </c:forEach>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#picAroundInner" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#picAroundInner" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <!-- 爱情鲜花区域 -->
    <div class="floor f1">
       <div class="hd">
          <span class="hd-title">爱情鲜花</span>
          <span>送给那个让你怦然心动的人</span>
          <span><a class="f1-more" href="${pageContext.request.contextPath}/sortingbycondition.action?pageNo=1&condition=爱情鲜花">更多&gt;&gt;</a></span>
       </div>
       <div class="bd">
          <div class="bd-1">
             <div class="bd-2">
                <img alt="..." src="uploads/love.jpg">
             </div>
             <a class="f1-pic" href="${pageContext.request.contextPath}/sortingbycondition.action?pageNo=1&condition=爱情鲜花">爱情鲜花专区</a>
          </div>
          <ul class="floor-goods">
             <c:forEach items="${commonvo.getF1()}" var="f1">
                <li>
                <a href="${pageContext.request.contextPath}/flowerdetail.action?id=${f1.fid}">
                  <img alt="${f1.fname}" src="${f1.fimage}">
                  <p class="floor-name">鲜花·${f1.fname}</p>
                  <p class="floor-price">&yen;${f1.salePrice}</p>
                </a>
                </li>
             </c:forEach>           
          </ul>
       </div>
    </div>
    
    <!-- 玫瑰区域 -->
    <div class="floor f2">
       <div class="hd">
          <span class="hd-title">玫瑰</span>
          <span>象征着美丽纯洁的爱情</span>
          <span><a class="f1-more" href="${pageContext.request.contextPath}/sortingbyfmid.action?pageNo=1&id=1108">更多&gt;&gt;</a></span>
       </div>
       <div class="bd">
          <div class="bd-1">
             <div class="bd-2">
                <img alt="..." src="uploads/rose.jpg">
             </div>
             <a class="f1-pic" href="${pageContext.request.contextPath}/sortingbyfmid.action?pageNo=1&id=1108">玫瑰专区</a>
          </div>
          <ul class="floor-goods">
             <c:forEach items="${commonvo.getF2()}" var="f2">
                <li>
                <a href="${pageContext.request.contextPath}/flowerdetail.action?id=${f2.fid}">
                  <img alt="${f2.fname}" src="${f2.fimage}">
                  <p class="floor-name">鲜花·${f2.fname}</p>
                  <p class="floor-price">&yen;${f2.salePrice}</p>
                </a>
                </li>
             </c:forEach> 
          </ul>
       </div>
    </div>
    <!-- 黄色鲜花区域 -->
    <div class="floor f3">
       <div class="hd">
          <span class="hd-title">黄色鲜花</span>
          <span>象征太阳般的活力</span>
          <span><a class="f1-more" href="${pageContext.request.contextPath}/sortingbycolor.action?pageNo=1&color=黄色">更多&gt;&gt;</a></span>
       </div>
       <div class="bd">
          <div class="bd-1">
             <div class="bd-2">
                <img alt="..." src="uploads/yellow.jpg">
             </div>
             <a class="f1-pic" href="${pageContext.request.contextPath}/sortingbycolor.action?pageNo=1&color=黄色">黄色鲜花专区</a>
          </div>
          <ul class="floor-goods">
             <c:forEach items="${commonvo.getF3()}" var="f3">
                <li>
                <a href="${pageContext.request.contextPath}/flowerdetail.action?id=${f3.fid}">
                  <img alt="${f3.fname}" src="${f3.fimage}">
                  <p class="floor-name">鲜花·${f3.fname}</p>
                  <p class="floor-price">&yen;${f3.salePrice}</p>
                </a>
                </li>
             </c:forEach> 
          </ul>
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
    <script src="assets/vendors/jquery/jquery.min.js"></script>
    <!-- bootstrap -->
    <script src="assets/vendors/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <!-- header-nav -->
    <!-- <script src="assets/js/header.js"></script> -->
    <!-- search -->
    <!-- <script src="assets/js/search.js"></script> -->
    <!-- artTemplate -->
    <script src="assets/vendors/artTemplate/template-native.js"></script>
    <script id="template-Banner" type="text/template"></script>
    <script src="assets/js/index.js"></script>
    <script type="text/javascript">
      $(function(){
    	  var $list = $(".class-list ul")
    	  var $listRes,
          $classPic = $("#classPicInner .carousel-inner .item");

        $list.children().on("mouseenter", function(e) {
          // 2.获取列表点击项
          if (e.target.tagName == "SPAN") {
            $listRes = $(e.target).parent();
          } else {
            $listRes = $(e.target);
          }

          $listRes = $listRes.data().kind;

          // 1.获取图片项
          for (let index = 0; index < $classPic.length; index++) {
            let $temp = $($classPic[index]);

            if ($temp.data().kindpic == $listRes) {
              $temp.addClass("active");
              $temp.siblings().removeClass("active");
              return;
            }
          }
        });
      })
    </script>
</body>

</html>