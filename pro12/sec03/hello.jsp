<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String name = "듀크";
	public String getName(){ return name;}
%>
<% String age=request.getParameter("age"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언문 연습</title>
</head>
<body>
	<h1>안녕하세요 <%=name %>님!!</h1>
	<h1>나이 : <%= age %></h1>
	<h1>10년후 나이 : <%=Integer.parseInt(age)+10 %></h1>
</body>
</html>

<%-- jsp 주석문  <!-- html 주석문 --!>  --%>
