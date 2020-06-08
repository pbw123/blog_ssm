<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
    pageContext.setAttribute("basePath", basePath);
%>

<h3>显示图片</h3>
<img src="${basePath}${girl.image}">
<img src="http://localhost:80/blog4/img/540f6e4590ea481897f089c75b85e649.jpeg">
<hr>
${basePath}${girl.image}

</body>
</html>