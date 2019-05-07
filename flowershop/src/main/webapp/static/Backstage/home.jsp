<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="flowershop.pojo.AdminInfo,java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String id=(String)session.getAttribute("adminid");%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页 </title>

    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/b-common.css"/>
    <link href="assets/vendors/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
  <!-- 头部导航 -->
    <div class="header-nav">
        <div class="header-container">
            <!-- 左部条目 -->
            <div class="l-info">
                <ul class="clearfix">                                                                                                
                    <li>
                        <a href="${pageContext.request.contextPath}/index.action">进入前台</a>
                    </li>
                    <div class="loginArea">
                           <li>
                            欢迎管理员
                             <span id="adminid"><%=id%></span>
                           </li>
                         </div>
                </ul>                
            </div>
            <!-- 右部条目 -->           
        </div>
    </div>

     <!-- 搜索区域 -->
    <div class="search-area">

        <!-- logo -->
        <div class="logo-container">
            <img src="assets/img/logo.jpg" alt="logo">
        </div>
    </div>
    
    <div class="container">
       <!-- 左部条目-功能选择 -->
       <div class="tab-list">
          <span class="title">轮播图管理</span>
             <ul> 
                <li data-tabId="0" style="width:0px;height:0px"></li>                         
                <li data-tabId="1">添加轮播图</li> 
                <li data-tabId="2"><a href="${pageContext.request.contextPath}/getallslideshow.action">删除轮播图</a></li>                          
             </ul>
          <span class="title">花 材 管 理</span> 
             <ul>
                <li data-tabId="3"><a href="${pageContext.request.contextPath}/toadddfm.action?tabid=3">添加花材</a></li>
                <li data-tabId="4"><a href="${pageContext.request.contextPath}/getallfmlist.action?tabid=4">修改花材</a></li>
                <li data-tabId="4"><a href="${pageContext.request.contextPath}/getallfmlist.action?tabid=5">删除花材</a></li>
             </ul>
          <span class="title">鲜 花 管 理</span>        
             <ul>
                <li data-tabId="6"><a href="${pageContext.request.contextPath}/getfmid.action?tabid=6">添加鲜花</a></li>
                <li data-tabId="7"><a href="${pageContext.request.contextPath}/getflowerlist.action?tabid=7">修改鲜花</a></li>
                <li data-tabId="7"><a href="${pageContext.request.contextPath}/getflowerlist.action?tabid=8">删除鲜花</a></li>
             </ul>
       </div>
       <!-- 右部条目-内容 -->
       <div class="tab-container">
           <div class="index now-tab" data-tabId="0">
           
           </div>
           
           <!-- 添加轮播图 -->
           <div class="addslideshow" data-tabId="1">
              <form id="ex-avatar" action="post" enctype="multipart/form-data">
                 <div class="inner-avatar">
                    <p id="tip">点击选择图片</p>
                    <img id="siavatar" class="hidetip" alt="avatar" name="picture" src="">
                    <input type="file" name="picture" id="avatarBtn" onchange="showAvatar(this)" accept=".jpg, .png, .bmp, .jpeg">
                 </div>                          
                 <input type="button" value="确认上传" id="avatar-up" style="display: none">                 
              </form>              
           </div>
           
           <!-- 删除轮播图 -->
           <div class="deleteslideshow" data-tabId="2">
               <div class="inner-deletesi">
                  <ul class="listTitle">
                     <li></li>
                     <li>轮播图</li>             
                  </ul>
                  <form action="${pageContext.request.contextPath}/deleteslideshow.action" method="post">
                     <div id="sipro">
						<c:forEach items="${slidelist}" var="silist" begin="0" step="1">
							<ul class="listpro">
								<li>
								  <label><input type="checkbox" name="sids"class="listCheck" value="${silist.slideId}" /></label>
								</li>
								<li>
								  <img src="${silist.slideImage}" class="imgsi" />
								</li>
							</ul>
						</c:forEach>
				     <input type="submit" value="删除" id="deletesi">
				    </div>      
                  </form>                         
               </div>
           </div>
           
           <!-- 添加花材 -->
           <div class="addfm" data-tabId="3">
              <c:if test="${temp3==0}">
                 <form id="addfmpro" action="${pageContext.request.contextPath}/addfm.action" enctype="multipart/form-data" method="post">
                 <div class="inner-avatar">
                    <div class="fmnamepro">
                       <span>花材名称:</span>
                       <span><input type="text" name="fmname" id="fmname"></span>
                    </div> 
                    <div class="fmimgpro">
                       <span class="flo-le">花材图片:</span>
                       <div class="efm">
                          <input type="file" id="fmimg" name="image" onchange="showfmimg(this)" accept=".jpg, .png, .bmp, .jpeg">
                          <img alt="..." id="fmiavater" src="" class="fmimg">
                       </div>
                    </div>
                    <div class="fmbitimgpro">
                       <span class="flo-le">花材缩略图:</span>
                       <div class="efmb">
                          <input type="file" id="fmbitimg" name="image" onchange="showfmbitimg(this)" accept=".jpg, .png, .bmp, .jpeg">
                          <img alt="..." id="fmbavater" src="" class="fmbitimg">
                       </div>
                    </div>                    
                 </div>                          
                 <input type="submit" value="确认上传" id="fmbtn">                 
              </form>
              </c:if>  
              <c:if test="${temp3==1}">
                 <form id="addfmpro" action="${pageContext.request.contextPath}/suremodifyfm.action" enctype="multipart/form-data" method="post">
                        <div class="inner-avatar">
                    <div class="fmnamepro">
                       <span>花材名称:</span>
                       <span><input type="text" name="fmname" id="fmname" value="${fm.fmName}"></span>
                    </div> 
                    <div class="fmimgpro">
                       <span class="flo-le">花材图片:</span>
                       <div class="efm">
                          <input type="file" id="fmimg" name="image" onchange="showfmimg(this)" accept=".jpg, .png, .bmp, .jpeg">
                          <img alt="..." id="fmiavater" src="${fm.fmImage}" class="fmimg">
                       </div>
                       <input type="hidden" name="orfmimg" value="${fm.fmImage}">
                    </div>
                    <div class="fmbitimgpro">
                       <span class="flo-le">花材缩略图:</span>
                       <div class="efmb">
                          <input type="file" id="fmbitimg" name="image" onchange="showfmbitimg(this)" accept=".jpg, .png, .bmp, .jpeg">
                          <img alt="..." id="fmbavater" src="${fm.fmImageBitmap}" class="fmbitimg">
                       </div>
                       <input type="hidden" name="orfmbitimg" value="${fm.fmImageBitmap}">
                    </div>                    
                 </div>                          
                 <input type="submit" value="确认修改" id="fmbtn">         
                 </form>
              </c:if>              
           </div>
           
           <!-- 修改花材 -->
           <div class="modfm" data-tabId="4">
               <div class="inner-avater">
                   <ul class="title">
                       <li class="fmidtitle">花材编号</li>
                       <li class="fmnametile">花材名称</li>
                       <li class="fmimgtitle">花材图片</li>
                       <li class="fmbitimgtile">花材缩略图</li>
                       <li class="operatetitle">操作</li>
                   </ul>
                   <div class="fmpro">
                          <c:forEach items="${fmlist}" var="fmlist" begin="0" step="1">
                             <ul class="onepro">
                                <li>
                                   <div class="fmid">${fmlist.fmid}</div>
                                </li>
                                <li>
                                    <div class="fmname">${fmlist.fmName}</div>
                                </li>
                                <li>
                                    <div class="fmImage"><img src="${fmlist.fmImage}" alt="..."/></div>
                                </li>
                                <li>
                                    <div class="fmbitImage"><img src="${fmlist.fmImageBitmap}"/></div>
                                </li>
                                <c:if test="${sigal==0}">
                                    <li>
                                       <div class="operate">
                                           <a href="${pageContext.request.contextPath}/modifyfm.action?fmid=${fmlist.fmid}">修改</a>
                                       </div>                                      
                                    </li>
                                </c:if>
                                <c:if test="${sigal==1}">
                                    <li>
                                       <div class="operate">
                                          <a href="${pageContext.request.contextPath}/deletefm.action?fmid=${fmlist.fmid}">删除</a>
                                       </div>                                       
                                    </li>
                                </c:if>
                             </ul>
                          </c:forEach>
                      </div>                
               </div>
           </div>
          
           <!-- 添加鲜花 -->         
           <div class="addflower" data-tabid="6">
             <c:if test="${temp2==0}">
                 <form action="${pageContext.request.contextPath}/addflower.action" method="post" enctype="multipart/form-data">
                 <div class="inner-flower">
                 <div class="fname">
                    <span>鲜花名称:</span>
                    <span><input type="text" class="textpro" name="fname"></span>
                 </div>
                 <div class="fmname">
                    <span class="flo-le">所属花材:&nbsp;</span>
                    <span>
                       <p id="sel">
                        <select class="sel_fmid">
                          <c:forEach items="${fmlist}" var="fmlist">
                                <option value="${fmlist.fmid}">${fmlist.fmName}</option>                           
                          </c:forEach>
                        </select>
                       <input type="hidden" id="hid_fmid" name="fmid" value="">
                      </p>
                    </span>
                 </div>
                 <div class="fsaleprice">
                    <span>鲜花售价:</span>
                    <span><input type="text" class="textpro" name="saleprice"></span>
                 </div>
                 <div class="fmeaning">
                    <span class="flo-le">鲜花花语:&nbsp;</span>

                    <span><textarea class="meaningtxt" name="fmeaning" rows="7" cols="60"></textarea></span>
                 </div>
                 <div class="fimage">
                    <span class="flo-le">鲜花图片:&nbsp;</span>
                    <div class="in-image">
                       <input type="file" name="fimage" accept=".jpg, .png, .bmp, .jpeg" onchange="showfimg(this)">
                       <img alt="..." src="" id="fimg">
                    </div>
                 </div>
                 <input type="submit" id="btn" value="确认上传">
              </div>
              </form>
             </c:if>
             <c:if test="${temp2==1}">
              <form action="${pageContext.request.contextPath}/modifyflower.action" method="post" enctype="multipart/form-data">
                 <div class="inner-flower">
                 <div class="fname">
                    <span>鲜花名称:</span>
                    <span><input type="text" class="textpro" name="fname" value="${finfo.fname}"></span>
                 </div>
                 <div class="fmname">
                    <span class="flo-le">所属花材:&nbsp;</span>
                    <span>
                       <p id="sel">
                        <select class="sel_fmid">
                          <c:forEach items="${fmlist}" var="fmlist">
                                <option value="${fmlist.fmid}" <c:if test="${fmlist.fmid==finfo.fmid}">selected="selected"</c:if>>${fmlist.fmName}</option>                           
                          </c:forEach>
                        </select>
                       <input type="hidden" id="hid_fmid" name="fmid" value="${finfo.fmid}">
                      </p>
                    </span>
                 </div>
                 <div class="fsaleprice">
                    <span>鲜花售价:</span>
                    <span><input type="text" class="textpro" name="saleprice" value="${finfo.salePrice}"></span>
                 </div>
                 <div class="fmeaning">
                    <span class="flo-le">鲜花花语:&nbsp;</span>
                    <span><textarea class="meaningtxt" name="fmeaning" rows="7" cols="60">${finfo.fmeaning}</textarea></span>
                 </div>
                 <div class="fimage">
                    <span class="flo-le">鲜花图片:&nbsp;</span>
                    <div class="in-image">
                       <input type="file" name="fimage" accept=".jpg, .png, .bmp, .jpeg" onchange="showfimg(this)">
                       <img alt="..." src="${finfo.fimage}" id="fimg">
                    </div>
                 </div>
                 <input type="submit" id="btn" value="确认修改">
                 <input type="hidden" name="fid" id="fidinput" value="${finfo.fid}">
                 <input type="hidden" name="fimagepath" value="${finfo.fimage}"/>
                </div>
              </form>
             </c:if>              
           </div>
           
           <div class="updateflower" data-tabid="7">
               <div class="top-op">
                   <ul>
                      <c:forEach items="${fmlist}" var="fmlist">
                         <c:if test="${temp==0}">
                            <li class="top-title"><a class="top-fm" href="${pageContext.request.contextPath}/getflowerlist.action?tabid=7&fmid=${fmlist.fmid}">${fmlist.fmName}</a></li>                                          
                         </c:if>
                         <c:if test="${temp==1}">
                            <li class="top-title"><a class="top-fm" href="${pageContext.request.contextPath}/getflowerlist.action?tabid=8&fmid=${fmlist.fmid}">${fmlist.fmName}</a></li>                                         
                         </c:if>
                      </c:forEach>                     
                   </ul>
               </div>
               <div class="bottom-pro">
                  <div class="ftitle">                   
                      <ul>
                         <li class="fid-t">鲜花编号</li>
                         <li class="fmid-t">花材编号</li>
                         <li class="fname-t">鲜花名称</li>
                         <li class="fm-t">鲜花花语</li>
                         <li class="fsalpri-t">鲜花售价</li>
                         <li class="fimg-t">鲜花图片</li>
                         <li class="fsalquan-t">已售</li>
                         <li>操作</li>
                      </ul>
                  </div>
                  <div class="fpro">
                    <c:forEach items="${flist}" var="flist">
                        <ul class="onefpro">
                          <li>
                             <div class="fidpro">${flist.fid}</div>
                          </li>
                          <li> 
                             <div class="fmidpro">${flist.fmid}</div>
                          </li>
                          <li>
                              <div class="fnamepro">${flist.fname}</div>
                          </li>
                          <li>
                              <div class="fmeanpro">${flist.fmeaning}</div>
                          </li>
                          <li>
                              <div class="fsalepricepro">&yen;${flist.salePrice}</div>
                          </li>
                          <li>
                              <img alt="..." class="fimagepro" src="${flist.fimage}">
                          </li>
                          <li>
                              <div class="fsalquanpro">${flist.saleQuantity}</div>
                          </li>
                          <c:if test="${temp==0}">
                              <li>
                                  <div class="floperate"><a href="${pageContext.request.contextPath}/updateflower.action?fid=${flist.fid}&fmid=${flist.fmid}">修改</a></div>
                              </li>
                          </c:if>
                          <c:if test="${temp==1}">
                               <li>
                                  <div class="floperate"><a href="${pageContext.request.contextPath}/deleteflower.action?fid=${flist.fid}&fmid=${flist.fmid}">删除</a></div>
                               </li>
                          </c:if>                         
                      </ul>
                    </c:forEach>                      
                  </div>
               </div>
           </div>
       </div>
    </div>
    
    <script src="assets/vendors/jquery/jquery.min.js"></script>
    <script src="assets/vendors/jquery/JQuery.Form.js"></script>
    <script src="assets/vendors/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script src="assets/vendors/artTemplate/template-native.js"></script>
   <!--  <script>
    var form=new FormData(document.getElementById("addfmpro"));
    var $btn=$('#fmbtn');
    $btn.on('click', function () {
        $.ajax({
            url: 'http://localhost:8088${pageContext.request.contextPath}/addfm.action',
            type: "post",
            data: {
            	form,
            	fname:$('#fmname').val()
            },
            dataType: "json", 	            
            success: function (data) {	               
                alert(data);
                console.log(data);
            }
        });
    });
    </script> -->
    <script>    
    $(function(){
    	  var sel_fmid=document.querySelectorAll('.sel_fmid')[0];
    	   sel_fmid.onchange=function(){
       	   $('#hid_fmid').attr('value',$('.sel_fmid').val());
          }
    })    
    </script>   
    
    <script>
    window.onload=function(){
    	var $tabContainer = $('.tab-container > div');
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
			var tar = $(($tabContainer)[index])

			if (tar.data('tabid') == tabid) {
				tar.siblings().removeClass('now-tab').end().addClass(
						'now-tab');
			}
		}
    	   	
    }
    </script>
	<script>
		function showAvatar(file) {
			var $avatarUp = $('#avatar-up'), $avatarBtn = $('#avatarBtn');

			if ($avatarBtn[0].files.length) {
				$avatarUp.show();
			}
			/* if (!file.files || !file.files[0]) {
				return;
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
				document.getElementById('siavatar').src = evt.target.result;

			}
			reader.readAsDataURL(file.files[0]); */
			showpicture('siavatar',file);
		}
		
		function showfmimg(file){
			showpicture('fmiavater',file);
		}
		function showfmbitimg(file){
			showpicture('fmbavater',file);
		}
		function showfimg(file){
			showpicture('fimg',file);
		}
		//展示图片
		function showpicture(avater,file){
			if (!file.files || !file.files[0]) {
				return;
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
				document.getElementById(avater).src = evt.target.result;

			}
			reader.readAsDataURL(file.files[0]);
		}

		//tab 选项切换
		var $tabList = $('.tab-list'), $tabContainer = $('.tab-container > div');

		$tabList.on('click', function(e) {

			var $tag = $(e.target);

			/* $tag.siblings().removeClass('now').end().addClass('now');*/

			for (let index = 0; index < $tabContainer.length; index++) {
				var tar = $(($tabContainer)[index])

				if (tar.data('tabid') == $tag.data('tabid')) {
					tar.siblings().removeClass('now-tab').end().addClass(
							'now-tab');
				}
			}
		});
		
		//图片上传
		var $avatarUp = $('#avatar-up');
	    
	    $avatarUp.on('click', function () {

	        $('#ex-avatar').ajaxSubmit({
	            url: 'http://localhost:8088${pageContext.request.contextPath}/addslideshow.action',
	            type: "post",
	            /* data: {
	                picture: $('#avatarBtn').val()
	            },
	            dataType: "text", */	            
	            success: function (data) {	               
	                alert(data);
	                $('#siavatar').attr('src',null);
	                console.log(data);
	            }
	        });
	    });
	    
	    $('.inner-avatar').on('click',function(e){
	    	$('#tip').addClass("hidetip");
	    	$('#siavatar').removeClass('hidetip');
	    })	
	    	     	   
	</script>
	
	
</body>
</html>