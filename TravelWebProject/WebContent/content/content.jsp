<%@page import="web.star.dao.StarDAO"%>
<%@page import="com.sist.reply.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="web.dao.*, java.util.ArrayList, com.sist.reply.*, web.member.*"%>

<%
	String pageNum = request.getParameter("page");
	String curr = request.getParameter("curr");
	if(pageNum == null){
		pageNum = "1";
	}   
	if(curr == null){
		curr = "1";
	}
	
	int TITLE_INDEX_NUMBER = 0;
	int fesno = Integer.parseInt(pageNum);
	int curPage = Integer.parseInt(curr);
	QueryDAO dao = new QueryDAO();
	ArrayList<String> image_list = dao.getImage_list(fesno);
	ArrayList<String> main_list = dao.getMainVO(fesno);
	ArrayList<ListVO> first_list = dao.getFirst_list(fesno);
	ArrayList<ListVO> second_list = dao.getSecond_list(fesno);
	ArrayList<ListVO> third_list = dao.getThird_list(fesno);
	
	ReplyDAO re_dao = new ReplyDAO();
	ArrayList<ReplyVO> re_list = re_dao.replyListData(fesno);
	
	String email="";
	try{
		email= session.getAttribute("email").toString();
	}catch(Exception ex){
	}
	MemberDAO member;
	String nick="";
	String pwd="";
	
	boolean login_check=false;
	if(email!=""){
		login_check=true;
		member = new MemberDAO();
		nick = member.getValue(email, "nickname", "email");
		pwd = member.getValue(email, "pwd", "email");	
	}
	// get star 
	StarDAO sdao = new StarDAO();
	String star = sdao.isStarred(fesno, email);
	// star = dao.getisstared()
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= main_list.get(TITLE_INDEX_NUMBER)%></title>
	<!--  
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	 -->
 
<link rel="stylesheet" href="../css/freelancer.min.css">
<link rel="stylesheet" href="../vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" type="text/css">
<link rel="stylesheet" href="../css/update.css">
<link rel="stylesheet" href="../css/event1.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/owl.theme.green.min.css">
<link rel="stylesheet" href="../css/owl.theme.green.css">
<link rel="stylesheet" href="../css/tiny-toggle.css">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- shadow box javascript -->
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<style type="text/css">
ul { list-style:none; }
.status_msg p{
line-height: 1.5;
}
</style>
<script type="text/javascript">
Shadowbox.init({
	players:["iframe"]
});

function boxopen(url, name, w, h) {
	  Shadowbox.open({
		  content: url,
		  player:'iframe',
		  title: name,
		  width: w,
		  height: h
	  });
	  return;
};
function writeCheck()
{
	var form = document.writeform; 
	
	if( !form.commentParentName.value ){ // form 에 있는 name 값이 없을 때 
		alert( "이름을 적어주세요" ); // 경고창 띄움 
		form.name.focus(); // form 에 있는 name 위치로 이동 
		return; 
	} 
	
	if( !form.commentParentPassword.value ) { 
		alert( "비밀번호를 적어주세요" ); 
		form.password.focus(); 
		return; } 
	if( !form.memo.value ) { 
		alert( "내용을 적어주세요" ); 
		form.memo.focus(); 
		return; 
	} 
		
		form.submit(); 
}

$(function(){
	$('#star').tinyToggle();
	$("#star").tinyToggle("event", "onCheck", function() {
		var vo = {"email": "<%=email%>", "fesno": "<%=fesno%>"};
		$.ajax({
			type: "POST",
			url: "../star/star.jsp",
			data: vo
		})
		document.getElementById("star_msg").innerHTML = "행사가 즐겨찾기에 추가 되었습니다.";
		document.getElementById("unstar_msg").innerHTML = "";
	});
	$("#star").tinyToggle("event", "onUncheck", function() {
		var vo = {"email": "<%=email%>", "fesno": "<%=fesno%>"};
		$.ajax({
			type: "POST",
			url: "../star/unstar.jsp",
			data: vo
		})
		document.getElementById("star_msg").innerHTML = "";
		document.getElementById("unstar_msg").innerHTML = "행사가 즐겨찾기에서 해제 되었습니다.";
	});
});

