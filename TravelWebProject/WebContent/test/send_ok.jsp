<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("inputName");
	String email = request.getParameter("inputEmail");
	String phone = request.getParameter("inputPhone");
	String message = request.getParameter("inputMessage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	name: <%=name %><br/>
	email: <%=email %><br/>
	phone: <%=phone %><br/>
	message: <%=message %><br/>

</body>
</html>