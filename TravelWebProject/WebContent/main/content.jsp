<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.dao.*"%>
    
<%
	//1.����� ��û ������  content.jsp?no=20&
	String no=request.getParameter("no");
	//2.DAO ����
	TeamDAO dao=TeamDAO.newInstance();
	//3.DB���� ������ ���
	TeamVO vo=dao.boardContent(Integer.parseInt(no), 1);
	//4.���
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
var i=0;
$(function(){
	$('#delBtn').click(function(){
		if(i==0)
		{
			$('#del').show();
			i=1;
		}
		else
		{
			$('#del').hide();
			i=0;
		}
	});
});	
</script>
<link rel="stylesheet" type="text/css" href="table.css">
</head>
<body>
	<center>
		<img alt="���뺸��" src="image/content.jpg" width="300" height="50">
		<p>
		<table id="table_content" width="600">
			<tr>
				<td width="20%" align="center" bgcolor="#ccccff">��ȣ</td>
				<td width="30%" align="center"><%=vo.getNo() %></td>
				<td width="20%" align="center" bgcolor="#ccccff">�ۼ���</td>
				<td width="30%" align="center"><%=vo.getRegdate().toString() %></td>
			</tr>
			<tr>
				<td width="20%" align="center" bgcolor="#ccccff">�̸�</td>
				<td width="30%" align="center"><%=vo.getName() %></td>
				<td width="20%" align="center" bgcolor="#ccccff">��ȸ��</td>
				<td width="30%" align="center"><%=vo.getHit() %></td>
			</tr>			
			<tr>
				<td width="20%" align="center" bgcolor="#ccccff">����</td>
				<td colspan="3"><%=vo.getSubject() %></td>
			</tr>
			<tr>
				<td colspan="4" align="left" valign="top" height="200">
					<%=vo.getContent() %>
				</td>
			</tr>
		</table>
		
		<table border="0" width="600">
			<tr>
				<td align="right">
					<a href="reply.jsp?no=<%=no%>">
						<img alt="��۾���" src="image/reply.gif">
					</a>
					<a href="update.jsp?no=<%=no%>">
						<img alt="�����ϱ�" src="image/modify.gif">
					</a>
					<img alt="�����ϱ�" src="image/delete.gif" id="delBtn">
					<a href="list.jsp">
						<img alt="����Ʈ" src="image/list.gif">
					</a>										
				</td>
			</tr>
			
		     <tr id="del" style="display:none">
		      <td align=right>
		       <form method="POST" action="delete_ok.jsp">
		      ��й�ȣ:<input type="password" size=10 name="pwd">
		        <input type="hidden" name="no" value="<%=no%>">
		        <input type="submit" value="����">
		       </form>
		      </td>
		     </tr>			
		</table>
	</center>
</body>
</html>









