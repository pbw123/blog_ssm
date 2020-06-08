<%@ page language="java" import="java.util.*" import="cap.bean.*"
	import="cap.dao.impl.*" pageEncoding="UTF-8"%>
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
	

	<div class="container">

		<div class="row">
			<div class="col-lg-8">

				<!-- the actual blog post: title/author/date/content -->
				<c:if test="${artCom!=null }">
				<h2>${artCom.title }</h2>
				<p>
					<i class="icon-user"></i> <a href="myBlogController?userId=${artCom.user.id }">${artCom.user.userName }</a> | <i
						class="icon-calendar"></i>
					${artCom.publishTime}
					| 阅读
					${artCom.count }
					次
				</p>
				<hr>
				<p>${artCom.content }</p>
				</c:if>
				<c:if test="${artCom==null }">
							读取文章内容出错，你可以尝试重新刷新页面哦~
				</c:if>
				
				<hr>

				<!-- the comment box -->

				<div class="well">
					
                     <c:if test="${null != succMsg }">
                     <div class="alert alert-success">${ succMsg}</div>
                     <c:remove var="succMsg"/>
                     </c:if>
                     
                     <c:if test="${null != errorMsg }">
                     <div class="alert alert-success">${ errorMsg}</div>
                     <c:remove var="errorMsg"/>
                     </c:if>
					
					<h4>评论：</h4>

					<form role="form" name="comment"
						action="<%=basePath%>addCom?userId=${user.id }&artId=${artCom.id}"
						method="post" onsubmit="return isValidate(comment)">
						<div class="form-group">
							<textarea class="form-control" rows="3" name="comment_content"></textarea>
						</div>
						<button type="submit" class="btn btn-primary">提交</button>
					</form>
				</div>

				<div class="well">
					<h4>相关文章列表：</h4>
					
					<c:if test="${artCom.article != null}">
					<c:forEach items="${artCom.article}" var="relateArt">
					<ul>
						<li><a
							href="<%=basePath%>ArtCom?artId=${relateArt.id }"
							target="_blank">${relateArt.title }</a></li>
					</ul>
					</c:forEach>
					</c:if>
					
				</div>

				<hr>
				<!-- the comments -->
				<c:if test="${artCom.coms!=null }">
				<c:forEach items="${artCom.coms }" var="cmt">
				<p>
					<i class="icon-user"></i><a
						href="<%=basePath %>user?action=myblog&userId=${cmt.userId } target="_blank">
						${cmt.user.userName }
						<c:if test="${ cmtUser!=null}">
						</c:if>
						</a> | <i class="icon-calendar"></i>
					${cmt.time }
				</p>
				<p>${ cmt.content}</p>

				<hr>
				</c:forEach>
				</c:if>
			</div>

			<div class="col-lg-4">
				<div class="well">
					<h4>所属系统分类</h4>
					<div class="row">
						<div class="col-lg-6">
							<ul class="list-unstyled">
								<c:if test="${artCom!=null }">
								
								<li>${artCom.sCategory.categoryName }</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<!-- /well -->

				<div class="well">
					<h4>所属个人分类</h4>
					<div class="row">
						<div class="col-lg-6">
							<ul class="list-unstyled">
								<c:if test="${artCom!=null&&artCom.category.isDelete==0 }">
								<li>${artCom.category.categoryName}</li>
								
								</c:if>
								
								<c:if test="${artCom==null&&category.isDelete.isDelete==1 }">
								<li>无分类</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<!-- /well -->
			</div>
		</div>

<jsp:include page="../../frame/Footer.jsp"></jsp:include>

		<script type="text/javascript">
			function isValidate(comment) {
				var comment_content = comment.comment_content.value;

				if (comment_content == "") {
					alert("请填写评论内容");

					return false;
				}

				return true;
			}
		</script>