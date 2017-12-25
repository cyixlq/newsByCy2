<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@page import="com.cy.bean.Catalog"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Catalog_findall.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
  	<h2>栏目列表</h2>
	<table class="table table-hover">
		<thead>
		<tr>
			<th>ID</th>
			<th>栏目名称</th>
			<th>栏目序号</th>
			<th>状态</th>
			<th colspan="2">操作</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list}" var="catalog">
				<tr>
					<td>${catalog.caid}</td>
					<td>${catalog.caname}</td>
					<c:choose>
						<c:when test="${catalog.castate==1}">
							<td>可用</td>
						</c:when>
						<c:otherwise>
							<td>不可用</td>
						</c:otherwise>
					</c:choose>
					<td>
						<a href="findbyid_CatalogAction?catalog.caid=${catalog.caid}">修改</a>
					</td>
					<td>
						<a href="delete_CatalogAction?catalog.caid=${catalog.caid}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
  </body>
</html>
