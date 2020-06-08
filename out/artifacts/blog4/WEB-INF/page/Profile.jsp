<%@ page language="java" import="java.util.*"  import = "cap.bean.*" pageEncoding="UTF-8"
%>
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


    <c:if test="${succMsg!=null }">
  	
  	 <div class="container">
     	<div class="alert alert-success">
     	${succMsg }
     	</div>
     </div>
     <c:remove var="succMsg"/>
     </c:if>
     <c:if test="${errorMsg!=null }">
     
     <div class="container">
     	<div class="alert alert-error">
     	${errorMsg}
     	</div>
     </div>
     <c:remove var="errorMsg"/>
     </c:if>
     <c:if test="${succUpdateMsg!=null }">
  	 <div class="container">
     	<div class="alert alert-success">
     	${succUpdateMsg }
     	</div>
     </div>
     <c:remove var="succUpdateMsg"/>
     </c:if>
     <c:if test="${errorUpdateMsg!=null }">
     <div class="container">
     	<div class="alert alert-error">
     	${errorUpdateMsg }
     	</div>
     </div>
    <c:remove var="errorUpdateMsg"/>
    </c:if>
    <c:if test="${validPwdMsg }">
     <div class="container">
     	<div class="alert alert-error">
     	${validPwdMsg }
     	</div>
     </div>
     <c:remove var="validPwdMsg"/>
    </c:if>
	<div class="container">
		<div class="well row col-md-6">
	    <ul class="nav nav-tabs">
	      <li class="active"><a href="#home" data-toggle="tab">个人资料</a></li>
	      <li><a href="#profile" data-toggle="tab">修改密码</a></li>
	    </ul>
	    <div id="myTabContent" class="tab-content">
	      <div class="tab-pane active in" id="home">
	        <form class="form-horizontal" name="profile_form" role="form" id="tab" action="<%=basePath %>updProfile?&userId=${user.id}" method="post" onsubmit="return isValidate(profile_form)">
	            <div class="form-group">
	            <label for="username">用户名</label>
	            <input type="text" value="${user.userName }" class="form-control"  disabled>
	            </div>
	            <div class="form-group">
	            <label for="email">邮箱</label>
	            <input type="text" value="${user.email }" class="form-control"  disabled>
	            </div>
	            <div class="form-group">
	            <label for="firstName">姓</label> 
	            <c:choose>
	            <c:when test="${profile!=null }">       
	            <input class="form-control" type="text" value="${profile.firstName }"  name="firstName">
	           	</c:when>
	           	<c:otherwise>           		
	           	<input class="form-control" type="text" value=""  name="firstName">        
	            </c:otherwise>
	            </c:choose> 	  
	            </div>
	            <div class="form-group">
	            <label for="lastName">名</label>
	            <c:choose>
	            <c:when test="${profile!=null }">	            
	            <input class="form-control" type="text" value="${profile.lastName }"  name="lastName">
	            </c:when>
	            <c:otherwise>           
	            <input class="form-control" type="text" value=""  name="lastName">	            
	            </c:otherwise>
	            </c:choose>
	            </div> 
	            <div class="form-group">
	            <label for="telephone">手机号码</label>
	            <c:choose>
	            <c:when test="${profile!=null }">	            
	            <input class="form-control" type="text" value="${profile.telephone }"  name="telephone">
	            </c:when>
	            <c:otherwise>	            
	            <input class="form-control" type="text" value=""  name="telephone">	           
	            </c:otherwise>
	            </c:choose>
	            </div>
	            <div class="form-group">
	            <label for="gender">性别</label>
	            <select class="form-control" name="gender" id="gender">
	            <c:choose>
	            <c:when test="${profile!=null }">
	                <c:choose>
	                <c:when test="${profile.gender==0 }">
	            	
	            	<option value="1">男</option>
	            	<option value="0" selected>女</option>
	            	</c:when>
	            	<c:otherwise>
	            	
	              	<option value="1" selected>男</option>
	              	<option value="0">女</option>
	              	</c:otherwise>
	           
	               </c:choose>
	            </c:when>
	            <c:otherwise>
	                <option value="male">男</option>
	                <option value="female">女</option>
	            
	            </c:otherwise>
	            </c:choose>
	            </select>
	            </div>
	          	<div class="form-group" >
	        	    <button class="btn btn-primary" type="submit">保存</button>
	        	</div>
	        </form>
	      </div>
	      <div class="tab-pane fade" id="profile">
	    	<form class="form-horizontal" id="tab2" name="updatePwd" onsubmit="return isPasswordValidate(updatePwd)" 
	    	      method="post" action="updPassword?userId=${user.id }">
	        	<div class="form-group">
	        	<label for="old_pwd">旧密码</label>
	        	<input class="form-control" type="password" name="old_pwd" >
	        	</div>
	        	<div class="form-group">
	        	<label for="new_pwd" >新密码</label>
	        	<input class="form-control" type="password" name="new_pwd" >
	        	</div>
	        	<div class="form-group">
	        	<label for="submit_new_pwd">新密码（确认）</label>
	        	<input class="form-control" type="password" name="submit_new_pwd">
	        	</div>
	        	<div class="form-group">
	        	   <button class="btn btn-primary">保存</button>
	        	</div>
	    	</form>
	      </div>
	  </div>
	</div>
	</div>
<jsp:include page="../../frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
function isValidate(profile_form) {
	var first_name = profile_form.first_name.value;
	var last_name = profile_form.last_name.value;
	var telephone = profile_form.telephone.value;
	
	if (first_name == "" || last_name == "" || telephone == "") {
		alert("姓，名，手机号码为必填项");	
		
		return false;
	}
	
	return true;
}

function isPasswordValidate(form) {
	var old_pwd = form.old_pwd.value;
	var new_pwd = form.new_pwd.value;
	var submit_new_pwd = form.submit_new_pwd.value;
	
	if (old_pwd == "" || new_pwd == "" || submit_new_pwd == "") {
		alert("新密码、旧密码、旧密码（确认）为必填项");	
		return false;
	} else if (old_pwd == new_pwd) {
		alert("新密码和旧密码不能相同");
		return false;
	} else if (submit_new_pwd != new_pwd) {
		alert("新密码和新密码（确认）必须相同");
		return false;
	} else {
		return true;
	}

}
</script>