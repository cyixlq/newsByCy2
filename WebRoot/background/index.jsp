<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理员后台</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
<%if(session.getAttribute("isLogin")==null){ 
	response.sendRedirect("../manager_login.jsp");
} %>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand"><span>管理员</span>后台</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>你好,${sessionScope.isLogin.managername}！<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
							<li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
							<li><a href="signout_ManagerAction"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li class="parent">
				<a>
					<span class="glyphicon glyphicon-list"></span> 管理员管理 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> 
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li>
						<a class="" href="findall_ManagerAction" target="cymain">
							<span class="glyphicon glyphicon-share-alt"></span> 管理员列表
						</a>
					</li>
					<li>
						<a class="" href="background/Manager_edit.jsp" target="cymain">
							<span class="glyphicon glyphicon-share-alt"></span> 添加管理员
						</a>
					</li>
				</ul>
			</li>
			<li class="parent">
				<a>
					<span class="glyphicon glyphicon-list"></span> 栏目管理 <span data-toggle="collapse" href="#sub-item-2" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> 
				</a>
				<ul class="children collapse" id="sub-item-2">
					<li>
						<a class="" href="findall_CatalogAction" target="cymain">
							<span class="glyphicon glyphicon-share-alt"></span> 栏目列表
						</a>
					</li>
					<li>
						<a class="" href="background/Catalog_edit.jsp" target="cymain">
							<span class="glyphicon glyphicon-share-alt"></span> 添加栏目
						</a>
					</li>
				</ul>
			</li>
			<li class="parent">
				<a>
					<span class="glyphicon glyphicon-list"></span> 文章管理 <span data-toggle="collapse" href="#sub-item-3" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-3">
					<li>
						<a class="" href="findall_ArticleAction" target="cymain">
							<span class="glyphicon glyphicon-share-alt"></span> 文章列表
						</a>
					</li>
					<li>
						<a class="" href="findbyid_ArticleAction" target="cymain">
							<span class="glyphicon glyphicon-share-alt"></span> 添加文章
						</a>
					</li>
				</ul>
			</li>
			<li class="parent">
				<a>
					<span class="glyphicon glyphicon-list"></span> 图片管理(已废弃) <span data-toggle="collapse" href="#sub-item-4" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-4">
					<li>
						<a target="cymain">
							<span class="glyphicon glyphicon-share-alt"></span> 图片列表
						</a>
					</li>
					<li>
						<a target="cymain">
							<span class="glyphicon glyphicon-share-alt"></span> 添加图片
						</a>
					</li>
				</ul>
			</li>
			<li><a ><span class="glyphicon glyphicon-dashboard"></span> 建设中</a></li>
			<li><a ><span class="glyphicon glyphicon-th"></span> 建设中</a></li>
			<li><a ><span class="glyphicon glyphicon-stats"></span> 建设中</a></li>
			<li><a ><span class="glyphicon glyphicon-list-alt"></span> 建设中</a></li>
			<li><a ><span class="glyphicon glyphicon-pencil"></span> 建设中</a></li>
			<li role="presentation" class="divider"></li>
		</ul>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main" style="height: 800px;">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">管理员页面</li>
			</ol>
		</div><!--/.row-->
		<iframe width="100%" height="100%" frameborder="0" name="cymain"></iframe>
	</div>	<!--/.main-->

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		$('#calendar').datepicker({
		});

		!function ($) {
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
		        $(this).find('em:first').toggleClass("glyphicon-minus");      
		    }); 
		    $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>

</html>
