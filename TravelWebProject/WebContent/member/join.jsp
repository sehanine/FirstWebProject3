<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
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
    <h2 class="fs-title">ȸ������</h2>
    <input type="text" name="email" id = "emailcheck" readonly placeholder="�̸���" />
    <!-- <input type="button" id="emailcheck" class="email action-button" value="�ߺ�üũ" />  -->
    <input type="nickname" name="nick" id="nickcheck" readonly placeholder="�г���" />
   <!-- <input type="button" id="nickcheck" class="nick action-button" value="�ߺ�üũ" />  --> 
    <input type="password" name="pwd" placeholder="��й�ȣ" />
    <input type="password" name="pwd1" placeholder="��й�ȣ Ȯ��" />
    <input type="submit" name="submit" class="submit action-button" value="�����ϱ�" />
  </fieldset>
 
</form>
</body>
</html>