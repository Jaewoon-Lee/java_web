<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include2</title>
</head>
<body>
	<h1>include2 페이지 시작 부분</h1>
	<jsp:include page="duke_image.jsp" flush="true">
		<jsp:param value="듀크2" name="name"/>
		<jsp:param value="duke2.png" name="imgName"/>
	</jsp:include>
	<h1>include2 페이지 끝 부분</h1>
</body>
</html>
