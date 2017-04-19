<%@page import="web.member.ContactMe"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.dao.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	
	
	TeamVO vo = new TeamVO();
	vo.setName(request.getParameter("inputName")); 
	vo.setEmail(request.getParameter("inputEmail"));
	vo.setSubject(request.getParameter("inputPhone"));
	vo.setPwd(request.getParameter("inputMessage"));
	ContactMe mail = new ContactMe(vo);
%>
<script>
    window.history.back();
</script>