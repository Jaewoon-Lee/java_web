<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//session에 내장된 객체에서 데이터 받기
	String name = (String)session.getAttribute("name");
	String address = (String)session.getAttribute("address");
	//application에 내장된 객체에서 데이터 받기
	String 성별 = (String)application.getAttribute("성별");
	//포워딩된 request 객체 받기
	String age = (String)request.getAttribute("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <%= name %><br>
	주소 : <%= address %><br>
	나이 : <%= age %><br>
	성별 : <%= 성별 %><br>
	<% //out 내장 객체 사용 %>
	<h1><% out.println(name+","+age); %></h1>
</body>
</html>
