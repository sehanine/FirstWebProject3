<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.dao.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String no=request.getParameter("no");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	
	TeamVO vo=new TeamVO();
	vo.setNo(Integer.parseInt(no));
	vo.setName(name);
	vo.setEmail(email);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	//DB 연동
	TeamDAO dao=TeamDAO.newInstance();
	boolean bCheck=dao.boardUpdate(vo);
	if(bCheck==false){
%>
	<script>
		alert("비밀번호가 틀립니다\n다시 입력하세요.");
		history.back();
	</script>
<%		
	}else{
		response.sendRedirect("content.jsp?no="+no);
	}
	
%>	









