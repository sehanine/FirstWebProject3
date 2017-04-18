<%@page import="oracle.net.aso.q"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import ="web.dao.*, java.util.*, com.sist.reply.*, web.member.*"%>
<%
	String email = (String) session.getAttribute("email");
	ReplyDAO re_dao= new ReplyDAO();
	ArrayList<ReplyVO> re_list = re_dao.emailListData(email);
	
	Date currentTime = new Date ( );
	String compare="";
	int size = re_list.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../vendor/font-awesome/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/starmgr.css">
<link rel="stylesheet" href="../css/tiny-toggle.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../js/tiny-toggle.js"></script>
<script type="text/javascript">
$(function(){
	var size = <%=size%>;
	var i;
	for(i = 0; i < size; i++){
		$('#trash'+i).click();
	}

	$('.fa.fa-trash-o.fa-lg').click(function(){
		if (confirm('리플을 삭제 하겠습니까?')) {
			var replyid = $(this).attr('value');
			var vo = {"replyid": replyid};
			
			$.ajax({
				type: "POST",
				url: "reply/delete_ok.jsp",
				data: vo
			}) 
			location.reload(true);
		}
	});
	
});
</script>
</head>
<body>
	<h3 class="page_name">댓글 관리</h3>
	<div class="container">
		<div class="row">
			<div class="[ col-xs-12 col-sm-offset-2 col-sm-8 ]">
				<ul class="event-list">
					<%
						for(int i = 0; i < size; i++){	
					//for(ReplyVO vo: re_list){
							ReplyVO vo = re_list.get(i);
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
							<p class="comment"><%=vo.getReply_comment() %>
						<!-- 
							<input id="check<%=i%>" name="my_option" type="checkbox" class="tiny-toggle" 
							data-tt-icon-check="fa fa-trash-o"
							data-tt-icon
							data-tt-size="large" 
							value="<%=vo.getReply_ID()%>" checked></p>
							 -->
							 <i class="fa fa-trash-o fa-lg" id="trash<%=i %>" value="<%=vo.getReply_ID()%>" style="margin-left: 102%"></i>
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