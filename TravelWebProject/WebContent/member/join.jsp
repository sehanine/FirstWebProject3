<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="table.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#btn').click(function(){
		var left = (screen.width/2)-(250/2);
		var top = (screen.height/2)-(150/2);
		  
		window.open("../member/idcheck.jsp","idcheck","width=250,height=150,toolbar=no,statusbar=no,scrollbars=no, top="+top+", left="+left);
	})
	
	$('#email').change(function(){
		var data=$('#email').val();
		$('#site').val(data);
	});
});

</script>
</head>
<body>
	<center>
		<h3>회원가입</h3>
		<form name="join_frm" action="../member/join_ok.jsp" method="post">
			<table id="table_content">
				<tr height="30">
						<td width="15%" align="right">이메일</td>
						<td width="85%" align="left">
							<input type="text" size="30" name="email">
							<input type="button" value="중복체크" id="btn">
						</td>
				</tr>
				
				<tr height="30">
					<td width="15%" align="right">Password</td>
					<td width="85%" align="left">
						<input type="password" size="12" name="pwd">
						&nbsp;재입력
						<input type="password" size="12" name="pwd1">
					</td>
				</tr>			
				<tr height="30">
					<td width="15%" align="right">이름</td>
					<td width="85%" align="left">
						<input type="text" size="12" name="name">
					</td>
				</tr>		
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="가입">
						<input type="button" value="취소" onclick="javascript:history.back()">
					</td>
				</tr>																				
			</table>
		</form>
	</center>
</body>
</html>
