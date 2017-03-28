<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.dao.*,java.io.*"%>
<jsp:useBean id="dao" class="board.dao.TeamDAO"/>

<%
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	
	TeamVO vo=dao.databoardFileInfoData(Integer.parseInt(no));
	
	boolean bCheck=dao.databoardDelete(Integer.parseInt(no), pwd);
	if(bCheck==true){
		try{
			if(vo.getFilesize()!=0){
				File file=new File("C:\\download\\"+vo.getFilename());
				file.delete();
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		response.sendRedirect("list.jsp");
		
	}else{
%>
		<script>
			alert("비밀번호가 다릅니다.");
			history.back();
		</script>
<%		
	}	
%>





