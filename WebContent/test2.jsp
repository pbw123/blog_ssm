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
<form action="login" method="post">
    <input type="text" name="username">
    <input type="text" name="password">
    <input type="submit" value="确定">
</form>
<a href="login?username=huan&password=123">上海火车站</a>

<c:if test="${suc!=null }">
    <b>${suc}</b>
    <c:remove var="suc"/>
</c:if>

<form action="updBlog">
    学号<input type="text" name="userId" value="${selBlogInfo.userId }"><br/>
    公告<input type="text" name="annoucement" value="${selBlogInfo.annoucement }"><br/>
    描述<input type="text" name="description" value="${selBlogInfo.description }"><br/>
    名字<input type="text" name="blogName" value="${selBlogInfo.blogName }"><br/>
    <input type="submit" value="确定">
</form>

<hr/>
<form action="addArt">
    用户ID<input type="text" name="userId"><br/>
    标题<input type="text" name="title"><br/>
    概要<input type="text" name="summary"><br/>
    内容<input type="text" name="content"><br/>
    系统类型<input type="text" name="sysCategoryId"><br/>
    个人分类<input type="text" name="category"><br/>
    <input type="submit" value="确定">
</form>

<form action="createCategory?id=1" method="post">
    <input type="text" name="categoryName">
    <input type="submit" value="确定">
</form>
删除分类
<form action="delCategory">
    <input type="text" name="id">
    <input type="submit" value="确定">
</form>
添加评论
<form action="addCom">
    <input type="text" name="userId">
    <input type="text" name="articalId">
    <input type="text" name="content">
    <input type="submit" value="确定">
</form>

所有评论
</body>
</html>