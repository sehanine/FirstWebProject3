<%@page import="board.dao.TeamDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	
	//DB����
	TeamDAO dao=TeamDAO.newInstance();
	boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
	
	if(bCheck==false){
%>
	<script>
		alert("��й�ȣ�� Ʋ���ϴ�.\n�ٽ� �Է��ϼ���.");
		history.back();
	</script>
<%	
	}else{
		response.sendRedirect("list.jsp");
	}
%>








