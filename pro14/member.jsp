<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"
	import="java.util.*,sec01.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m1" class="sec01.MemberBean"/>
<jsp:setProperty property="*" name="m1"/>  <!--  MemberBean의 모든 메소드를 사용하겠다 -->
<jsp:useBean id="memberList" class="java.util.ArrayList"/>
<%
	MemberBean m2 = new MemberBean("son", "1234", "손흥민", "son@test.com");
	memberList.add(m1);
	memberList.add(m2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 출력창</title>
</head>
<body>
	<table border="1" align="center">
		<tr align="center" bgcolor="#99ccff">
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
			<td>주소</td>
		<tr align="center">
			<td>${member.id}</td>
			<td>${member.pwd}</td>
			<td>${member.name}</td>
			<td>${member.email}</td>
		</tr>		
		<tr align="center">
			<td>${memberList[1].id}</td>
			<td>${memberList[1].pwd}</td>
			<td>${memberList[1].name}</td>
			<td>${memberList[1].email}</td>
		</tr>
		<tr align="center">
			<td>${m.id}</td>
			<td>${m.pwd}</td>
			<td>${m.name}</td>
			<td>${m.email}</td>
			<td>${requestScope.address}</td>
			<!--  requestScope == request.getattribute를 줄인것이라 볼 수 있음 -->
		</tr>

	</table>
</body>
</html>
