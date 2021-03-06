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
	// ------------------------지울것 --------------------------------------
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
		
		alert("가입을 축하합니다.");
		
		parent.Shadowbox.close();
		
	} else{
		document.getElementById("error_msg").innerHTML = "인증코드가 일치하지 않습니다.";
	}
	
}
</script>
</head>
<body>
	이메일을 인증해 주세요.<br/>
	보낸주소: <%=email %> <br/>
	<input type="text" size="30" name="vrfCode">
	<input type="button" value="이메일 인증" id="emailcheck" onclick="send()">
	
	<br/>
	<p id="error_msg"></p>
	
</body>
</html>