</script>
</head>
<body>
               
	<!-- Portfolio Modals -->
    <div class="portfolio-modal modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" onclick="location.href='../main/main.jsp?page=<%=curPage %>#portfolio'">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">     
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                    	<!-- 축제내용  -->
                        <div class="modal-body">
                            <h2><%=main_list.get(TITLE_INDEX_NUMBER) %></h2>
				  
							<hr class="star-primary">
								
                       		   <!--  
                       		    <table>
									<tr>
										<%
											for(int i = 0; i < image_list.size(); i++){
										%>
											<td>
												<img alt="image<%=i %>" src="<%=image_list.get(i) %>">
											</td>		
										<%
											}
										%>
									</tr>
								</table>
 						-->
 						    
 			<center>
			<div class="slide">
	    	 	<div id="first_list">
			       	<div class="owl-carousel">
			       		<%
							for(int i = 0; i < image_list.size(); i++){
						%>
							<img alt="image<%=i %>" src="<%=image_list.get(i) %>">
						<%
							}
						%>
					</div>
				
				</div>
			</div>
			</center>
                           	<table id="table1" width=730 border="0px">
                           	
                          
                            <%
                				for(int i = 0; i < first_list.size(); i++){
                				
                					if(i == 1){
                            			%>
                            			<tr>
                            	
                            				<td width="20%" align="left">
                                       			<span style="font-weight:bold;"><%=first_list.get(i).getTitle() %></span>
                                       		</td>
                                 	   		<td width="80%" align="left"><%=first_list.get(i).getContent() %>
                                 	   			&nbsp<a href="#" onclick="window.open('googleMap.jsp?add=<%=first_list.get(i).getContent() %>', '지도', 'top=100px, left=100px, height=800px, width=800px')">지도보기</a>
                                 	   		</td>
            	                		
            	                		</tr>
                            			<%
                            					}
                					else if(i != first_list.size() -1){
                			%>
                			<tr>
                	
                				<td width="20%" align="left">
                           			<span style="font-weight:bold;"><%=first_list.get(i).getTitle() %></span>
                           		</td>
                     	   		<td width="80%" align="left"><%=first_list.get(i).getContent() %></td>
	                		
	                			</tr>
                			<%
                					} else {
                			%>
                				<tr>
	                				<td width="20%" align="left">
	                           			<span style="font-weight:bold;"><%=first_list.get(i).getTitle() %></span>
	                           		</td>
	                     	   		<td width="80%" align="left">
	                     	   			<a href="<%=first_list.get(i).getContent()!=null? first_list.get(i).getContent(): ""%>">
	                     	   			<span>	<%=first_list.get(i).getContent()!=null? first_list.get(i).getContent(): ""%></span>
	                     	   			</a>
	                     	   		</td>
                				</tr>
                			<%
                					}
                			%>
                			<%
                				}
                			%>
                			<!-- 즐겨찾기 -->
                           	<tr>
	                           	<td width="20%" align="left">
	                           	<span style="font-weight:bold;">즐겨찾기</span>
	                           	</td>
                          	 	<td width="10%" align="left">
	                          	 	<input id="star" name="my_option" type="checkbox" class="tiny-toggle" 
										data-tt-type="star" data-tt-palette="purple" data-tt-size="large" <%=star %>>
								</td>
								
								
								
							</tr>	
                        	</table>
                        		<p id="star_msg"></p>
								<p id="unstar_msg" style="color:red;"></p>
                        
                        	
                            <!-- 개요 -->
                            <div class="menu">
                           	 <a id="a_color"><h1 class="h1_back" align="left" >개요</h1></a>
                            
                             <table id="table2" class="hide" width=100% border="0px">
                            	<%
									for(int i = 0; i < second_list.size(); i++){
								%>
									<tr>
										<td width="20%" align="left">
                            				<span style="font-weight:bold;"><%=second_list.get(i).getTitle() %></span>
                            			</td>
                            			<td width="80%" align="left"><%=second_list.get(i).getContent() %></td>
									</tr>
								<%
									}
								%>
						 
                           
                         	  </table>
                       
                         	  </div>
                             <!-- 이용안내 -->
                             <div class="menu">
                             <a id="a_color"><h1 class="h1_back" align="left">이용안내</h1></a>
                             <table id="table2" class="hide" width=100% border="0px">
                            	<%
									for(int i = 0; i < third_list.size(); i++){
								%>
									<tr>
	                            		<td width="20%" align="left">
	                            			<span style="font-weight:bold;"><%=third_list.get(i).getTitle() %></span>
	                            		</td>
	                            		<td width="80%" align="left"><%=third_list.get(i).getContent() %></td>
                            		</tr>
								<%
									}
								%>
								</table>
								<br/><br/>
                            </div>
                            
