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
    <title>搜索 </title>

    <!-- bootstrap -->
    <link rel="stylesheet" href="assets/vendors/bootstrap-3.3.7/css/bootstrap.min.css">
    <!-- font awesome -->
    <link rel="stylesheet" href="assets/vendors/font-awesome-4.7.0/css/font-awesome.min.css">
    <!-- other -->
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/recommend.css">
    <link rel="stylesheet" href="assets/css/sorting.css">
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
                    <!-- 用户登录后显示 -->
					<c:if test="${sessionScope.currentuser!=null}">
						<div class="loginArea">
							<li>欢迎 <span id="nickname"><%=currentuser.getNickName()%></span>
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

    <!-- 主体图片区域 -->
    <div class="class-pic"></div>

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
                       <a href="${pageContext.request.contextPath}/redirect.action?flag=login"><img class="imguser" alt="..." src="uploads/avatar.jpg"  class="imguser">                          
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
        <div class="path" style="padding: 0 30px;">
            <i class="fa fa-location-arrow"></i>
            <span>所在的位置：</span>
            <a href="${pageContext.request.contextPath}/index.action">首页</a>
            <span> / </span>
            <a class="now-place">分类</a>
        </div>

        <!-- 站长推荐区域 -->
        <div class="recommend">
            <div class="title">
                <span>热销推荐</span>
            </div>
            <div class="re-list m-over">
               <c:forEach items="${commonvo.getF2()}" var="topfive" begin="0" end="${commonvo.getF2().size()}" step="1" varStatus="status">
                   <div class="re-item">
                <a href="${pageContext.request.contextPath}/flowerdetail.action?id=${topfive.fid}" id="${topfive.fid}">
                    <img src="${topfive.fimage}" class="img">
                    <p class="re-title">
                        ${topfive.fname}
                    <p class="re-price">
                        &yen;
                        ${topfive.salePrice}
                    </p>
                </a>
            </div>
               </c:forEach>
            </div>
        </div>

        <!-- 内容 -->
        <div class="inner">
            <!-- 分类图片 -->
             <div class="class-pic">   
               <c:if test="${temp==1}">                               
                     <img src="${fmlist.fmImageBitmap}"/>                                                     
               </c:if>                                                              
             </div>

            <!-- 物品列表区域 -->
            <div class="item-list m-over" id="IL">
               <c:forEach items="${commonvo.getF1()}" var="flist" begin="0" end="${commonvo.getF1().size()}" step="1" varStatus="status">
                   <div class="list-item">                    
                    <a href="${pageContext.request.contextPath}/flowerdetail.action?id=${flist.fid}" class="item" id="${flist.fid}">                    
                    <img src="${flist.fimage}" class="img">
                    <p class="title">
                        ${flist.fname}
                    </p>
                    <p class="price">
                        &yen;
                        ${flist.salePrice}
                    </p>
                    <p class="salequantity">
                                                   已售 ${flist.saleQuantity}
                    </p>
                </a>                               
                <c:if test="${currentuser.getNickName()!=null}">
                    <c:if test="${flist.isornotheart==null}">
                       <div class="addheart">
                         <a href="${pageContext.request.contextPath}/addhearted.action?NickName=<%=currentuser.getNickName()%>&fid=${flist.fid}">
                           <i class="fa fa-heart"></i>
                           <span>收藏</span>                           
                         </a>
                       </div>
                    </c:if>
                    <c:if test="${flist.isornotheart!=null}">
                        <div class="hadaddheart">
                         <a href="#">
                           <i class="fa fa-star"></i>
                           <span>已收藏</span>                           
                         </a>
                       </div>
                    </c:if>                                             
                       <div class="addCart" data-id="${flist.fid}">  
                        <a href="${pageContext.request.contextPath}/addcart.action?NickName=<%=currentuser.getNickName()%>&fid=${flist.fid}">
                           <i class="fa fa-shopping-cart"></i>
                           <span>加入购物车</span>
                        </a>   
                       </div>              
                </c:if>
                <c:if test="${currentuser.getNickName()==null}">
                     <div class="addheart">                         
                         <a href="${pageContext.request.contextPath}/redirect.action?flag=login">
                         <i class="fa fa-heart"></i>
                         <span>收藏</span>
                         </a>
                       </div>
                       <div class="addCart" data-id="${flist.fid}">             
                         <a href="${pageContext.request.contextPath}/redirect.action?flag=login"> 
                            <i class="fa fa-shopping-cart"></i>               
                            <span>加入购物车</span>
                         </a>   
                       </div>
                </c:if>                   
                </div>
                </c:forEach>
              </div>    
              <div class="dividepage">
               <!-- sortingbyfmid -->
               <c:if test="${commonvo.getTemp()==1}">
                  <c:if test="${page.isFirstPage==true}"><!-- 是否为首页 -->
		         <button class="dividebtn">首页</button>
		         <button class="dividebtn">上一页</button>
	           </c:if>
	           <c:if test="${page.isFirstPage!=true}">
	           	 <a href="${pageContext.request.contextPath}/sortingbyfmid.action?pageNo=${page.firstPage}&id=${fmid}" class="dividebtn">首页</a>
		         <a href="${pageContext.request.contextPath}/sortingbyfmid.action?pageNo=${page.prePage}&id=${fmid}" class="dividebtn">上一页</a>
	           </c:if>
	           <c:if test="${page.isLastPage==true}"><!-- 是否为尾页 -->
		         <button class="dividebtn">下一页</button>
		         <button class="dividebtn">尾页</button>
	           </c:if>
	           <c:if test="${page.isLastPage!=true}">
		         <a href="${pageContext.request.contextPath}/sortingbyfmid.action?pageNo=${page.nextPage}&id=${fmid}" class="dividebtn">下一页</a>
		         <a href="${pageContext.request.contextPath}/sortingbyfmid.action?pageNo=${page.lastPage}&id=${fmid}" class="dividebtn">尾页</a>
	           </c:if>
               </c:if>
               <!-- sortingbysearch -->
               <c:if test="${commonvo.getTemp()==0}">
                   <c:if test="${page.isFirstPage==true}"><!-- 是否为首页 -->
		             <button class="dividebtn">首页</button>
		             <button class="dividebtn">上一页</button>
	               </c:if>
	           <c:if test="${page.isFirstPage!=true}">
	           	 <a href="${pageContext.request.contextPath}/sorting.action?pageNo=${page.firstPage}&search=${search}" class="dividebtn">首页</a>
		         <a href="${pageContext.request.contextPath}/sorting.action?pageNo=${page.prePage}&search=${search}" class="dividebtn">上一页</a>
	           </c:if>
	           <c:if test="${page.isLastPage==true}"><!-- 是否为尾页 -->
		         <button class="dividebtn">下一页</button>
		         <button class="dividebtn">尾页</button>
	           </c:if>
	           <c:if test="${page.isLastPage!=true}">
		         <a href="${pageContext.request.contextPath}/sorting.action?pageNo=${page.nextPage}&search=${search}" class="dividebtn">下一页</a>
		         <a href="${pageContext.request.contextPath}/sorting.action?pageNo=${page.lastPage}&search=${search}" class="dividebtn">尾页</a>
	           </c:if>
               </c:if>
               <!-- sortingbysuitcondition -->   
               <c:if test="${commonvo.getTemp()==2}">
                   <c:if test="${page.isFirstPage==true}"><!-- 是否为首页 -->
		             <button class="dividebtn">首页</button>
		             <button class="dividebtn">上一页</button>
	               </c:if>
	               <c:if test="${page.isFirstPage!=true}">
	           	     <a href="${pageContext.request.contextPath}/sortingbycondition.action?pageNo=${page.firstPage}&condition=${condition}" class="dividebtn">首页</a>
		             <a href="${pageContext.request.contextPath}/sortingbycondition.action?pageNo=${page.prePage}&condition=${condition}" class="dividebtn">上一页</a>
	               </c:if>
	           <c:if test="${page.isLastPage==true}"><!-- 是否为尾页 -->
		         <button class="dividebtn">下一页</button>
		         <button class="dividebtn">尾页</button>
	           </c:if>
	           <c:if test="${page.isLastPage!=true}">
		         <a href="${pageContext.request.contextPath}/sortingbycondition.action?pageNo=${page.nextPage}&condition=${condition}" class="dividebtn">下一页</a>
		         <a href="${pageContext.request.contextPath}/sortingbycondition.action?pageNo=${page.lastPage}&condition=${condition}" class="dividebtn">尾页</a>
	           </c:if>
               </c:if>   
               <!-- sortingbycolor -->
               <c:if test="${commonvo.getTemp()==3}">
                   <c:if test="${page.isFirstPage==true}"><!-- 是否为首页 -->
		             <button class="dividebtn">首页</button>
		             <button class="dividebtn">上一页</button>
	               </c:if>
	            <c:if test="${page.isFirstPage!=true}">
	           	 <a href="${pageContext.request.contextPath}/sortingbycolor.action?pageNo=${page.firstPage}&color=${color}" class="dividebtn">首页</a>
		         <a href="${pageContext.request.contextPath}/sortingbycolor.action?pageNo=${page.prePage}&color=${color}" class="dividebtn">上一页</a>
	           </c:if>
	           <c:if test="${page.isLastPage==true}"><!-- 是否为尾页 -->
		         <button class="dividebtn">下一页</button>
		         <button class="dividebtn">尾页</button>
	           </c:if>
	           <c:if test="${page.isLastPage!=true}">
		         <a href="${pageContext.request.contextPath}/sortingbycolor.action?pageNo=${page.nextPage}&color=${color}" class="dividebtn">下一页</a>
		         <a href="${pageContext.request.contextPath}/sortingbycolor.action?pageNo=${page.lastPage}&color=${color}" class="dividebtn">尾页</a>
	           </c:if>
               </c:if>         
	           <span>当前：${page.getPageNum()} / ${page.getPages()} 页</span>
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
    <!-- artTemplate -->
    <script src="assets/vendors/artTemplate/template-native.js"></script>   
</body>

</html>