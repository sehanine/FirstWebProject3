<%@page import="web.member.RandomNumGen"%>
<%@page import="web.member.JavaMailAPI"%>
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
	//JavaMailAPI mailAPI = new JavaMailAPI(email, ranNum, nick, pwd);
	// ------------------------����� --------------------------------------
	System.out.println("join_ok.jsp ranNum: " + ranNum);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/join.css">
<link rel="stylesheet" type="text/css" href="../js/join.js">
<script type="text/javascript">

function validcheck(){
	var ranNum = <%= ranNum%>;
	var vrfCode=$('[name=vrfCode]').val();
	if(ranNum == vrfCode){
		alert("������ �����մϴ�.");
		send();
		return true;
	} else{
		document.getElementById("error_msg").innerHTML = "�����ڵ尡 ��ġ���� �ʽ��ϴ�.";
		return false;
	}
}
function send(){
	var vo = {"email": "<%=email%>","nick": "<%=nick%>","pwd": "<%=pwd%>"};
	$.ajax({
		type: "POST",
		url: "member_ok.jsp",
		data: vo
	})
	parent.Shadowbox.close();	
}
</script>
</head>
<body>
	<!-- multistep form -->
<form id="msform" onsubmit="return validcheck();" >
  
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">�̸��� ����</h2>
    	�̸����� ������ �ּ���.<br/>
		�����ּ�: <%=email %> <br/><br/>
		<input type="text" size="30" name="vrfCode" placeholder="�����ڵ�">
		<p id="error_msg"></p>
		<input type="button" value="�̸��� ����" class="verification action-button" id="okBtn">
  </fieldset>
  	
 
</form>
</body>
</html>