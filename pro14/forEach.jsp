<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" import="java.util.*,sec01.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	List membersList = new ArrayList();
	MemberBean m1 = new MemberBean("111","111","111","111");
	MemberBean m2 = new MemberBean("222","222","222","222");
	MemberBean m3 = new MemberBean("333","333","333","333");
	membersList.add(m1);
	membersList.add(m2);
	membersList.add(m3);
%>
<c:set var="list" value="<%= membersList %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문 연습</title>
</head>
<body>
	<table border="1">
		<tr align="center" bgcolor="lightgreen">
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
		<c:forEach var="member" items="${list}">
			<tr align="center">
				<td>${member.id }</td>
				<td>${member.pwd }</td>
				<td>${member.name }</td>
				<td>${member.email }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
