<%@page import="com.sist.reply.ReplyVO"%>
<%@page import="com.sist.reply.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int replyId = Integer.parseInt(request.getParameter("replyid")); //replyid
	ReplyDAO dao = new ReplyDAO();
	dao.deleteReply(replyId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>