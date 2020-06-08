<%@ page language="java" import="java.util.*" import="cn.niit.pojo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
Admin admin = (Admin)request.getSession().getAttribute("admin");
String scgExist = (String)request.getSession().getAttribute("scgExist");
%>

<jsp:include page="frame/Header.jsp"></jsp:include>

	<% if (null != admin) { %>
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
          <a class="navbar-brand" href="<%=basePath%>admin/Index.jsp">J2EE博客管理系统</a>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li><a href="<%=basePath%>admin/Index.jsp"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
            <li><a href="<%=basePath %>admin.html?action=useradmin"><i class="glyphicon glyphicon-cog"></i> 用户管理</a></li>
            <li><a href="<%=basePath %>admin.html?action=SysArticalAdmin"><i class="glyphicon glyphicon-cog"></i> 文章管理</a></li>
            <li class="active"><a href="<%=basePath %>admin.html?action=SysCategoryAdmin"><i class="glyphicon glyphicon-edit"></i> 分类管理</a></li>
            
          </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> <%=admin.getUserName() %> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#"><i class="icon-gear"></i> 设置</a></li>
                <li class="divider"></li>
                <li><a href="<%=basePath%>admin.html?action=logout"><i class="glyphicon glyphicon-off"></i> 登出</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </nav>
      
     
	<div id="page-wrapper">
        <div class="row">
          <div class="col-lg-12">
              <h1>J2EE博客系统 <small>基于JSP和Servlet技术构建</small></h1>
              <ol class="breadcrumb">
	              <li><a href="<%=basePath%>admin/Index.jsp"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
	              <li><a href="<%=basePath %>admin.html?action=SysCategoryAdmin"><i class="glyphicon glyphicon-cog"></i> 分类管理</a></li>
	              <li class="active"><i class="glyphicon glyphicon-cog"></i> 新建分类</li>
              </ol>

			  <% if (null != scgExist) { %>	<%-- 添加失败 --%>
		  	  <div class="row">
         	  <div class="col-lg-12">
		  		  <div class="alert alert-warning"><%=scgExist %></div>
		  	  </div>
		  	  </div>
		  	  <%     
		  	          request.getSession().removeAttribute("scgExist"); 
		  	   } 
		  	  %>
	          <div class="row">
	          	<div class="col-lg-6">
	          		<form action="<%=basePath %>admin.html?action=AddSysCategory" method="post">
	            		<label>分类名：</label><input name="scgName" class="form-control" type="text"/><br>
	            		<input type="submit" class="btn btn-primary" value="保存">
	            	</form>
				</div>
			  </div>
		  </div>
        </div>
    </div>

<% } else { %>
<%-- 404 page --%>
<% } %>
<jsp:include page="frame/Footer.jsp"></jsp:include>

