<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <%
 	int pageNum = Integer.parseInt(request.getParameter("page"));
	int curr = Integer.parseInt(request.getParameter("curr"));
 	int idx = Integer.parseInt(request.getParameter("idx"));
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<script type="text/javascript">  // 자바 스크립트 시작

function deleteCheck()
  {
   var form = document.deleteform;
   
   if( !form.password.value )
   {
    alert( "비밀번호를 입력하세요" );
    form.password.focus();
    return;
   }
 		form.submit();
  }
 </script>

 </head>
 <body>
<center>
<form name=deleteform method=post action="delete_ok.jsp?pageNum=<%=pageNum%>&curr=<%=curr%>&idx=<%=idx%>">
   <table>
   		<tr>
   			<td>
   			&nbsp;
   			</td>
   		</tr>
   </table>
   <table>
     <tr>
      <td align="center">비밀번호</td>
      <td><input name="password" type="password" size="30" maxlength="100"></td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="삭제" OnClick="javascript:deleteCheck();">
       <input type=button value="취소" OnClick="javascript:parent.Shadowbox.close();">
      <td>&nbsp;</td>
     </tr>
    </table>
  
  </form>
</center>

</body> 
</html>