<%@ page language="java" import="java.util.*" import="cn.niit.pojo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
Admin admin = (Admin)request.getSession().getAttribute("admin");
List<User> uList=(List<User>)request.getAttribute("uList");

String succDeleMsg = (String)request.getSession().getAttribute("succDeleMsg");	//禁用用户消息
String errorDeleMsg = (String)request.getSession().getAttribute("errorDeleMsg");

String succActMsg = (String)request.getSession().getAttribute("succActMsg");	//启用用户消息
String errorActMsg = (String)request.getSession().getAttribute("errorActMsg");

int curPage = (Integer)request.getAttribute("curPage");
int totalPages = (Integer)request.getAttribute("totalPages");
%>

<jsp:include page="frame/Header.jsp"></jsp:include>

	<% if (null != admin) { %>
	  <div class="container">
	  <!-- Sidebar -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          
          <a class="navbar-brand" href="<%=basePath%>admin/Index.jsp">J2EE博客管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li><a href="<%=basePath%>admin/Index.jsp"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
            <li class="active"><a href="<%=basePath %>admin.html?action=useradmin"><i class="glyphicon glyphicon-cog"></i> 用户管理</a></li>
            <li><a href="<%=basePath %>admin.html?action=SysArticalAdmin"><i class="glyphicon glyphicon-cog"></i> 文章管理</a></li>
            <li><a href="<%=basePath %>admin.html?action=SysCategoryAdmin"><i class="glyphicon glyphicon-edit"></i> 分类管理</a></li>
            
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
        </div><!-- /.navbar-collapse -->
      </nav>
      
     
	<div id="page-wrapper">
        <div class="row">
          <div class="col-lg-12">
          	<br>
            <ol class="breadcrumb">
            <li><a href="<%=basePath%>admin/Index.jsp"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
              <li class="active"><i class="glyphicon glyphicon-cog"></i> 用户管理</li>
            </ol>
           
		    <%-- 禁用账户结果提示消息 --%>
		  	<% if (null != succDeleMsg) { %>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-success"><%=succDeleMsg %></div>
		  	</div>
		  	</div>
		  	<% 
		  	       request.getSession().removeAttribute("succDeleMsg");
		  	   } 
		  	%>
		  	
		  	<% if (null != errorDeleMsg) { %>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-danger"><%=errorDeleMsg %></div>
		  	</div>
		  	</div>
		  	<%     
		  	       request.getSession().removeAttribute("errorDeleMsg"); 
		  	   } 
		  	%>
		  	
		  	<%-- 激活账户结果提示消息 --%>
		  	<% if (null != succActMsg) { %>
		  	<div class="row">
         		<div class="col-lg-12">
		  	<div class="alert alert-success"><%=succActMsg %></div>
		  	</div>
		  	</div>
		  	<% 
		  	       request.getSession().removeAttribute("succActMsg");
		  	   } 
		  	%>
		  	
		  	<% if (null != errorActMsg) { %>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-error"><%=errorActMsg %></div>
		  	</div>
		  	</div>
		  	<%     
		  	       request.getSession().removeAttribute("errorActMsg"); 
		  	   } 
		  	%>
          <div class="row">
          	<div class="col-lg-12">
            	<div class="table-responsive">
              	<table class="table table-hover tablesorter">
					<thead>
						<tr>
							<th>用户名</th>
		          			<th>是否申请博客</th>
		          			<th>邮箱地址</th>
		          			<th>当前状态</th>
		          			<th>操作</th>
		          			<th>查看用户信息</th>
						</tr>
					</thead>
					<tbody>
					<%
						if(uList != null){
							for(User u : uList){
								
								String deleUrl = basePath + "admin.html?action=deleteuser&uId=" + u.getId(); //禁用链接
								String actUrl = basePath + "admin.html?action=activeuser&uId=" + u.getId(); //激活链接
								String detailUrl = basePath + "admin.html?action=userprofile&uId=" + u.getId() ;//详细信息
					 %>
						<tr>
		          			<td><%=u.getUserName() %></td>
		          			<td>
		          				<% if (u.getIsApplied() == 1) { %>  
		          				<span class="label label-success">已申请</span>
		          				<% } else { %>
		          				<span class="label label-danger">未申请</span>
		          				<% }  %>
		          			</td>
		          			<td><%=u.getEmail() %></td>
		          			<td>
		          				<% if (u.getIsDelete() == 0) { %>
		          				<span class="label label-success">可用</span>
		          				<% } else { %>		
		          				<span class="label label-danger">不可用</span>
		          				<% } %>
		          			</td>
		          			<td> 
		          				<% if (u.getIsDelete() == 1) { %>
		          				
		          				 <a onClick="act('<%=actUrl %>')" class="btn btn-success btn-xs"> 启用账号</a>	
		          				<% } else { %>
		          				<a onClick="dele('<%=deleUrl %>')" class="btn btn-danger btn-xs"> 禁用账号</a>	
		          				<% } %>
		           			</td>
		          			<td>
		          				<% if (u.getIsProfile() == 1) { %>
		          				<a href="<%=detailUrl %>" class="btn btn-primary btn-xs">详细信息</a>
		          				<% } else { %>
		          				<a class="btn btn-warning btn-xs">尚未更新资料</a>
		          				<% } %>
		          			</td>
		          		</tr>
		          	<%          
		          		}
		          		}else{%>
		          	 <%="获取用户资料失败"%>
		          	 <%} %>
					</tbody>
					</table>
					</div>
				</div>
			</div>
			
			<!-- pager -->
          <ul class="pager">
          	<% if (curPage > 1) { %>
            <li class="previous"><a href="<%=basePath%>admin.html?action=useradmin&curPage=<%=(curPage-1)%>">&larr; 上一页</a></li>
            <% } %>
            
            <% if (curPage < totalPages) { %>
            <li class="next"><a href="<%=basePath%>admin.html?action=useradmin&curPage=<%=(curPage+1)%>">下一页  &rarr;</a></li>
            <% } %>
          </ul>
			
			</div>
        </div><!-- /.row -->
    </div><!-- /#page-wrapper -->
</div>
<% } else { %>
<%-- 404 page --%>
<% } %>
<jsp:include page="frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
function dele(deleUrl) {
	
	if (confirm("你确定要禁用该用户吗？")) {
		location.href = deleUrl;
	}

}

function act(actUrl) {
	
	if (confirm("你确定要激活该用户吗？")) {
		location.href = actUrl;
	}
}
</script>