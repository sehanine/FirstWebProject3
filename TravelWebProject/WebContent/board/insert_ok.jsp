<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.dao.*"%>

<%
	//사용자가 보낸 값을 받는다.=>한글
	request.setCharacterEncoding("EUC-KR");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	
	TeamVO vo=new TeamVO();
	vo.setName(name);
	vo.setEmail(email);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	//데이터베이스 연결
	TeamDAO dao=TeamDAO.newInstance();
	dao.boardInsert(vo);
	
	//이동 (list.jsp)
	response.sendRedirect("list.jsp");
	
%>
















