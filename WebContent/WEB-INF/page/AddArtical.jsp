<%@ page language="java" import="java.util.*" import="cap.bean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

    <c:if test="${user!=null }">  
   
	<div class="container">
		
		<div class="row col-md-12">
			<div class="col-md-12">
			   <div class="col-md-12">
					<ol class="breadcrumb">
		              <li><a href="<%=basePath%>manage?userId=${user.id}">博文管理</a></li>
		              <li class="active">新建文章</li>
		            </ol>
	            </div>
	            
	            <form class="form-horizontal" name="add_artical_form" 
	            action="addArt?userId=${user.id }&artId=${artId}" method="post" onsubmit="return isValidate(add_artical_form)">
	                <div class="col-md-6">
	                    <div class="form-group">
	                    <label for="title">标题</label>
	                    <input class="form-control" id="name" name="title" type="text" value="${selArticleInfo.title }" >
	                    </div>
	                    <div class="form-group">
	                    <label for="sys_category">系统分类</label>
	                        <select class="form-control"  id="subject" name="sysCategoryId">
	                    	<c:choose>
	                    	<c:when test="${allSC!=null && fn:length(allSC)>0 }">
	                    	<c:forEach items="${allSC }" var="scg">
	                    	<option value="${scg.id }">${scg.categoryName }</option>
	                    	</c:forEach>
	                    	</c:when>	                    	
                            <c:otherwise>                        
                                <c:out value="获取系统分类失败"></c:out>
                            </c:otherwise>
                            </c:choose>
                            </select>
                         </div> 
                         <div class="form-group">  
                        <label for="category">个人分类</label>
                        	<select class="form-control" id="subject" name="category">
                        	<c:choose>
                        	<c:when test="${selAC!=null && fn:length(selAC)>0 }">
                        	<c:forEach items="${selAC }" var="cg">
                        	<option value="${cg.id }">${cg.categoryName}</option>
                        	</c:forEach>
                        	</c:when>                          
                            <c:otherwise>
                            <c:out value="无分类"></c:out>
                            </c:otherwise>
                            </c:choose>
                        	</select>
                        </div>
	                
	                <div class="form-group">
	                    <textarea class="form-control" id="message" name="summary"  placeholder="摘要" rows="5">
	                    ${selArticleInfo.summary }
	                    </textarea>
	                </div>
	                
	                <div class="form-group">
	                    <textarea class="form-control" id="message" name="content"  placeholder="文章内容" rows="5">
	                    ${selArticleInfo.content }
	                    </textarea>
	                </div>
	                  
	                <div class="form-group">
	                    <button id="contact-submit" type="submit" class="btn btn-primary input-medium pull-right">保存</button>
	                </div>
	                </div>
	            </form>
	        </div>
		</div>
	</div>
	
	</c:if>  
<jsp:include page="../../frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
			function isValidate(add_artical_form) {
				var comment_content = add_artical_form.title.value;
				
				if (comment_content == "") {
					alert("请填写文章标题");

					return false;
				}
             
				return true;
			}
		</script>