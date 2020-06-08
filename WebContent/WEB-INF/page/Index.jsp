<%@ page language="java" import="java.util.*" import="cap.bean.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
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

	<div class="container">

		<div class="row">
			<div id="blog" class="col-lg-8">
				<h1>
					<a href="#">轻博客——<small>基于JSP,
							Servlet技术构建</small></a>
				</h1>
				<br>
				<c:choose>
					<c:when test="${pageInfo!=null }"><!-- && fn:length(pageInfo)>0 -->
						<c:forEach items="${pageInfo.lists}" var="art">

							<h3>
								<a
									href="<%=basePath%>ArtCom?artId=${art.id }"
									target="_blank">${art.title }</a>
							</h3>
							<p>
								<i class="glyphicon glyphicon-user"></i> <a
									href="<%=basePath%>myBlogController?userId=${art.userId }"
									target="_blank">${art.userName }</a> | <i
									class="glyphicon glyphicon-calendar"></i> ${art.publishTime } |
								阅读 ${art.count } 次
							</p>

							<p>${art.summary }</p>
							<br>
							<a class="btn btn-primary"
								href="<%=basePath%>ArtCom?artId=${art.id }">Read
								More <span class="glyphicon glyphicon-chevron-right"></span>
							</a>
							<hr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<p>还没有写过文章哦，赶紧写吧~</p>

					</c:otherwise>
				</c:choose>
				<!-- pager -->
				<ul class="pager">
					<c:if test="${pageInfo.pageNum > 1}">
						<li class="previous"><a
							href="<%=basePath%>SysCategoryList?pageNum=${pageInfo.pageNum-1}">&larr;
								上一页</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNum < pageInfo.total}">
						<li class="next"><a
							href="<%=basePath%>SysCategoryList?pageNum=${pageInfo.pageNum+1}">下一页
								&rarr;</a></li>
					</c:if>
				</ul>

			</div>

			<div class="col-lg-4">
				<c:if test="${user!=null&&user.isApplied==0}">

					<div class="well" align="center">
						<a class="btn btn-primary" href="<%=basePath%>ApplyBlog.jsp"
							target="_blank">申请个人博客</a>
					</div>

				</c:if>
				<c:if test="user!=null&&user.isApplied==1">

					<div class="well" align="center">
						<a class="btn btn-primary"
							href="<%=basePath%>user?action=myblog&userId=${user.id}">进入我的博客</a>
					</div>

				</c:if>
				<div class="well">
					<h4>搜索站内文章</h4>
					<form name="search_form" action="<%=basePath%>seachArt"
						method="post">
						<div class="input-group">
							<input type="text" class="form-control" name="value"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</form>
				</div>


				<form action="servlet/GetSysCategoryServlet" method="GET">
					<div class="well">
						<h4>网站分类</h4>
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled">
									<c:choose>
										<c:when test="${allSysCategory!=null && fn:length(allSysCategory)>0}">
											<c:forEach items="${allSysCategory }" var="sc">
												<li><a href="#">${sc.categoryName }</a></li>
											</c:forEach>
										</c:when>
										<c:otherwise>
										<li>无分类</li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
					<!-- /well -->
				</form>

				<div class="well">
					<h4>本周活跃博主</h4>
					<div class="row">
						<div class="">
							<ul class="list-unstyled">
							<c:choose>
							<c:when test="${activeUser!=null && fn:length(activeUser)>0}">
							<c:forEach items="${activeUser}" var="u" varStatus="status">
								<li><a
									href="<%=basePath%>myBlogController?userId=${u.user.id}"
									target="_blank"> ${status.index +1}.${u.user.userName } </a></li>								
								</c:forEach>
								</c:when>
								<c:otherwise>
								<li>暂无排名，sorry......</li>
								
								</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
				<!-- /well -->

				<div class="well">
					<h4>博文TOP10</h4>
					<div class="row">
						<div class="">
							<ul class="list-unstyled">
							<c:choose>
							<c:when test="${topTenArticle!=null }">
							<c:forEach items="${topTenArticle }" var="art" varStatus="status">							
								<li><a
									href="<%=basePath%>ArtCom?artId=${art.id }&userId=${art.userId}"
									target="_blank">${status.index +1}. ${art.title }</a></li>								
								</c:forEach>
								</c:when>
								<c:otherwise>
								<li>暂无排名，sorry......</li>							
								</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


<jsp:include page="../../frame/Footer.jsp"></jsp:include>
