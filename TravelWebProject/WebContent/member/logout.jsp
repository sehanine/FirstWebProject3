<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String email = session.getAttribute("email").toString();
	session.removeAttribute("email"); 
	response.sendRedirect("../main/main.jsp");
%>