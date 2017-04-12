<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String email = request.getParameter("email");
	String uri = request.getParameter("pic");
	String content = request.getParameter("content");
	String nickname = request.getParameter("nickname");
	
	System.out.println(email);
	System.out.println(uri);
	System.out.println(content);
	System.out.println(nickname);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	업데이트
</body>
</html>