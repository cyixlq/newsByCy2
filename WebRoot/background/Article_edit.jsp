<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>编辑新闻</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
	<form action="edit_ArticleAction" method="post">
	  <table class="table">
	  	<tr>
		  <td><label for="canumber">所在栏目</label></td>
	  	  <td>
	  		<select id="caid" name="article.catalog.caid" onchange="change()">
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
          </td>
	  	</tr>
	  	<tr>
	  	  <td><label for="arnumber">文章序号</label></td>
	  	  <td><input name="article.arnumber" id="arnumber" value="${requestScope.article.arnumber }"/></td>
	  	</tr>
	  	<tr>
	  	  <td><label for="artitle">文章标题</label></td>
	  	  <td><input name="article.artitle" id="artitle" value="${requestScope.article.artitle }"/></td>
	  	</tr>
	  	<tr>
	  	  <td><label for="container">文章内容</label></td>
	  	  <td>
	  	  	<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
    		<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
	  	  	<textarea id="container" name="article.arcontent">
        		${requestScope.article.arcontent}
    		</textarea>
	  	    <script type="text/javascript" >  
			 	UEDITOR_CONFIG.UEDITOR_HOME_URL = './ueditor/'; //一定要用这句话，否则你需要去ueditor.config.js修改路径的配置信息  
			 	var ue = UE.getEditor('container');
		 	</script>
	  	  </td>
	  	</tr>
	  	<tr>
	  	  <td><label for="aruser">文章作者</label></td>
	  	  <td><input name="article.aruser" id="aruser" value="${requestScope.article.aruser }"/></td>
	  	</tr>
	  	<tr>
	  	  <td><label for="artime">发表时间</label></td>
	  	  <td><input name="article.artime" id="artime" value="${requestScope.article.artime}" type="date"/></td>
	  	</tr>
	  	<tr>
	  	  <td><label>是否可用</label></td>
	  	  <td>
        	<select id="arstate" name="article.arstate">
		  	    <c:choose>
			  	    <c:when test="${requestScope.article.arstate==0}">
		     			<option value="1">可用</option>
		      			<option value="0" selected="selected">不可用</option>
		     		</c:when>
		     		<c:otherwise>
		      			<option  selected="selected"  value="1">可用</option>
		      			<option value="0">不可用</option>
		     		</c:otherwise>
	     		</c:choose>
     		</select>
	  	  </td>
	  	</tr>
	  	<tr>
	  	  <td><input class="btn btn-primary" type="submit" onclick="getContent()" value="提交"/></td>
	  	</tr>
	  </table>
	  <input type="hidden" value="${requestScope.article.arid}" name="article.arid"/>
	</form>
  </body>
</html>
