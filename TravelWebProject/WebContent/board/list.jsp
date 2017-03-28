<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,board.dao.*,java.text.*"%>
    
<%
	String strPage=request.getParameter("page");
	if(strPage==null)
		strPage="1";
	int curpage=Integer.parseInt(strPage);
	
	TeamDAO dao=new TeamDAO();
	List<TeamVO> list=dao.boardListData(curpage);
	int totalpage=dao.boardTotalPage();
	int count=dao.boardRowCount();
	
	count=count-((curpage*10)-10);		
	
	int total=dao.boardTotalPage();
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<style type="text/css">
	td,th{
		font-family: ���� ���;
		font-size: 9pt;
	}
	a{
		text-decoration: none;
		color: black;
	}
	a:HOVER {
		text-decoration: underline;
		color: green;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#findBtn').click(function(){
			var ss=$('#ss').val();
			$('#print').html("");
			if(ss==""){
				$('#print').html("<font color=red>�˻��� �Է�</font>");
				$('#ss').focus();
				return;
			}
			$('#ff').submit();
		});
	});
</script>
</head>
<body>
	<center>
		<h3>FESTIGO�Խ���</h3>
		<p>
		<table width="700" border="0" id="abc">
			<tr>
				<td align="left">
					<a href="insert.jsp">
					<img alt="�۾���" src="image/bt_write.jpg" border="0"></a>
				</td>
			</tr>
		</table>
		
		<table width="700" id="table_content">
			<tr bgcolor="#ccccff" height="27">
				<th width="10%">��ȣ</th>
				<th width="45%">����</th>
				<th width="15%">�̸�</th>
				<th width="20%">�ۼ���</th>
				<th width="10%">��ȸ��</th>
			</tr>
			<%
				int i=0;
				String color="white";
				for(TeamVO vo:list){
					if(i%2==0) color="white";
					else color="ivory";
			%>
				<tr bgcolor="<%=color%>" height="27" id="dataTr">
					<td width="10%" align="center"><%=count-- %></td>
					<td width="45%" align="left">
						<%
							if(vo.getGroup_tab()!=0){
								for(int j=0;j<vo.getGroup_tab();j++){
									out.write("&nbsp;&nbsp;");
								}
						%>
								<img alt="�ٽ�" src="image/icon_reply.gif">&nbsp;
						<%		
							}
							String msg="�����ڿ� ���� ������ �Խù��Դϴ�.";
							if(msg.equals(vo.getSubject())){
						%>
							<span style="color: gray;cursor: default;"><%=vo.getSubject() %></span>
						<%		
							}else{
						%>
								<a href="content.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
						<%		
							}
							SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
							String today=sdf.format(new Date());
							String dbday=vo.getRegdate().toString();
							//2017-03-09
							if(today.equals(dbday)){
						%>
								<sup><img alt="����" src="image/new.gif"></sup>
						<%		
							}
						%>
					</td>
					<td width="15%" align="center"><%=vo.getName() %></td>
					<td width="20%" align="center"><%=vo.getRegdate().toString() %></td>
					<td width="10%" align="center"><%=vo.getHit() %></td>
				</tr>
			
			<%	
				i++;
				}
			%>
		</table>
		
		<table width="700" border="0" id="abc">
			<tr align="left">
				<td>
					<form method="post" action="find.jsp" id="ff">
					Search:<select name="fs">
								<option value="name">�̸�</option>
								<option value="subject">����</option>
								<option value="content">����</option>
							</select>
							<input type="text" size="10" name="ss" id="ss">
							<input type="button" value="ã��" id="findBtn">	
							<span id="print"></span>
					</form>				
				</td>
				<td align="right">
					<a href="list.jsp?page=1">
						<img alt="�Ǿ�����" src="image/btn_pageFirst.gif">
					</a>
					<a href="list.jsp?page=<%=curpage>1?curpage-1:curpage%>">
						<img alt="������" src="image/btn_pagePrev.gif">
					</a>
					
				<%
					for(i=1;i<=totalpage;i++){
				%>
						[<a href="list.jsp?page=<%=i %>"><%=i %></a>]
				<%						
					}
				%>		
				
					<a href="list.jsp?page=<%=curpage<totalpage?curpage+1:curpage%>">
						<img alt="�ڷ�" src="image/btn_pageNext.gif">
					</a>
					<a href="list.jsp?page=<%=total%>">
						<img alt="�ǵڷ�" src="image/btn_pageLast.gif">
					</a>
					&nbsp;&nbsp;
					<%=curpage %>	page / <%=totalpage %>	pages					
				</td>
			</tr>
		</table>
	</center>
</body>
</html>




















