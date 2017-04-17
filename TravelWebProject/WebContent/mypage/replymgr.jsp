<%@page import="oracle.net.aso.q"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import ="web.dao.*, java.util.*, com.sist.reply.*, web.member.*"%>
<%
	String email = (String) session.getAttribute("email");
	ReplyDAO re_dao= new ReplyDAO();
	ArrayList<ReplyVO> re_list = re_dao.emailListData(email);
	
	Date currentTime = new Date ( );
	String compare="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/starmgr.css">
</head>
<body>
	<h3 class="page_name">댓글 관리</h3>
	<div class="container">
		<div class="row">
			<div class="[ col-xs-12 col-sm-offset-2 col-sm-8 ]">
				<ul class="event-list">
					<%
						for(ReplyVO vo: re_list){
							if(currentTime.getYear()-vo.getReply_regdate().getYear()!=0){
								compare=currentTime.getYear()-vo.getReply_regdate().getYear()+"년전";
							}else if(currentTime.getMonth()-vo.getReply_regdate().getMonth()!=0){
								compare=currentTime.getMonth()-vo.getReply_regdate().getMonth()+"달전";
							}else if(currentTime.getDay()-vo.getReply_regdate().getDay()!=0){
								compare=currentTime.getMonth()-vo.getReply_regdate().getMonth()+"일전";
							}else{
								compare="오늘";
							}
					%>
					<li>
						<div class="info">
							<h2 class="title"><%=vo.getTitle() %></h2>
							<span class="compare"><%=compare %></span>
							<span class="date"><%=vo.getReply_regdate() %></span>
							<p class="comment"><%=vo.getReply_comment() %></p>
						</div>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>