<%@page import="web.dao.QueryDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String currentPage = request.getParameter("page");
	int curPage = Integer.parseInt(currentPage);
	QueryDAO dao = new QueryDAO();
	int maxPage = dao.getDivPage();
	if(curPage >= maxPage){
		curPage = 1;
	} else{
		curPage++;
	}
	response.sendRedirect("test_main.jsp?page=" +curPage +"#portfolio");
	
%>