<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String  email = request.getParameter("email");
	String  nick = request.getParameter("nick");
	String  pwd = request.getParameter("pwd");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	이메일: <%=email %><br/>
	닉네임: <%=nick %><br/>
	패스워드: <%=pwd %><br/>
	
</body>
</html>