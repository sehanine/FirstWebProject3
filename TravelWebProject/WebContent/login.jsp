<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form method = "post" action = "inputPro.jsp" name = "userinput" onSubmit = "return checkIt()">
<table width = "700" border = "1" cellspacing = "0" cellpadding = "3" align = "center">
<tr>
      <td colspan = "2" height = "39" align = "center">
      <font size = "+1"><b>회원가입</b></font></td>
</tr>

<tr>
      <td width = "300">사용자 ID</td>
      <td width = "400">
            <input type = "text" name = "id" size = "10" maxlength = "12">
            <input type = "button" name = "confirm_id" value = "ID중복확인"
                  onclick = "openConfirmid(this.form)">
      </td>
</tr>
<tr>
      <td width = "300">비밀번호</td>
      <td width = "400">
            <input type = "password" name = "passwd" size = "15" maxlength = "12">
      </td>
</tr>
<tr>
      <td width = "300">비밀번호 확인</td>
      <td width = "400">
            <input type = "password" name = "passwd2" size = "15" maxlength = "12">
      </td>
</tr>

<tr>
      <td width = "300">사용자 이름</td>
      <td width = "400">
            <input type = "text" name = "name" size = "15" maxlength = "10">
      </td>
</tr>

<tr>
      <td width = "300">E-Mail</td>
      <td width = "400">
            <input type = "text" name = "email" size = "40" maxlength = "30">
      </td>
</tr>



</table>
</form>


</body>
</html>