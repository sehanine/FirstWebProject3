<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script language = "javascript">  // �ڹ� ��ũ��Ʈ ����

function deleteCheck()
  {
   var form = document.deleteform;
   
   if( !form.password.value )
   {
    alert( "��й�ȣ�� �����ּ���" );
    form.password.focus();
    return;
   }
 		form.submit();
  }
 </script>
 <%
 	int pageNum = Integer.parseInt(request.getParameter("page"));
	int curr = Integer.parseInt(request.getParameter("curr"));
 	int idx = Integer.parseInt(request.getParameter("idx"));
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>�Խ���</title>
 <style type="text/css">
 
 </style>
 </head>
 <body>
<table>
<center>
<form name=deleteform method=post action="delete_ok.jsp?pageNum=<%=pageNum%>&curr=<%=curr%>&idx=<%=idx%>">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="repeat-x; text-align:center;">
      <td>��� ����</td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">��й�ȣ</td>
      <td><input name="password" type="password" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="����" OnClick="javascript:deleteCheck();">
       <input type=button value="���" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
 </center>
</body> 
</html>