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
    <title>栏目更新</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
  	<h2>添加或修改栏目</h2>
  	<form action="edit_CatalogAction" method="post">
    	<div class="form-group">
		    <label for="caname" class="col-sm-2 control-label">栏目名称:</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" value="${requestScope.Catalog.caname }" name="catalog.caname" id="caname" placeholder="请输入新名称"/>
			</div>
		</div>
		<div class="form-group">
			<label for="castate" class="col-sm-2 control-label">状态:</label>
			<div class="col-sm-10">
				<select class="form-control" name="catalog.castate" id="castate">
					<c:choose>
						<c:when test="${requestScope.catalog.castate==0}">
							<option value="1">可用</option>
	    					<option value="0" selected="selected">不可用</option>
						</c:when>
						<c:otherwise>
							<option value="1">可用</option>
							<option value="0">不可用</option>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" value="确定" class="btn btn-primary"/>
				<input type="reset" value="取消" class="btn btn-default"/>
			</div>
		</div>
		<input type="hidden" value="${requestScope.catalog.caid}" name="catalog.caid"/>
    </form>
  </body>
</html>
