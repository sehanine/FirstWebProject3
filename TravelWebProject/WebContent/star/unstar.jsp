<%@page import="web.star.dao.StarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String email = (String) session.getAttribute("email");
	int fesno = Integer.parseInt(request.getParameter("fesno"));
	if(email != null){
		StarDAO dao = new StarDAO();
		dao.unStar(fesno, email);
	} 
%>