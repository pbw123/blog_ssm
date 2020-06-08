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
											href="<%=basePath%>Profile.jsp?userId=${user.id}&email=${user.email}"><i
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
	
	<c:if test="${succMsg!=null }">
		<div class="alert alert-success">${succMsg }</div>
		<c:remove var="succMsg" />
	</c:if>

	<c:if test="${errorMsg!=null}">
		<div class="alert alert-error">${errorMsg }</div>
		<c:remove var="errorMsg" />
	</c:if>

	<div class="container">
		<div class="row">
			
			
			<form action="<%=basePath %>applyMyBlog?userId=${user.id }"
				method="post" role="form" class="form-horizontal"
				name="blog_info_form" id="blog_info_form"
				onsubmit="return isValidate(blog_info_form)">
				
				
                
				<div class="form-group">
					<label for="blog_name"> 博客名称 </label>
					<input class="form-controls" name="blog_name" type="text" value="" id="blog_name">
				</div>

				<div class="form-group">
					<label for="description"> 博客描述 </label>
					<input class="form-controls" name="description" type="text" value="" id="blog_des">					
				</div>

				<div class="form-group">
					<label for="annoucement"> 博客公告 </label>
					<textarea class="form-controls" id="annoucement" name="annoucement" rows="5"></textarea>
				</div>

				<div class="form-group">				
				<button class="btn btn-primary" type="submit" class="">申请</button>
				</div>
				
			</form>

		</div>
	</div>



<jsp:include page="../../frame/Footer.jsp"></jsp:include>

	<script type="text/javascript">
		function isValidate(blog_info_form) {
			var blog_name = blog_info_form.blog_name.value;
			var description = blog_info_form.description.value;
			var annoucement = blog_info_form.annoucement.value;

			if (blog_name == "" || description == "" || annoucement == "") {
				alert("博客名称，博客描述，博客公告为必填项");

				return false;
			}

			return true;
		}
	</script>