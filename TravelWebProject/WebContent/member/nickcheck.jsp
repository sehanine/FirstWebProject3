<%@page import="web.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int status = 0;
	String nickname = request.getParameter("id");
	if(nickname == null){
		status = 0;
	} else {
		status = 1;
	}
	
	MemberDAO dao = new MemberDAO();
	
	int count = dao.isValueExist(nickname, "nickname");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중복확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#checkBtn').click(function(){
		var nick=$('#nickname').val();
		if(nick.trim()==""){
			alert("닉네임을 입력하세요.");
			return;
		}
		$('#frm').submit();
	});
	
	
	$('#okBtn').click(function(){
		opener.join_frm.nick.value=$('#nickname').val();
		self.close();
	});
	
});

</script>
</head>
<body>
<center>
		<table id="table_content" width="240">
			<tr>
				<td align="left">
					<form action="nickcheck.jsp" method="post" id="frm">
						닉네임:<input type="text" name="id" size="10" id="nickname" value="<%=nickname!=null?nickname:""%>">
						<input type="button" value="중복확인" id="checkBtn">
					</form>
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<%
						if(count==0 && status==1){
					%>
						<font color="blue"><%=nickname %>는(은) 사용가능합니다.</font>
					<%		
						}else if(count==1 && status==1){
					%>
						<font color="red"><%=nickname %>는(은) 이미 사용중니다.</font>
					<%	
						}
					
						if(status==0){
					%>
							닉네임을 입력하세요.
					<%		
						}
					%>
				</td>
			</tr>
			
			<%
				if(count==0 && status==1){
			%>
				<tr>
					<td align="center">
						<input type="button" value="확인" id="okBtn">
					</td>
				</tr>
			<%					
				}
			%>
		</table>
	</center>
</body>
</html>