<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/join.css">
<link rel="stylesheet" type="text/css" href="../js/join.js">
<link rel="stylesheet" type="text/css" href="../registerVailidator.js">
</head>
<body>
	<!-- multistep form -->
<form id="msform" method="post" onsubmit="return validcheck();" action="../member/join_ok.jsp">
  
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">회원가입</h2>
    <input type="text" name="email" id = "emailcheck" readonly placeholder="이메일" />
    <!-- <input type="button" id="emailcheck" class="email action-button" value="중복체크" />  -->
    <input type="nickname" name="nick" id="nickcheck" readonly placeholder="닉네임" />
   <!-- <input type="button" id="nickcheck" class="nick action-button" value="중복체크" />  --> 
    <input type="password" name="pwd" placeholder="비밀번호" />
    <input type="password" name="pwd1" placeholder="비밀번호 확인" />
    <input type="submit" name="submit" class="submit action-button" value="가입하기" />
  </fieldset>
 
</form>
</body>
</html>