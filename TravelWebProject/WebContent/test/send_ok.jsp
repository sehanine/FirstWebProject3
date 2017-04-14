<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.dao.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	
	TeamDAO dao = new TeamDAO();
	TeamVO vo = new TeamVO();
	vo.setName(request.getParameter("inputName"));
	vo.setEmail(request.getParameter("inputEmail"));
	vo.setSubject(request.getParameter("inputPhone"));
	vo.setContent(request.getParameter("inputMessage"));
	vo.setPwd("1234");
	dao.boardInsert(vo);
%>
<script>
    window.history.back();
</script>