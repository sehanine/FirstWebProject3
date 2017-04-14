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

if(pass_check==true){
	dao.replyDelete(pageNum, idx);
	%>
		<script language=javascript>
  			self.window.alert("해당 글을 삭제하였습니다.");
  			location.href="content.jsp?page=<%=pageNum %>&curr=<%=curr %>";
 		</script>
	<%
}else{
	%>
	<script language=javascript>
	 self.window.alert("비밀번호를 틀렸습니다.");
		location.href="javascript:history.back()";
	</script>
<%
}
%>
