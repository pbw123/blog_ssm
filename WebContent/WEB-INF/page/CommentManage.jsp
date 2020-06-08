<%@ page language="java" import="java.util.*" import="cap.bean.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("basePath", basePath);
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
	
  	
	<%-- 删除评论的提示消息 --%>
	<%-- <c:if test="${succDeleMsg!=null }">	
  	<div class="container">
  	<div class="alert alert-success">${succDeleMsg}</div>
  	</div>
  	<c:remove var="succDeleMsg"/>
  	</c:if>
  	<c:if test="${errorDeleMsg!=null }">  	
  	<div class="container">
  	<div class="alert alert-error">${errorDeleMsg }</div>
  	</div>
  	<c:remove var="errorDeleMsg"/>
  	</c:if> --%>
  <%-- 	<c:if test="${user!=null }"> --%>
	
	<div class="container">	
		<div class="well">
			<table class="table">
				<thead>
					<tr>
						<th>评论内容</th>
						<th>评论人</th>
						<th>评论的文章标题</th>

						<th>评论时间</th>
						<th style="width: 50px;">操作</th>
					</tr>
				</thead>
				<tbody>
				
				<c:if test="${articles!=null }">
				<c:forEach items="${articles }" var="art">	
							<c:forEach items="${art.coms }" var="com">
							<tr>
				       <td> ${com.content} </td>
						<td>${com.user.userName}</td>
						<td>${art.title}</td>
						<td>${com.time}</td>
						<td><a href="<%=basePath%>deleteComment?cmtId=${com.id}&userId=${user.id}" >
						<i class="glyphicon glyphicon-remove"></i></a></td>
						
					</tr>
							</c:forEach>
										
		      		</c:forEach>
		      		</c:if>
				</tbody>
			</table>
		</div>
		
		
		<div>
		 <!-- pager -->
          <ul class="pager">
            <c:if test="${curPage>1 }">         	
            <li class="previous"><a href="<%=basePath%>comment.html?action=manage&userId=${user.id }&curPage=${curPage-1}">&larr; 上一页</a></li>          
            </c:if>
            <c:if test="${curPage<totalPages }">           
            <li class="next"><a href="<%=basePath%>comment.html?action=manage&userId=${user.id }&curPage=${curPage+1}">下一页  &rarr;</a></li>            
            </c:if>
          </ul>
		</div>		
	</div>			
	<%-- </c:if> --%>
<jsp:include page="../../frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
function dele(deleUrl) {
	
	if (confirm("你确定要删除该评论吗？")) {
		location.href = deleUrl;
	}
}
</script>