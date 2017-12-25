<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"><!--
	<!--自添加-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="陈洋">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/supersized.css">
    <link rel="stylesheet" href="assets/css/style.css">

  </head>
  
  <body>
   	<div class="page-container">
           <h1>Login</h1>
           <form action="login_ManagerAction" method="post">
               <input type="text" name="manager.managername" class="username" placeholder="Username">
               <input type="password" name="manager.passwd" class="password" placeholder="Password">
               <button type="submit">Sign me in</button>
               <div class="error"><span>+</span></div>
           </form>
       </div>
       <!-- Javascript -->
       <script src="assets/js/jquery-1.8.2.min.js"></script>
       <script src="assets/js/supersized.3.2.7.min.js"></script>
       <script src="assets/js/supersized-init.js"></script>
       <script src="assets/js/scripts.js"></script>
  </body>
</html>
