<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Cy的新闻网站</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link href="css/base.css" rel="stylesheet">
		<link href="css/index.css" rel="stylesheet">
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/sliders.js"></script>
		<!--[if lt IE 9]>
		<script src="js/modernizr.js"></script>
		<![endif]-->
		<!-- 返回顶部调用 begin -->
		<script type="text/javascript" src="js/up/jquery.js"></script>
		<script type="text/javascript" src="js/up/js.js"></script>
		<!-- 返回顶部调用 end-->
		<script type="text/javascript">
			var i=1;
		</script>
	</head>
	<body>
	<header>
		<div class="topnews">
			<h2>
				<span>
					<select id="caid" name="article.catalog.caid" onchange="change()">
		        		<option value="0">文章类别</option>
		        		<c:forEach items="${requestScope.calist}" var="catalog">
		        			<c:choose>
		        				<c:when test="${catalog.caid==requestScope.article.catalog.caid}">
		        					<option value="${catalog.caid }" selected="selected">
		        					${catalog.caname }
		        					</option>
		        				</c:when>
		        				<c:otherwise>
		        					<option value="${catalog.caid }">
		        					${catalog.caname }
		        					</option>
		        				</c:otherwise>
		        			</c:choose>
		        		</c:forEach>
		        	 </select>
				</span>
				<a href="index.jsp"><b>文章</b>首页</a>
			</h2>
			<c:forEach items="${requestScope.arlist}" var="article">
			<div class="blogs">
				<figure>
				<script type="text/javascript">
					document.write("<img src='images/0"+i+".jpg' />");
					i++;
				</script>
				</figure>
				<ul>
					<h3>
						<a href="findbyid_IndexAction?article.arid=${article.arid }">${article.artitle }</a>
					</h3>
					<p>
						${article.arcontent }
					</p>
					<p class="autor">
						<span class="lm f_l"><a>${article.aruser }</a></span>
						<span class="dtime f_l">${article.artime }</span>
						<span class="viewnum f_r">点赞（<a>${article.clicks }</a>）</span>
					</p>
				</ul>
			</div>
			</c:forEach>
		</div>
		</article>
		<div style="text-align:center;width:100%">
			<a href="findall_IndexAction?article.catalog.caid=${requestScope.article.catalog.caid}&nowpage=1">首页</a>&nbsp;&nbsp;
	    	<c:choose>
	    		<c:when test="${requestScope.nowpage<=1}">
	    			上一页 &nbsp;&nbsp;
	    		</c:when>
	    		<c:otherwise>
	    			<a href="findall_IndexAction?article.catalog.caid=${requestScope.article.catalog.caid}&nowpage=${requestScope.nowpage-1}">上一页</a>&nbsp;&nbsp;
	    		</c:otherwise>
	    	</c:choose>
	    	<c:choose>
	    		<c:when test="${requestScope.nowpage>=requestScope.pagecount}">
	    			下一页 &nbsp;&nbsp;
	    		</c:when>
	    		<c:otherwise>
	    			<a href="findall_IndexAction?article.catalog.caid=${requestScope.article.catalog.caid}&nowpage=${requestScope.nowpage+1}">下一页</a>&nbsp;&nbsp;
	    		</c:otherwise>
	    	</c:choose>
	    	<a href="findall_IndexAction?article.catalog.caid=${requestScope.article.catalog.caid}&nowpage=${requestScope.pagecount}">尾页</a>
		</div>
		<input type="hidden" name="isFirst" id="isFirst" value="${requestScope.isFirst }"/>
		<footer>
		<p class="ft-copyright">
			Cy新闻网 Design by Cy 蜀ICP备11002373号-1
		</p>
		</footer>
	</body>
	
<script type="text/javascript">
	window.onload=function(){
		var isFirst=document.getElementById("isFirst").value;
		if(isFirst==""){
			window.location.href="findall_IndexAction";
		}
	}
	function change(){
		var caid=document.getElementById("caid").value;
		window.location.href="findall_IndexAction?article.catalog.caid="+caid;
	}
</script>
</html>
