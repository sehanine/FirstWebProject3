<%@page import="web.member.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int status = 0;
	String id = request.getParameter("id");
	if(id == null){
		status = 0;
	} else {
		status = 1;
	}

	//MemberDAO dao=MemberDAO.newInstance();
	
	//int count=dao.idCheck(id);
	int count = 0; // **** needs to be changed
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ߺ�Ȯ��</title>
<link rel="stylesheet" type="text/css" href="table.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#checkBtn').click(function(){
		var id=$('#id').val();
		if(id.trim()==""){
			alert("ID�� �Է��ϼ���.");
			$('#id').focus();
			return;
		}
		$('#frm').submit();
	});
	
	
	$('#okBtn').click(function(){
		opener.join_frm.id.value=$('#id').val();
		self.close();
	});
	
});

</script>
</head>
<body>
<center>
		<table id="table_content" width="220">
			<tr>
				<td align="left">
					<form action="idcheck.jsp" method="post" id="frm">
						ID:<input type="text" name="id" size="10" id="id" value="<%=id!=null?id:""%>">
						<input type="button" value="�ߺ�Ȯ��" id="checkBtn">
					</form>
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<%
						if(count==0 && status==1){
					%>
						<font color="blue"><%=id %>��(��) ��밡���մϴ�.</font>
					<%		
						}else if(count==1 && status==1){
					%>
						<font color="red"><%=id %>��(��) �̹� ����ߴϴ�.</font>
					<%	
						}
					
						if(status==0){
					%>
							�̸����� �Է��ϼ���.
					<%		
						}
					%>
				</td>
			</tr>
			
			<%
				if(count==0 && status==1){
			%>
				<tr>
					<td align="center">
						<input type="button" value="Ȯ��" id="okBtn">
					</td>
				</tr>
			<%					
				}
			%>
		</table>
	</center>
</body>
</html>