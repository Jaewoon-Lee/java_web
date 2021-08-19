<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//바인딩 된 데이터받기
	String name = (String)session.getAttribute("name");
	//새로운값바인딩
	session.setAttribute("address","경기도 부천시");
	application.setAttribute("성별","남자");
	request.setAttribute("age","32세");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% //dispatch로 인하여 출력되지 않음(request)%>
	이름 : <%= name %><br>
	<a href=session2.jsp>다음 페이지로 이동</a>
	<%
	//위에 request.setAtrribute때문에 디스패치로 포워딩해줘야함
	RequestDispatcher dispatch = request.getRequestDispatcher("session2.jsp");
	dispatch.forward(request,response);
	%>
</body>
</html>
