<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결과 출력</h1>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		if (id == null || id.length() == 0) {
	%>
	아이디를 입력하세요<br>
	<a href="/pro11/login.html">로그인하기</a>
	<%} else if(id.equals("admin")) { %>
	<h1>관리자 화면</h1>
	<form>
		<input type=button value="회원정보 삭제하기"/>
		<input type=button value="회원정보 수정하기"/>
	</form>
	<%} else{ %>
	<h1>환영합니다. <%= id%> 님!! </h1>
	<%}%>
</body>
</html>
 
