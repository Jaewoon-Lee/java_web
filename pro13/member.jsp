<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,sec01.*" pageEncoding="UTF-8"%>
<jsp:useBean id="m" class="sec01.MemberBean" scope="page"/>
<jsp:setProperty name="m" property="*"/>
<%request.setCharacterEncoding("utf-8");%>
<%
/* 	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name");
	String email=request.getParameter("email"); 
	value='= %request.getParameter("id")%' === param="id"
	<jsp:setProperty name="m" property="id" param="id"/> == <jsp:setProperty name="m" property="id"/>
	<jsp:setProperty name="m" property="id"/>----|
	<jsp:setProperty name="m" property="pwd"/>   |
	<jsp:setProperty name="m" property="name"/>  | ==> 최종 위의 한줄 (*)로 줄임 
	<jsp:setProperty name="m" property="email"/>-|
	줄이는 과정 */
//	MemberBean m = new MemberBean(id, pwd, name, email); <jsp:usebean써서 없애줌>
	MemberDAO memberDAO = new MemberDAO();
	memberDAO.addMember(m);
	List membersList = memberDAO.listMembers();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록창</title>
</head>
<body>
	<table align="center"  width="100%">
		 <tr align="center" bgcolor="#99ccff">
		      <td>아이디</td>
		      <td>비밀번호</td>
		      <td>이름</td>
		      <td>이메일</td>
		      <td>가입일</td>
		 </tr>
		<%
		   if(membersList.size()==0){
		%>
		<tr>
			<td colspan="5">등록된 회원이 없습니다.</td>
		</tr>
		<% }else{
			for(int i=0; i<membersList.size();i++){
				MemberBean bean = (MemberBean)membersList.get(i);
		%>
		<tr align='center'>
			<td><%= bean.getId()%></td>
			<td><%= bean.getPwd()%></td>
			<td><%= bean.getName()%></td>
			<td><%= bean.getEmail()%></td>
			<td><%= bean.getJoinDate()%></td>
		</tr>	
		<%
			}
		}
		%>
</body>
</html>
