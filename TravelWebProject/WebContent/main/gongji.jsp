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
<link rel="stylesheet" type="text/css" href="../css/table.css">
</head>
<body>
	<br/><br/><br/><br/>
	<center>
		<table id="table_content" width="600">
			<tr>
				<td width="15%" align="center" bgcolor="#18BC9C">�̸�</td>
				<td width="20%" align="center"><%=vo.getName() %></td>
				<td width="15%" align="center" bgcolor="#18BC9C">�ۼ���</td>
				<td width="20%" align="center"><%=vo.getRegdate().toString() %></td>
				<td width="15%" align="center" bgcolor="#18BC9C">��ȸ��</td>
				<td width="15%" align="center"><%=vo.getHit() %></td>
			</tr>			
			<tr>
				<td width="20%" align="center" bgcolor="#18BC9C">����</td>
				<td colspan="5"><%=vo.getSubject() %></td>
			</tr>
			<tr>
				<td colspan="6" align="left" valign="top" height="200">
					<%=vo.getContent() %>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>









