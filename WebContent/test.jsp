<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
测试====
<%-- ${artCom.category.categoryName }
 --%>
<%-- <c:forEach items="${blogInfo.user.articles }" var="com">
${com.title }
</c:forEach> --%>

<%-- ${blogInfo.blogName }
${blogInfo.id }
${blogInfo.description }
${blogInfo.user.userName } --%>

<%-- <c:choose>
<c:when test="${login==null }">
请注册
</c:when>
<c:otherwise>
登录成功
${login.id }
${login.userName }
${login.isDelete }

</c:otherwise>
</c:choose>
 --%>
<%-- ${suc }
${exitError } --%>
<%-- <c:forEach items="${selManage }" var="art">
${art.category.categoryName }
${art.sCategory.categoryName }
${art.publishTime }
</c:forEach> --%>
<%-- <c:forEach items="${categorys }" var="cat">
${cat.categoryName }
${cat.articles }
</c:forEach> --%>

<%-- <c:forEach items="${articles }" var="art">
${art.title }
<c:forEach items="${art.coms }" var="com">
${com.content }
${com.user.id }
</c:forEach>
</c:forEach> --%>

<%-- <form action="createArt">
<input type="submit" value="跳转">
</form>

<c:forEach items="${articles }" var="cmt">
${cmt.title }
${cmt.id }
</c:forEach>
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

               <c:if test="${selCmt!=null }">
               <c:forEach items="${selCmt }" var="cmt">

                   <tr>
                      <td> ${cmt.content} </td>
                       <td>${cmt.user.userName}</td>
                       <td>${cmt.article.title}</td>
                       <td>${cmt.time}</td>
                       <td><a href="deleteComment?cmtId=${cmt.id}&userId=${user.id}" >
                       <i class="glyphicon glyphicon-remove"></i></a></td>

                   </tr>
                     </c:forEach>
                     </c:if>
               </tbody>
           </table> --%>
<%-- 
${selArticleInfo.title }
${selArticleInfo.content }
${selArticleInfo.sCategory }
${selArticleInfo.category }
${selArticleInfo.summary }
 --%>

<form name="Form2" action="springUpload" method="post" enctype="multipart/form-data">
    <h1>使用spring mvc提供的类的方法上传文件</h1>
    <input type="file" name="file">
    <input type="submit" value="upload"/>
</form>

<form action="gotoAction" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>请选择文件：</td>
            <td><input type="file" name="file"></td>
        </tr>
        <tr>
            <td>开始上传</td>
            <td><input type="submit" value="上传"></td>
        </tr>
    </table>
</form>

<h2>用户注册</h2>
<form action="register" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>用户头像：</td>
            <td><input type="file" name="headimage"></td>
        </tr>
        <tr>
            <td>上传：</td>
            <td><input type="submit" value="上传"></td>
        </tr>
    </table>
</form>

<h3>文件下载</h3> -->


<form action="up" method="post" enctype="multipart/form-data">

    <label>上传头像：</label><input type="file" name="file"><br>
    <input type="submit">
</form>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
    pageContext.setAttribute("basePath", basePath);
%>

<h3>显示图片</h3>
<img src="${basePath}/img/f37e6dd9ef234138b817a90599a8da45.jpeg">
<hr>
${basePath}${girl.image}

</body>
</html>