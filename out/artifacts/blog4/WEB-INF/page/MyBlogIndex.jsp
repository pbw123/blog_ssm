<%@ page language="java" import="java.util.*" import="java.text.*" import="cap.bean.*" pageEncoding="utf-8"%>
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
        
          <!-- blog entry -->
          <h1><a href="#">
          
          <c:choose>
          <c:when test="${blogInfo!=null }">
          ${blogInfo.blogName }
          </c:when>
          <c:otherwise>
                    	读取博客标题失败！
          </c:otherwise>
          </c:choose>
          
          </a></h1>
          <p class="lead">
          
          <c:choose>
          <c:when test="${blogInfo!=null }">
          ${blogInfo.description }
          </c:when>
          <c:otherwise>
                    	读取博客副标题失败！
          </c:otherwise>
          </c:choose>
          
          </p><br>
         
                             <c:choose>
                             <c:when test="${null != blogInfo.user.articles}">
                             <c:forEach items="${blogInfo.user.articles }" var="art">
                             <c:if test="${art.isDelete==0 }">
                              <h3><a href="<%=basePath%>ArtCom?artId=${art.id }">${art.title }</a></h3>
          <p>
          <i class="glyphicon glyphicon-user"></i> <a href="#"> ${blogInfo.user.userName }</a> 
		| <i class="glyphicon glyphicon-calendar"></i> ${ art.publishTime}
		| 阅读 ${art.count }次
 		  </p>
          <hr>
          <p>${art.summary }</p>
          <a class="btn btn-primary" href="<%=basePath%>ArtCom?artId=${art.id }">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>               
          <hr>
          <!-- &userId=${blogInfo.user.id} -->
                             </c:if>
                             </c:forEach>
                             </c:when>
                             
                             <c:otherwise>
                             <p>还没有写过文章哦，赶紧写吧~</p>
                             </c:otherwise>
                             </c:choose>
 		 
          <!-- pager -->
          <ul class="pager">
            
            <c:choose>
            <c:when test="${curPage>1 }">
                        <li class="previous"><a href="<%=basePath%>user?action=myblog&curPage=${curPage-1 }&userId=${userId}">&larr; 上一页</a></li>
            </c:when>
            
            <c:when test="${curPage < totalPages-1 }">
                        <li class="next"><a href="<%=basePath%>user?action=myblog&curPage=&${curPage+1 }&userId=${userId}">下一页  &rarr;</a></li>
            </c:when>
            </c:choose>
          </ul>

        </div>
        
        <div class="col-lg-4">                  
          <form action="servlet/GetSysCategoryServlet" method="GET">
          <div class="well">
            <h4> 文章分类</h4>
              <div class="row">
                <div class="col-lg-6">
                  <ul class="list-unstyled">
                  	
                  	<c:choose>
                  	<c:when test="${null != cgList}">
                  	<c:forEach items="${cgList }" var="cg">
                  	<c:if test="${cg.isDelete==0 }">
                  	<li><a href="#">${cg.categoryName }</a></li>
                  	</c:if>
                  	</c:forEach>
                  	</c:when>
                  	
                  	<c:otherwise>
                  	                  	<li>无分类</li>
                  	</c:otherwise>
                  	</c:choose>
                  </ul>
                </div>
              </div>
          </div><!-- /well -->
          </form> 
          
          <div class="well">
            <h4>公告</h4>
            <p>${blogInfo.annoucement }</p>
          </div>
        </div>
      </div>
    </div>
    
<jsp:include page="../../frame/Footer.jsp"></jsp:include>
