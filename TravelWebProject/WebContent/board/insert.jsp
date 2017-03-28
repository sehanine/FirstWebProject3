<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">

</head>
<body>
	<center>
		<img alt="글쓰기" src="image/write1.jpg" width="300" height="50">
		<p>
		<form action="insert_ok.jsp" method="post" name="frm">
			<table id="table_content" width="500">
				<tr>
					<td width="20%" align="right">이름</td>
					<td width="80%" align="left">
						<input type="text" size="12" name="name">
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">이메일</td>
					<td width="80%" align="left">
						<input type="text" size="50" name="email">
					</td>
				</tr>		
				<tr>
					<td width="20%" align="right">제목</td>
					<td width="80%" align="left">
						<input type="text" size="50" name="subject">
					</td>
				</tr>	
				<tr>
					<td width="20%" align="right">내용</td>
					<td width="80%" align="left">
						<textarea rows="8" cols="52" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">비밀번호</td>
					<td width="80%" align="left">
						<input type="password" size="10" name="pwd">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글쓰기">
						<input type="button" value="취소"
							onclick="javascript:history.back()"> 
					</td>
				</tr>															
			</table>
		</form>
	</center>
</body>
</html>
















