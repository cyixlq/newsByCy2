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
    
    <title>My JSP 'Images_findall.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	
  </head>
  
  <body>
    <c:if test="${sessionScope.imstate=='1'}">
    	<input type="button" name="添加图片" value="添加图片"  onclick="add()"/>
    </c:if>
    <table class="table">
    	<tr>
	    	<th>序号</th>
	    	<th>图片标题</th>
	    	<th>图片名</th>
	    	<th>上传时间</th>
	    	<th>操作</th>
    	</tr>
    	<c:forEach items="${requestScope.images}" var="image">
    		<tr>
    			<td>${image.imid}</td>
    			<td>${image.imtitle}</td>
    			<td>${image.imname}</td>
    			<td>${image.imdate}</td>
    			<td>
    				<a href="ImageServlet?type=findbyid&imid=${image.imid}">上传</a>
    				<c:if test="${sessionScope.imstate=='1'}">
    					<a href="ImageServlet?type=delete&imid=${image.imid}">删除</a>
    				</c:if>
    			</td>
    		</tr>
    	</c:forEach>
    </table>
  </body>
</html>