<!-- 게시판 연습 -->
			                
              
                
                    <table class="table table-condensed" width="100%" >
                         <form name=writeform method=post action="reply_ok.jsp?page=<%=pageNum%>&curr=<%=curr%>">
                          <tr>
                            <td>
                            <h3 align="left">자유로운 이야기</h3><br>   
                                    <p align="left">
                                        <%if(login_check==true){%>
                                            <input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10" value=<%=nick %> readOnly >
                                         	<input type="hidden" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10" value=<%=pwd %>>
                                         	<input type="hidden" id="email" name="email" value=<%=email %>>
                                          <%}else{ %>  
                                           <input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">
                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           <input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">
                                    	<%} %>
                                    </p>
                                   
                                    <div align="left" style="padding:10px 10px 10px 10px; background-color: #c8c8c8;" >
                                   		<textarea id="commentParentText" name="memo" class="form-control col-lg-12" style="width:70%; height:100px"></textarea>
                                    	<button type="button" name="commentParentSubmit" class="btn btn-default" style="display: inline-block; padding: 19px; vertical-align: top; background-color: #79bfc0; color: white;" OnClick="javascript:writeCheck();">보내기</button>
                                    </div>
                                 
                            </td>
                          </tr>
                     	</form>
                    </table>
                    <br><br>
                    <table id="commentTable" class="table table-condensed" width="100%">
                            	<%
									for(int i = 0; i < re_list.size(); i++){
										
								%>
                    	<tr id="r1" name="commentParentCode">
                    		<td colspan=2>
                    			<strong><%=re_list.get(i).getReply_name() %></strong>&nbsp;&nbsp;<%=re_list.get(i).getReply_regdate() %>&nbsp;&nbsp;
                    			<a style="cursor:pointer;" 	name="pDel" 
                    			onclick="javascript:boxopen('delete.jsp?page=<%=pageNum%>&curr=<%=curr%>&idx=<%=i%>', '댓글삭제', 360, 100)">삭제</a>
                    			<p><%=re_list.get(i).getReply_comment() %></p>
                    		</td>
                    	</tr>
                    			<%
									}
								%>
                    </table>        
                    <br><br>       
<!-- /게시판연습 끝표시 -->                            
                            <ul class="list-inline item-details">
                                <li>·담당부서:결석조
                                </li>
                                <li>·최근 수정일:March 2017
                                </li>
                                <li>·등록 및 수정문의:02-123-4567
                                </li>
                            </ul>
                            <button type="button" class="btn btn-default" onclick="location.href='../main/main.jsp?page=<%=curPage %>#portfolio'" 
                            style="WIDTH: 80pt; HEIGHT: 40pt; background-color: #79bfc0; color: white;"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="../js/freelancer.min.js"></script>
    
    <!-- tiny toggle javascript -->
    <script src="../js/tiny-toggle.js"></script>
    
    <!-- Slide show JavaScript -->
	<script src="../js/owl.carousel.min.js"></script>
	
	
	
<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            // 현재 클릭한 태그가 a 이기 때문에
            // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
            $(this).next("table").toggleClass("hide");
        });
    });   
    
</script>

<script>
var owl = $('.owl-carousel');
owl.owlCarousel({
	center:true,
	items:1,
    loop:true,
    autoHeight:true,
    margin:10,
    autoplay:true,
    autoplayTimeout:5000
});


</script>


<script language="javascript">

function allblur() {
	for (i = 0; i < document.links.length; i++)
		document.links[i].onfocus = document.links[i].blur;
}

</script>
</body>
</html>