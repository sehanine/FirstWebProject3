<%@page import="java.net.URLDecoder"%>
<%@page import="web.member.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String nick = URLDecoder.decode(request.getParameter("nick"),"EUC-KR");
	String pwd = request.getParameter("pwd");
	
	System.out.println("memberok.jsp" + "email: " + email + " nick: " + nick + " pwd: " + pwd);
	MemberDAO dao = new MemberDAO();
	MemberVO vo = new MemberVO();
	vo.setEmail(email);
	vo.setNickname(nick);
	vo.setPwd(pwd);
	dao.joinMember(vo);
%>