<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@page import="com.cy.bean.Article"%>
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
    <title>文章列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h2>文章列表</h2>
<table class="table table-hover">
    <thead>
    <tr>
        <th>序号</th>
        <th>文章标题</th>
        <th>文章内容</th>
        <th>
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
        </th>
       
        <th>创建人</th>
        <th>创建时间</th>
        <th>
        	<select id="state" name="article.arstate" onchange="change()">
        		<c:choose>
        			<c:when test="${requestScope.article.arstate==3}">
        				<option selected="selected" value="3">全部状态</option>
	        			<option value="1">可用</option>
	        			<option value="0">不可用</option>
        			</c:when>
        			<c:when test="${requestScope.article.arstate==1}">
        				<option value="3">全部状态</option>
	        			<option  selected="selected"  value="1">可用</option>
	        			<option value="0">不可用</option>
        			</c:when>
        			<c:when test="${requestScope.article.arstate==0}">
        				<option value="3">全部状态</option>
	        			<option value="1">可用</option>
	        			<option selected="selected"  value="0">不可用</option>
        			</c:when>
        		</c:choose>
        	</select>
        </th>
        <th colspan="2">操作</th>
    </tr>
    </thead>
    <c:forEach items="${requestScope.arlist}" var="article">
    	<tr>
	        <td>${article.arnumber }</td>
	        <td>${article.artitle }</td>
	        <td>${article.arcontent }</td>
	        <td>${article.catalog.caname }</td>
	        <td>${article.aruser }</td>
	        <td>${article.artime }</td>
	        <c:choose>
	        	<c:when test="${article.arstate==0}">
	        		<td>不可用</td>
	        	</c:when>
	        	<c:otherwise>
	        		<td>可用</td>
	        	</c:otherwise>
	        </c:choose>
        <td>
            <a href="findbyid_ArticleAction?article.arid=${article.arid}">编辑</a>
        </td>
        <td>
            <a href="deleteByIb_ArticleAction?article.arid=${article.arid}">删除</a>
        </td>
    </tr>
    </c:forEach>
    <tr>
    	<td colspan="7">
	    	<a href="findall_ArticleAction?article.catalog.caid=${requestScope.article.catalog.caid}&nowpage=1">首页</a>&nbsp;&nbsp;
	    	<c:choose>
	    		<c:when test="${requestScope.nowpage<=1}">
	    			上一页 &nbsp;&nbsp;
	    		</c:when>
	    		<c:otherwise>
	    			<a href="findall_ArticleAction?article.catalog.caid=${requestScope.article.catalog.caid}&nowpage=${requestScope.nowpage-1}">上一页</a>&nbsp;&nbsp;
	    		</c:otherwise>
	    	</c:choose>
	    	<c:choose>
	    		<c:when test="${requestScope.nowpage>=requestScope.pagecount}">
	    			下一页 &nbsp;&nbsp;
	    		</c:when>
	    		<c:otherwise>
	    			<a href="findall_ArticleAction?article.catalog.caid=${requestScope.article.catalog.caid}&nowpage=${requestScope.nowpage+1}">下一页</a>&nbsp;&nbsp;
	    		</c:otherwise>
	    	</c:choose>
	    	<a href="findall_ArticleAction?article.catalog.caid=${requestScope.article.catalog.caid}&nowpage=${requestScope.pagecount}">尾页</a>
	    	&nbsp;&nbsp;
	    	${requestScope.nowpage }/${requestScope.pagecount}
    	</td>
    </tr>
</table>
</body>
<script type="text/javascript">
	function change(){
		var state=document.getElementById("state").value;
		var caid=document.getElementById("caid").value;
		window.location.href="findall_ArticleAction?article.catalog.caid="+caid+"&article.arstate="+state;
	}
</script>
</html>
