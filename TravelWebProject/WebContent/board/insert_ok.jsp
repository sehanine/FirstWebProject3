<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.dao.*"%>

<%
	
	request.setCharacterEncoding("EUC-KR");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	//String pwd=request.getParameter("pwd");
	String pwd = "1234";
	
	TeamVO vo=new TeamVO();
	vo.setName(name);
	vo.setEmail(email);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	TeamDAO dao=TeamDAO.newInstance();
	dao.boardInsert(vo);
	
	//ÀÌµ¿ (list.jsp)
	response.sendRedirect("list.jsp");
	
%>
















