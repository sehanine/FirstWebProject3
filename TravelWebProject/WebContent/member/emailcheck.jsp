<%@page import="web.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int status = 0;
	String email = request.getParameter("id"); // javascript의 밸류
	
	if(email == null){
		status = 0;
	} else {
		status = 1;
	}
	
	MemberDAO dao = new MemberDAO();
	int count = dao.isValueExist(email, "email");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>닉네임 중복 확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/join.css">
<script type="text/javascript">
function validcheck(){
	var nick=$('#email').val();
	if(nick.trim()==""){
		alert("닉네임을 입력하세요.");
		$('#email').focus();		
		return false;
	}		
	return true;
}

$(function(){
	$('#email').change(function(){
		location.href = "emailcheck.jsp";
		$('#email').focus();
	});
	$('#okBtn').click(function(){
		opener.msform.email.value=$('#email').val();
		self.close();
	});
});

</script>
</head>
<body>
	<!-- multistep form -->
<form onsubmit="return validcheck();" action="emailcheck.jsp" method="post" id="msform">
  
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">이메일 중복 확인</h2>
    <input type="text" name="id" id="email" placeholder="닉네임" value="<%=email!=null?email:""%>"/>
  	<p align="center">
			<%
				if(count==0 && status==1){
			%>
				<font color="blue"><%=email %>는(은) 사용 가능합니다.</font>
			<%		
				}else if(count==1 && status==1){
			%>
				<font color="red"><%=email %>는(은) 이미 사용중니다.</font>
			<%	
				}
			
				if(status==0){
			%>
					이메일을 입력하세요.
			<%		
				}
			%>
	</p>
  	<%
		if(count==0 && status==1){
	%>
			<input type="button" class="submit action-button" onclick="" value="확인" id="okBtn">
	<%					
		} else{
	%>
    		<input type="submit" class="submit action-button" value="중복확인" id="checkBtn"/>
  	<%
		}
  	%>
  </fieldset>
  <script type="text/javascript">
  	$('#email').focus();
  </script>
 
</form>
</body>
</html>