<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.dao.*"%>
    
    
    <%
    	request.setCharacterEncoding("EUC-KR");
    	String pno=request.getParameter("pno");
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
    	
    	//DB연동
    	TeamDAO dao=TeamDAO.newInstance();
    	dao.boardReply(Integer.parseInt(pno), vo);
    	//이동
    	response.sendRedirect("list.jsp");
    %>
