<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>文章内容</title>
    <meta name="keywords" content="" />
		<meta name="description" content="" />
		<link href="css/base.css" rel="stylesheet">
		<link href="css/index.css" rel="stylesheet">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
		<script src="js/modernizr.js"></script>
		<![endif]-->
	</head>
	<body>
	<header>
		<div class="topnews">
			<h2>
				<a href="index.jsp"><b>返回</b>首页</a>
			</h2>
		</div>
		<div class="container-fluid">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p class="panel-title">
						${requestScope.article.artitle }
					</p>
				</div>
				<div class="panel-body">
			    	${requestScope.article.arcontent }
			    </div>
			    <div class="panel-footer">
			    	作者:${requestScope.article.aruser }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间:${requestScope.article.artime}
			    </div>
			</div>
		</div>
		<footer>
			<p class="ft-copyright">
				Cy新闻网 Design by Cy 蜀ICP备11002373号-1
			</p>
		</footer>
	</body>
</html>
