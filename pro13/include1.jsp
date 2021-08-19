<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include1</title>
</head>
<body>
	<h1>include1 페이지 시작 부분</h1>
	<jsp:include page="duke_image.jsp" flush="true">
		<jsp:param value="듀크" name="name"/>
		<jsp:param value="duke.png" name="imgName"/>
	</jsp:include>
	<h1>include1 페이지 끝 부분</h1>
</body>
</html>
