<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String email = request.getParameter("email");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var left = (screen.width/2)-(250/2);
	var top = (screen.height/2)-(140/2);
	
	$('#emailcheck').click(function(){
		
		window.open("../member/emailcheck.jsp","idcheck","width=250,height=140,toolbar=no,statusbar=no,scrollbars=no, top="+top+", left="+left);
	})
	$('#nickcheck').click(function(){
		window.open("../member/nickcheck.jsp","nickcheck","width=250,height=140,toolbar=no,statusbar=no,scrollbars=no, top="+top+", left="+left);
	})
});

function validcheck(){
	
	var email=$('[name=email]').val();
	var nick=$('[name=nick]').val();
	var pwd=$('[name=pwd]').val();
	var pwd1=$('[name=pwd1]').val();
	
	if(email.trim()==""){
	    alert("�̸����� �Է����ּ���");
	    return false;
    } else if(nick.trim()==""){
    	alert("�г����� �Է����ּ���.");
    	return false;
    } else if(pwd.trim() !== pwd1.trim()){
		alert("�н����尡 ��ġ���� �ʽ��ϴ�.");
		return false;
	} 
}

</script>
</head>
<body>
	<center>
		<h3>ȸ������</h3>
		<form name="join_frm" method="post" onsubmit="return validcheck();" action="join_ok.jsp">
			<table id="table_content"> 
				<tr height="30">
					<td width="15%" align="right">�̸���</td>
					<td width="85%" align="left">
						<input type="text" size="30" readonly name="email">
						<input type="button" value="�ߺ�üũ" id="emailcheck">
					</td>
				</tr>
				<tr height="30">
					<td width="15%" align="right">�г���</td>
					<td width="85%" align="left">
						<input type="text" size="30" readonly name="nick">
						<input type="button" value="�ߺ�üũ" id="nickcheck">
					</td>
				</tr>
				<tr height="30">
					<td width="15%" align="right">Password</td>
					<td width="85%" align="left">
						<input type="password" size="12" name="pwd">
						&nbsp;���Է�
						<input type="password" size="12" name="pwd1">
					</td>
				</tr>			
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="����">
						<input type="button" value="���" onclick="javascript:history.back()"> <!--  -->
					</td>
				</tr>																				
			</table>
		</form>
	</center>
</body>
</html>
