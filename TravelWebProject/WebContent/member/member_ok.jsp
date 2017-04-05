<%@page import="java.net.URLDecoder"%>
<%@page import="web.member.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String email = request.getParameter("email");
	String nick = request.getParameter("nick");
	String pwd = request.getParameter("pwd");
	
	System.out.println("email: " + email + " nick: " + nick + " pwd: " + pwd);
	MemberDAO dao = new MemberDAO();
	MemberVO vo = new MemberVO();
	vo.setEmail(email);
	vo.setNickname(nick);
	vo.setPwd(pwd);
	dao.joinMember(vo);
%>