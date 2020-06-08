<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>JSP Blog</title>


   	<link href="<%=basePath %>bootstrap/css/bootstrap.css" rel="stylesheet">
   	<link href="<%=basePath %>bootstrap/css/bootstrap-theme.css" rel="stylesheet">

	
    
    <link href="<%=basePath %>bootstrap/css/blog-home.css" rel="stylesheet">
    <script src="<%=basePath %>bootstrap/js/jquery-2.1.1.js"></script>
  </head>
<body>