<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@page import="com.cy.bean.Manager"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>管理员编辑</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<h2>添加管理员</h2>
		<br/>
		<form action="edit_ManagerAction" method="post" class="form-horizontal">
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">
					用户名:
				</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" value="${requestScope.manager.managername}" name="manager.managername" id="username" />
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">
					密码:
				</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="manager.passwd" value="${requestScope.manager.passwd}" id="password" placeholder="请输入新密码" />
				</div>
			</div>
			<div class="form-group">
				<label for="mstate" class="col-sm-2 control-label">
					状态:
				</label>
				<div class="col-sm-10">
					<select class="form-control" name="manager.mstate" id="mstate">
						<c:choose>
							<c:when test="${requestScope.manager.mstate==0}">
								<option value="1">
									可用
								</option>
								<option value="0" selected="selected">
									不可用
								</option>
							</c:when>
							<c:otherwise>
								<option value="1">
									可用
								</option>
								<option value="0">
									不可用
								</option>
							</c:otherwise>
						</c:choose>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" value="确定" class="btn btn-primary" />
					<input type="reset" value="取消" class="btn btn-default" />
				</div>
			</div>
			<input type="hidden" name="manager.managerid" value="${requestScope.manager.managerid}" />
		</form>
	</body>
</html>
