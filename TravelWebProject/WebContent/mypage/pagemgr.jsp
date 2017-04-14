<%@page import="web.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MemberDAO dao = new MemberDAO();	
	String email = (String) session.getAttribute("email");
	String nick = dao.getValue(email, "nickname", "email");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	var w = 250;
	var h = 140;
	$('#nickcheck').click(function(){
		var left = (screen.width/2)-(w/2);
		var top = (screen.height/2)-(h/2);
		window.open("mgrnickcheck.jsp","nickcheck","width=250,height=140,toolbar=no,statusbar=no,scrollbars=no, top="+top+", left="+left);
	})
});

</script>
</head>
<body>
	<form name="join_frm" method="post" action="update.jsp">
			<table id="table_content"> 
				<tr height="30">
					<td width="15%" align="right">이메일</td>
					<td width="85%" align="left">
						<input type="text" size="30" readonly name="email" value="<%=email%>">
					</td>
				</tr>
				<tr height="30">
					<td width="15%" align="right">닉네임</td>
					<td width="80%" align="left">
						<input type="text" size="30" readonly name="nickname" value="<%=nick %>">
						<input type="button" value="중복체크" id="nickcheck">
					</td>
				</tr>
				<tr height="30">
					<td width="15%" align="right">프로필사진</td>
					<td width="80%" align="left">
						<input type="text" size="30" name="pic">
						&nbsp;
					</td>
				</tr>	
				<tr height="30">
					<td width="20%" align="right">소개</td>
					<td width="80%" align="left">
					<textarea rows="8" cols="31" name="coment"></textarea>
					</td>	
				</tr>			
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="변경">
						<input type="button" value="취소" onclick="javascript:history.back()"> <!--  -->
					</td>
				</tr>																				
			</table>
		</form>
</body>
</html>