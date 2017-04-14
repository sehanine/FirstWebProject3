<%@page import="web.member.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String  email = request.getParameter("email");
	String  nick = request.getParameter("nick");
	String  pwd = request.getParameter("pwd");
	/*
	create vo set attributes, put them in the database
	*/
	String ranNum = RandomNumGen.getRanNum();
	JavaMailAPI mailAPI = new JavaMailAPI(email, ranNum, nick, pwd);
	// ------------------------����� --------------------------------------
	System.out.println("ranNum: " + ranNum);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
<link rel="stylesheet" type="text/css" href="../shadow/css/table.css">
<script type="text/javascript">
function send(){
	var ranNum = <%= ranNum%>;
	var vrfCode=$('[name=vrfCode]').val();
	var vo = {"email": "<%=email%>","nick": "<%=nick%>","pwd": "<%=pwd%>"};
	if(ranNum == vrfCode){
		$.ajax({
			type: "POST",
			url: "member_ok.jsp",
			data: vo
		})
		
		alert("������ �����մϴ�.");
		
		parent.Shadowbox.close();
		
	} else{
		document.getElementById("error_msg").innerHTML = "�����ڵ尡 ��ġ���� �ʽ��ϴ�.";
	}
	
}
</script>
</head>
<body>
	�̸����� ������ �ּ���.<br/>
	�����ּ�: <%=email %> <br/>
	<input type="text" size="30" name="vrfCode">
	<input type="button" value="�̸��� ����" id="emailcheck" onclick="send()">
	
	<br/>
	<p id="error_msg"></p>
	
</body>
</html>