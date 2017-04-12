<%@page import="web.change.JspChange"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String email = session.getAttribute("email").toString();
	// 관련 정보 받아오기
	String mode=request.getParameter("mode");
	if(mode==null)
		mode="0";
	String jsp=JspChange.change(Integer.parseInt(mode));
	//String log_jsp="";
%>
<!DOCTYPE html>
<html>
<title>마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/mypage.css">
<body>

<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none" id="mySidebar">
  <button onclick="w3_close()" class="w3-bar-item w3-large">닫기 &times;</button>
  <a href="mypage.jsp?mode=0" class="w3-bar-item w3-button">마이페이지</a>
  <a href="mypage.jsp?mode=1" class="w3-bar-item w3-button">댓글 관리</a>
  <a href="mypage.jsp?mode=2" class="w3-bar-item w3-button">즐겨찾기 관리</a>
  <a href="mypage.jsp?mode=3" class="w3-bar-item w3-button">개인정보 수정</a>
</div>

<!-- Page Content -->
<div class="w3-teal">
  <button class="w3-button w3-teal w3-xlarge" onclick="w3_open()"><img alt="sidebar" src="../img/sidebar_button.png" width="30px"/></button>
  <div class="w3-container">
    <h1>마이페이지</h1>
  </div>
</div>
<jsp:include page="<%=jsp %>"></jsp:include>

<div class="w3-container">
<p><%=email %>의 마이페이지</p>
</div>

<script>
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}
</script>
     
</body>
</html> 