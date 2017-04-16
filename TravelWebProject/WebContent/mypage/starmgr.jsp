<%@page import="web.star.dao.*, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String email = (String) session.getAttribute("email");
	StarDAO dao = new StarDAO();
	List<StarVO> list = dao.getAllData(email);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- source from http://bootsnipp.com/snippets/featured/event-list -->
<link rel="stylesheet" type="text/css" href="../css/starmgr.css">
</head>
<body>
	<h3 class="page_name">즐겨찾기 관리</h3>
	 <div class="container">
		<div class="row">
			<div class="[ col-xs-12 col-sm-offset-2 col-sm-8 ]">
				<ul class="event-list">
					<%
						for(StarVO vo: list){
					%>
					<li>
						<time datetime="<%=vo.getYear()%>-<%=vo.getMonth()%>-<%=vo.getDate()%>">
							<span class="month"><%=vo.getMonth() %></span>
							<span class="day"><%=vo.getDate() %></span>
							<span class="year"><%=vo.getYear() %></span>
						</time>
						<img alt="<%=vo.getMaintitle() %>" src="<%=vo.getImage() %>" />
						<div class="info">
							<h2 class="title"><%=vo.getMaintitle() %></h2>
							<p class="desc"><%=vo.getMainloc() + " " + vo.getFesdate() %></p>
						</div>
						<div class="social">
							<ul>
								<li class="facebook" style="width:33%;"><a href="#facebook"><span class="fa fa-facebook"></span></a></li>
								<li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-twitter"></span></a></li>
								<li class="google-plus" style="width:33%;"><a href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
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
</html>