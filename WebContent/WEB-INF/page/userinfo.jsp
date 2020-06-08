<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
用户头像：${requestScope.boy.headimage.originalFilename}
<a
        href="download?filename=${requestScope.boy.headimage.originalFilename}">
        用户头像：${requestScope.boy.headimage.originalFilename}
      </a> 
</body>
</html>