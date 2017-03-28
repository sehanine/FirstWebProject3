<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import ="web.dao.*, java.util.ArrayList"%>
<%
	String pageNum = request.getParameter("page");
	String curr = request.getParameter("curr");
	if(pageNum == null){
		pageNum = "1";
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
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><%= main_list.get(TITLE_INDEX_NUMBER)%></title>
	<!--  
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	 -->
 
    <link href="css/freelancer.min.css" rel="stylesheet">
    
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	<link href="css/update.css" rel="stylesheet" type="text/css">
	<link href="css/event1.css" rel="stylesheet" type="text/css" >
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<!-- Portfolio Modals -->
    <div class="portfolio-modal modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" onclick="location.href='test_main.jsp?page=<%=curPage %>#portfolio'">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">     
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                    	<!-- ��������  -->
                        <div class="modal-body">
                            <h2><%=main_list.get(TITLE_INDEX_NUMBER) %></h2>

                            <hr class="star-primary">
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
 						
                           	<table id="table1" width=730 border="0px">
                            <%
                				for(int i = 0; i < first_list.size(); i++){
                					if(i != first_list.size() -1){
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
	                     	   			<a href="<%=first_list.get(i).getContent() %>">
	                     	   			<%=first_list.get(i).getContent() %></td>
                		
                				</tr>
                			<%
                					}
                			%>
                			<%
                				}
                			%>
                        	</table>
                            <!-- ���� -->
                            <div class="menu">
                           	 <a id="a_color"><h1 class="h1_back" align="left" >����</h1></a>
                            
                             <table id="table2" class="hide" width=730 border="0px">
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
                             <!-- �̿�ȳ� -->
                             <div class="menu">
                             <a id="a_color"><h1 class="h1_back" align="left">�̿�ȳ�</h1></a>
                             <table id="table2" class="hide" width=730 border="0px">
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
                            </div>
                            
<!-- �Խ��� ���� -->
               	<h3 align="left">�����ο� �̾߱�</h1><br>                   
              
                <table id="commentTable" class="table table-condensed"></table>
                    <table class="table table-condensed"  >
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                    <p>
                                        <div class="form-group">
                                            <input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="�̸�" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="�н�����" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">Ȯ��</button>
                                        </div>
                                    </p>
                                        <textarea id="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
                            
                            
                            
<!-- /�Խ��ǿ��� ��ǥ�� -->                            
                            <ul class="list-inline item-details">
                                <li>�����μ�:�Ἦ��
                                </li>
                                <li>���ֱ� ������:March 2017
                                </li>
                                <li>����� �� ��������:02-123-4567
                                </li>
                            </ul>
                            <button type="button" class="btn btn-default" onclick="location.href='test_main.jsp?page=<%=curPage %>#portfolio'" ></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/freelancer.min.js"></script>
    
    
    
<script src="js/reply.js"></script>

<script>
    // html dom �� �� �ε��� �� ����ȴ�.
    $(document).ready(function(){
        // memu Ŭ���� �ٷ� ������ �ִ� a �±׸� Ŭ��������
        $(".menu>a").click(function(){
            // ���� Ŭ���� �±װ� a �̱� ������
            // a ���� �±��� ul �±׿� hide Ŭ���� �±׸� �ִ��� ������ �Ѵ�.
            $(this).next("table").toggleClass("hide");
        });
    });    
</script>

</body>
</html>