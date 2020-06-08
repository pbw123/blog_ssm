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
	
    
  	  <c:choose>
  	  <c:when test="${null != succMsg }">
  	  <div class="container">
  	<div class="alert alert-success">${succMsg }</div>
  	</div>
         <c:remove var="succMsg"/>
  	       <!-- request.getSession().removeAttribute("succMsg"); -->
  	   
  	  </c:when>
  	  <c:when test="${null != errorMsg }">
  	  <div class="container">
  	<div class="alert alert-error">${errorMsg }</div>
  	</div>
  	  </c:when>
  	  <c:when test="${null != user && null != art }">
  	  <div class="container">
		<div class="row col-md-12">
			<div class="col-md-12">
			   <div class="col-md-12">					
					<ol class="breadcrumb">
		              <li><a href="<%=basePath%>article?action=manage&userId=${user.id}">博文管理</a></li>
		              <li class="active">编辑文章</li>
		            </ol>
	            </div>
	            <form class="form-horizontal" name="add_artical_form" action="<%=basePath %>article?action=saveupdate&userId=${user.id }&artId=${art.id}" method="post">
	                <div class="col-md-6">
	                    <div class="form-group">
	                    <label for="title">标题</label>
	                    <input class="form-control" id="name" name="title" type="text" value="${art.title }">
	                    </div>
	                    <div class="form-group">
	                    <label for="sys_category">系统分类</label>
	                        <select class="form-control" id="subject" name="sys_category" class="span3">
	                        
                            	<c:choose>
                            	<c:when test="${ scgList!=null}">
                            	<c:forEach items="${scgList }" var="scg">
	                    	
	                    	<option value="${scg.id }" selected>${ scg.categoryName} </option>
	                    	</c:forEach>
                            	</c:when>
                            
                                
                                <c:otherwise>
                                                                                           获取系统分类失败
                                </c:otherwise>
                            	</c:choose>
                            	
                            </select>
                        </div>
                        <div class="form-group">   
                        <label for="category">个人分类</label>
                        	<select class="form-control"  id="subject" name="category">
                          
                            <c:choose>
                            <c:when test="${null != cgList }">
                            <c:forEach items="${cgList }" var="cg">
                            
                           <c:choose>
                            <c:when test="${cg.isDelete==0 && art.categoryId==cg.id}">
                           <option value="${ art.categoryId}" selected>${cg.categoryName }</option>
                            </c:when>
                            
                            <c:otherwise>
                            <option value="${cg.id }">${cg.categoryName }</option>
                            </c:otherwise>
                           </c:choose>
                            
                            </c:forEach>
                            </c:when>
                            
                            <c:otherwise>
                                                                                    获取个人分类失败
                            </c:otherwise>
                            </c:choose>
                        	</select>
	                </div>
	                <div class="form-group">
	                    <textarea class="form-control" id="message" name="summary" class="span6" placeholder="摘要" rows="5">${art.summary }</textarea>
	                </div>
	                
	                <div class="form-group">
	                    <textarea class="form-control" id="message" name="content" class="span6" placeholder="文章内容" rows="5">${art.content }</textarea>
	                </div>
	                  
	                <div class="form-group">
	                    <button id="contact-submit" type="submit" class="btn btn-primary input-medium pull-right">保存</button>
	                </div>
	                </div>
	            </form>
	        </div>
		</div>
	</div>
  	  </c:when>
  	  </c:choose>  
	
<jsp:include page="../../frame/Footer.jsp"></jsp:include>
