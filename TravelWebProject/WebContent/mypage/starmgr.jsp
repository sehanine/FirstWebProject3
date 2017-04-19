<%@page import="web.star.dao.*, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String email = (String) session.getAttribute("email");
	StarDAO dao = new StarDAO();
	List<StarVO> list = dao.getAllData(email);
	int size = list.size();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>즐겨찾기 관리</title>
<!-- source from http://bootsnipp.com/snippets/featured/event-list -->
<link rel="stylesheet" type="text/css" href="../css/starmgr.css">
<link rel="stylesheet" href="../css/tiny-toggle.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../js/tiny-toggle.js"></script>
<script type="text/javascript">

$(function(){
	var size = <%=size%>;
	var i;
	for(i = 0; i < size; i++){
		$('#star'+i).tinyToggle();
	}
	$('.tiny-toggle').tinyToggle("event", "onCheck", function() {
		var fesno = $(this).attr('value');
		var vo = {"email": "<%=email%>", "fesno": fesno};
		$.ajax({
			type: "POST",
			url: "../star/star.jsp",
			data: vo
		})
		// console.log("onCheck Input now is TRUE " + id + " fesno: " + fesno );
	});
	$('.tiny-toggle').tinyToggle("event", "onUncheck", function() {
		var fesno = $(this).attr('value');
		var vo = {"email": "<%=email%>", "fesno": fesno};
		$.ajax({
			type: "POST",
			url: "../star/unstar.jsp",
			data: vo
		})
		//console.log("onUncheck Input now is FALSE " + id + " fesno: " + value );  
	});
});

</script>
</head>
<body>
	<h3 class="page_name">즐겨찾기 관리</h3>
	 <div class="container">
		<div class="row">
			<div class="[ col-xs-12 col-sm-offset-2 col-sm-8 ]">
				<ul class="event-list">
					<%
						for(int i = 0; i < size; i++){
							StarVO vo = list.get(i);
					%>
					<li>
						<time datetime="<%=vo.getYear()%>-<%=vo.getMonth()%>-<%=vo.getDate()%>">
							<span class="month"><%=vo.getMonth() %></span>
							<span class="day"><%=vo.getDate() %></span>
							<span class="year"><%=vo.getYear() %></span>
						</time>
						<img alt="<%=vo.getMaintitle() %>" src="<%=vo.getImage() %>" />
						<div class="info">
							<h2 class="title"><%=vo.getMaintitle() %> 
							</h2>
							<p class="desc"><%=vo.getMainloc() + " " + vo.getFesdate() %>
							<input id="star<%=i%>" name="my_option" type="checkbox" class="tiny-toggle" 
							data-tt-type="star" data-tt-size="large" value="<%=vo.getFesno()%>"
							checked style="margin-left: 102%"></p>
							
							<ul>
								<li style="width:50%;"><a onclick="parent.location.href='../content/content.jsp?page=<%=vo.getFesno() %>';parent.Shadowbox.close();"><span class="fa fa-globe"></span>행사정보</a></li>
								<li style="width:50%;"><span class="fa fa-envelope"></span> <%=dao.getReplyCount(vo.getFesno()) %></li>
							</ul>
						</div>
					
						<div class="social">
							<ul>
								<li class="facebook" style="width:33%;">
								<a onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=http://211.238.142.230:8080/TravelWebProject/main/main.jsp?page=<%=vo.getFesno() %>', '_blank', 'location=yes,height=330,width=520,scrollbars=yes,status=yes');">
								<span class="fa fa-facebook"></span></a></li>
								<li class="twitter" style="width:34%;">
								<a onclick="window.open('https://twitter.com/home?status=http://211.238.142.230:8080/TravelWebProject/main/main.jsp?page=<%=vo.getFesno() %>', '_blank', 'location=yes,height=430,width=610,scrollbars=yes,status=yes');">
								<span class="fa fa-twitter"></span></a></li>
								<li class="google-plus" style="width:33%;">
								<a onclick="window.open('https://plus.google.com/share?url=http://211.238.142.230:8080/TravelWebProject/main/main.jsp?page=<%=vo.getFesno() %>', '_blank', 'location=yes,height=770,width=520,scrollbars=yes,status=yes');">
								<span class="fa fa-google-plus"></span></a></li>
							</ul>
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
<style>
	.tt-icon i{
		margin-left:93%;
	}
</style>
</html>