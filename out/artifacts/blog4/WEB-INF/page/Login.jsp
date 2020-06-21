<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	
	
    <c:if test="${msg!=null }">	    
    <%-- 登录验证失败提示信息 --%>
    <div class="container">
    <div class="alert alert-error">
    ${msg }
    </div>
    </div>
    <c:remove var="msg"/>
    </c:if>	
	<c:if test="${userIsDeleMsg!=null}">			    
    <%-- 用户被禁用提示信息 --%>
    <div class="container">
    <div class="alert alert-error">
    ${userIsDeleMsg}
    </div></div>
    <c:remove var="userIsDeleMsg"/>
    </c:if>
	<c:if test="${suc!=null}">			    
    <%-- 用户被禁用提示信息 --%>
    <div class="container">
    <div class="alert alert-error">
    ${suc}
    </div></div>
    <c:remove var="userIsDeleMsg"/>
    </c:if>
	<c:if test="${info!=null}">			    
    <%-- 请求登录 --%>
    <div class="container">
    <div class="alert alert-error">
    ${info}
    </div></div>
    <c:remove var="info"/>
    </c:if>
    
    
    
	<div class="container">
		<div class="row col-md-6">
			<form name="login_form" role="form" action="login"
				method="POST" onsubmit="return isValidate(login_form)">
				<fieldset>
					<div id="legend">
						<legend class="caption">登录</legend>
					</div>
					<div class="form-group">
						<label for="username">用户名</label> 
						<input type="text" autocomplete="off"
							   class="form-control " name="username" id="username"
							placeholder="User name">
					</div>
					<div class="form-group">
						<label for="password">密码</label> <input type="password"
							class="form-control" name="password" id="password"
							placeholder="Password">
					</div>
					
					<div class="form-group">
					<button type="submit" class="btn btn-success">登录</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>

<jsp:include page="../../frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
function isValidate(login_form) {
	var username = login_form.username.value;
	var password = login_form.password.value;
	
	if (username == "" || password == "") {
		alert("请填写用户名和密码！");	
		
		return false;
	}
	return true;
}
</script>
