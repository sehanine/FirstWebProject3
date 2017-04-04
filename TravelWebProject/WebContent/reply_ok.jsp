<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="web.dao.*, java.util.ArrayList, com.sist.reply.*"%>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("commentParentName");
String password = request.getParameter("commentParentPassword");
String memo = request.getParameter("memo");
String pageNum = request.getParameter("page");
String curr = request.getParameter("curr");
 ReplyDAO dao=new ReplyDAO();
ReplyVO vo = new ReplyVO();
vo.setFesno(Integer.parseInt(pageNum));
vo.setReply_name(name);
vo.setReply_pass(password);
vo.setReply_comment(memo);
dao.replyInsert(vo);
%>
<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다."); 
  location.href="content.jsp?page=<%=pageNum %>&curr=<%=curr %>";
  
</script>

