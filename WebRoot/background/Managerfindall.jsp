<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@page import="com.cy.bean.Manager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>全部管理员</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/bootstrap-table.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
  </head>
  <body>
  	<h2>管理员列表</h2>
	<table class="table table-hover">
		<thead>
		<tr>
			<th>ID</th>
			<th>昵称</th>
			<th>密码</th>
			<th>状态</th>
			<th colspan="2">操作</th>
		</tr>
		</thead>
		<c:forEach items="${requestScope.list}" var="manager">
			<tr>
				<td>${manager.managerid}</td>
				<td>${manager.managername}</td>
				<td>${manager.passwd}</td>
				<c:choose>
					<c:when test="${manager.mstate==1}">
						<td>可用</td>
					</c:when>
					<c:otherwise>
						<td>不可用</td>
					</c:otherwise>
				</c:choose>
				<td>
					<a href="findbyid_ManagerAction?manager.managerid=${manager.managerid}">修改</a>
				</td>
				<td>
					<a href="deletebyid_ManagerAction?manager.managerid=${manager.managerid}">删除</a>
				</td>
		</tr>
		</c:forEach>
	</table>
  </body>
</html>
