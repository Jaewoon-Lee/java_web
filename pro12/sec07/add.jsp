<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addException.jsp" %>
<%//이페이지에서 예외가 발생하면 일로 넘기겠다 => errorPage="addException.jsp" %>

<%
int num = Integer.parseInt(request.getParameter("num"));
int sum = 0;
for (int i=0; i<=num; i++){
	sum = sum +1;
}
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1부터 <%=num %> 까지 합은 <%=sum %>입니다.</h1>
</body>
</html>
