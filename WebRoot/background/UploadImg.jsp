<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'filedemo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  
  <body onload="opener.loaction.reload()">
	  <form action="UploadServlet" method="post">
	  	<table>
	  		<tr>
	  			<td colspan="2"><b>上传图片</b></td>
	  		</tr>
	  		<tr>
	  			<td>上传地址
	  				<input type="file" value="${requestScope.images.imname}"/>
	  			</td>
	  			<td>
	  				<input type="submit" value="确认上传"/>
	  				<input type="button" value="取消" onclick="res()"/>
	  				<input type="hidden" value="${requestScope.images.imid}" name="imid"/>
	  				<input type="hidden" value="${requestScope.images.imname}" name="imname"/>
	  				<input type="hidden" value="${requestScope.images.imstate}" name="imstate"/>
	  			</td>
	  		</tr>
	  	</table>
	  	<img alt="这里有张图" src="images/${requestScope.images.imname }" />
	  </form>
  </body>
  <script type="text/javascript">
  	function res(){
  		window.location.href="ImageServlet?type=findbystate";
  	}
  </script>
</html>