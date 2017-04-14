<%@page import="web.member.MemberDAO"%>
<%@page import="web.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String email = request.getParameter("email");
	String img = request.getParameter("pic");
	String comment = request.getParameter("coment");
	String nickname = request.getParameter("nickname");
	MemberVO vo = new MemberVO();
	vo.setEmail(email);
	vo.setImg(img);
	vo.setComment(comment);
	vo.setNickname(nickname);
	MemberDAO dao = new MemberDAO();
	dao.update(vo);
	System.out.println(email);
	System.out.println(img);
	System.out.println(comment);
	System.out.println(nickname);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	javascript:history.back();
</script>