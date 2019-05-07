<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>管理员登录 </title>

    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/b-login.css" />
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
                </ul>
            </div>
            <!-- 右部条目 -->           
        </div>
    </div>

   <form action="${pageContext.request.contextPath}/adminlogin.action" method="post">
       <div class="container">
        <div class="content">          
            <div class="acount mb-10">
                <label>账号:</label>
                <input class="nickname" name="adminid" type="text" autocomplete="off"/>
            </div>           
            <div class="password">
                <label>密码:</label>
                <input id="password" name="password" type="password"/>
            </div>            
            <div class="msg">
            <span style="margin-left:200px;font-size: 10px;color:red;text-align: center">${msg}</span>
            </div>
            <div class="login">
                <input type="submit" value="登录" id="up" />
            </div>
            <div class="info">
                <span>${msg}</span>
            </div>           
        </div>
    </div>
   </form> 
</body>
</html>