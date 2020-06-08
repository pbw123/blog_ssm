<%@ page language="java" import="java.util.*" import="cap.bean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="../../frame/Header.jsp"></jsp:include>

<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=basePath%>SysCategoryList">J2EE 博客</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<%=basePath%>SysCategoryList">网站首页</a></li>
				</ul>
				<c:if test="${user!=null && user.isApplied==1}">

					<ul class="nav navbar-nav">
						<li><a
							href="<%=basePath%>myBlogController?userId=${user.id}">我的博客</a></li>
					</ul>

					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">博客管理<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a
									href="<%=basePath%>manage?userId=${user.id}"><i
										class="glyphicon glyphicon-cog"></i> 博文管理</a></li>
								<li class="divider"></li>
								<li><a
									href="<%=basePath%>categoryManage?userId=${user.id}"><i
										class="glyphicon glyphicon-cog"></i> 分类管理</a></li>
								<li class="divider"></li>
								<li><a
									href="<%=basePath%>artCmtMng?userId=${user.id}"><i
										class="glyphicon glyphicon-cog"></i> 评论管理</a></li>
							</ul></li>
					</ul>

				</c:if>
				<c:choose>
					<c:when test="${user==null }">

						<ul class="nav navbar-nav navbar-right">
							<li><a href="<%=basePath%>entryLogin" target="_blank">登录</a></li>
							<li><a href="<%=basePath%>entryRegister" target="_blank">注册</a></li>
						</ul>
					</c:when>
					<c:when test="${user!=null }">

						<div class="pull-right">
							<ul class="nav pull-right">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">欢迎，${user.userName} <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a
											href="<%=basePath%>Profile?userId=${user.id}&email=${user.email}"><i
												class="glyphicon glyphicon-cog"></i> 编辑个人信息</a></li>
										<c:if test="${user.isApplied==1}">

											<li class="divider"></li>
											<li><a
												href="<%=basePath%>selBlog?userId=${user.id}"><i
													class="glyphicon glyphicon-cog"></i> 编辑博客信息</a></li>
										</c:if>
										<li class="divider"></li>
										<li><a href="<%=basePath%>logout"><i
												class="glyphicon glyphicon-off"></i> 登出</a></li>
									</ul></li>
							</ul>
						</div>

					</c:when>
				</c:choose>
			</div>
		</div>
	</nav>
	
    <c:if test="${cg!=null }">
	<div class="container">
	    <c:if test="${errorUpdateMsg!=null }">
		<%-- 提示更新分类失败 --%>
		<div class="container">
			<div class="alert alert-error">${errorUpdateMsg }</div>
		</div>
		<c:remove var="errorUpdateMsg"/>		
	  	</c:if>
		<div class="row col-md-6">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a
						href="<%=basePath%>categoryManage?userId=${user.id}">分类管理</a></li>
					<li class="active">编辑分类</li>
				</ol>
			</div>
			<div class="col-md-12">
			<form class="form-horizontal" name="save_edit_category_form"
				action="<%=basePath %>updCategory?userId=${user.id}&cgId=${cg.id}"
				method="post" onsubmit="return isValidate(save_edit_category_form)">
				<div class="form-group">
					<label for="category_name">分类名：</label> 
					<input class="form-control" id="category_name" name="category_name" value="${cg.categoryName }" type="text">
				</div>
				

				<div class="form-group">
					<button id="add_category_submit" type="submit" class="btn btn-primary">更新</button>
				</div>
			</form>
			</div>
		</div>
		</div>
	
		</c:if>
<jsp:include page="../../frame/Footer.jsp"></jsp:include>

	<script type="text/javascript">
		function isValidate(form) {
			var category_name = form.category_name.value;

			if (category_name == "") {
				alert("请填写分类名！");

				return false;
			}
			return true;
		}
	</script>