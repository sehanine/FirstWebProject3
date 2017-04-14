<%@page import="web.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//이미지 정보 가져오기
	String email = (String)session.getAttribute("email");
	MemberDAO dao = new MemberDAO();
	String img = dao.getValue(email, "img", "email");
	if(img == null){
		img = "../img/defaultIcon.png";
	}
	/*
	
SELECT img FROM festigo_member
		WHERE email= 'aa@naver.com'
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
	<img src=<%=img %> alt="profilepic" style=" width:35%">
</center>
</body>
</html>