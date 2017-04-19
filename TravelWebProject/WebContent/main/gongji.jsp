<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.dao.*"%>
    
<%
	//1.사용자 요청 데이터  content.jsp?no=20&
	String no=request.getParameter("no");
	//2.DAO 연결
	TeamDAO dao=TeamDAO.newInstance();
	//3.DB에서 데이터 얻기
	TeamVO vo=dao.boardContent(Integer.parseInt(no), 1);
	//4.출력
	
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
				<td width="15%" align="center" bgcolor="#18BC9C">이름</td>
				<td width="20%" align="center"><%=vo.getName() %></td>
				<td width="15%" align="center" bgcolor="#18BC9C">작성일</td>
				<td width="20%" align="center"><%=vo.getRegdate().toString() %></td>
				<td width="15%" align="center" bgcolor="#18BC9C">조회수</td>
				<td width="15%" align="center"><%=vo.getHit() %></td>
			</tr>			
			<tr>
				<td width="20%" align="center" bgcolor="#18BC9C">제목</td>
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









