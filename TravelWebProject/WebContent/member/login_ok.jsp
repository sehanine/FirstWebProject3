<%@page import="web.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String email = request.getParameter("input_email");
	String pwd = request.getParameter("input_pwd");
	// email pwd check
	MemberDAO dao = new MemberDAO();
	//int res = dao.iSLogin(email, pwd);
	// ********************** �Ʒ� ���� ����� 10�� ���� dao.islogin Ȱ��ȭ
	int res = 2; 
	
	if(res == 0){
%>	
	<script>
		alert("ID�� �������� �ʽ��ϴ�.");
		history.back();
	</script>
<%	
	} else if(res == 1){
%>		
	<script>
		alert("�н����尡 Ʋ���ϴ�.");
		history.back();
	</script>
<%
	} else if(res == 2){
		//if true
		// set id as a param back to main
		// else alert back to main
		session.setAttribute("email", email);
		response.sendRedirect("../test_main.jsp");	
	}
%>
	
