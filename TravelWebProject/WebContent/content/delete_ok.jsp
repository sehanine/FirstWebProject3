<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="web.dao.*, java.util.ArrayList, com.sist.reply.*"%>
<%
request.setCharacterEncoding("UTF-8");
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
int curr = Integer.parseInt(request.getParameter("curr"));
int idx = Integer.parseInt(request.getParameter("idx"))+1;
String pass = request.getParameter("password");

ReplyDAO dao=new ReplyDAO();
boolean pass_check=dao.replyPassCheck(pageNum,idx,pass);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../shadow/css/table.css">
<%
if(pass_check==true){
	dao.replyDelete(pageNum, idx);
	%>
		<script type="text/javascript">
			parent.location.href="content.jsp?page=<%=pageNum %>&curr=<%=curr %>";
  			parent.Shadowbox.close();
  		</script>
	<%
}else{
	%>
	
	<script language=javascript>
		self.window.alert("비밀번호가 일치하지 않습니다.");
		location.href="javascript:history.back()";
	</script>
<%
}
%>
