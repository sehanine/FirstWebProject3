<%@page import="board.dao.TeamDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	
	//DB연동
	TeamDAO dao=TeamDAO.newInstance();
	boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
	
	if(bCheck==false){
%>
	<script>
		alert("비밀번호가 틀립니다.\n다시 입력하세요.");
		history.back();
	</script>
<%	
	}else{
		response.sendRedirect("list.jsp");
	}
%>








