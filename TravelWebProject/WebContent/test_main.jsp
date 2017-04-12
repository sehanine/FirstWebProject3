<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.ArrayList, web.dao.*"%>
<%
	String pageNum = request.getParameter("page");
	String email;
	try{
		email = session.getAttribute("email").toString();
	} catch(Exception e){
		email = null;
	}
	if(pageNum == null){
		pageNum = "1";
	}   
	
	int curPage = Integer.parseInt(pageNum);
	QueryDAO dao = new QueryDAO();    
	ArrayList<MainVO> list = dao.boardListData(curPage);
	int totalPage = dao.getDivPage();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>FestiGo</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	$('.portfolio-link').click(function(){
		var newUrl = $(this).attr("href");

  		// veryfy if the new url exists or is a hash
		if (!newUrl || newUrl[0] === "#") {
     		// set that hash
   		   location.hash = newUrl;
   		   return;
		}

		// now, fadeout the html (whole page)
		$("html").fadeOut(function () {
   			// when the animation is complete, set the new location
  			location = newUrl;
		});
	return false;
	});
});

var i=0;
$(function(){
	$('#member-join').click(function(){
		if(i==0){
			$('#logPop').show();
			i=1;
		}else{
			$('#logPop').hide();
			i=0;
		}
	});
});
/*
 * code ref. from http://stackoverflow.com/questions/4068373/center-a-popup-window-on-screen
 */
$(function(){
	$('#btn').click(function(){
		window.open('member/join.jsp', 'newwindow', 'width=450, height=250,toolbar=no,statusbar=no,scrollbars=no'); 
	});
});
                  
function popupcenter(url, title, w, h) {
	  var left = (screen.width/2)-(w/2);
	  var top = (screen.height/2)-(h/2);
	  return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
};

</script>
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	
    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	<link href="css/w3.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/owl.theme.green.min.css">
	<link rel="stylesheet" href="css/owl.theme.green.css">
	<link rel="stylesheet" href="css/update.css">
	<link rel="stylesheet" href="css/loginstyle.css">

</head>
<body id="page-top" class="index">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom affix-top">
     <!--  <img src="img/portfolio/logo.png"> -->
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">FestiGo</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden active">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#portfolio">�����</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#about">About</a>
                    </li>       
                    <li class="page-scroll">
                        <a href="#contact">Contact Us</a>
                    </li>
                   
                    <%
                    	if(email == null){
                    %>
                    <li id="member-join">
                    	<a onclick="javascript:popupcenter('member/join.jsp', 'ȸ������', 440, 240)">ȸ������</a>	
                    </li>
                    <li class="page-scroll" id="logBtn" style="position: fixed; left: 77%;">
                    	<a id="loginform">�α���</a>
                    	<div class="login">
					      <div class="arrow-up"></div>
					      <div class="formholder">
					        <div class="randompad">
					           <form action="member/login_ok.jsp">
					             <label name="email">Email</label>
					             <input type="email" name="input_email" value="example@example.com"/>
					             <label name="password">Password</label>
					             <input type="password" name="input_pwd" />
					             <input type="submit" value="Login" />
					           </form>
					        </div>
					      </div>
					    </div>
					    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
						<script src="js/login.js"></script>
                    </li>
                    <%
                    	} else {
                    %>
                   	 <li id="my-page"> <!--  ���������� âũ�� -->
                    	<a onclick="javascript:popupcenter('mypage/mypage.jsp', '����������', 840, 740)">����������</a>	
                   	 </li>
                     <li id="logout"> <!--  ���������� âũ�� -->
                    	<a onclick="location.href='member/logout.jsp?email=<%=email%>'">�α׾ƿ�</a>	
                   	 </li>
                    <%
                    	}
                    %>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
    	<div class="slide">
    	 	<div id="first_list">
		       	<div class="owl-carousel">
		       		<img src="img/1.png">
		       		<img src="img/2.png">
		       		<img src="img/3.png">
				</div>
			
				<div class="owl-carousel">
					<img src="img/4.png">
		       		<img src="img/5.png">
		       		<img src="img/6.png">
				</div>
			</div>
	
		</div>
    </header>
     <!-- About Section -->
    <section class="success" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>About</h2>
                    <hr class="star-light">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>Freelancer is a free bootstrap theme created by Start Bootstrap. The download includes the complete source files including HTML, CSS, and JavaScript as well as optional LESS stylesheets for easy customization.</p>
                </div>
                <div class="col-lg-4">
                    <p>Whether you're a student looking to showcase your work, a professional looking to attract clients, or a graphic artist looking to share your projects, this template is the perfect starting point!</p>
                </div>
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <a href="#" class="btn btn-lg btn-outline">
                        <i class="fa fa-download"></i> Download Theme
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
    	 
        <div class="container w3-display-container mySlides">
        
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>�����</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
           
            <%
           		for(int i = 1; i <= list.size(); i++){
           			MainVO vo = list.get(i-1);
           			String url = dao.getFirstImage(vo.getFesno());
            %>
                <div class="col-sm-4 portfolio-item">
                    <a href="content.jsp?page=<%=vo.getFesno() %>&curr=<%=curPage %>" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="<%=url %>" class="img-responsive" alt="">
                       	<!-- <div class="w3-display-bottomleft w3-large w3-container w3-padding-16 w3-sand"> 
                       	 --> </br>
                     	<div class="subtitle">
                       	 <%=vo.getMaintitle() %>,<br/> <%=vo.getMainloc() %>
                       	<!-- </div>  -->
                       	</div>
                    </a>
                </div>
             <%
            	}
             %>  
     
     	    <button class="w3-button w3-teal w3-display-left" 
     	    onclick="location.href='prev.jsp?page=<%=curPage%>'">
     	 	&#10094;</button>
			<button class="w3-button w3-teal w3-display-right" 
			onclick="location.href='next.jsp?page=<%=curPage%>'">
			&#10095;</button>
    
    </section>
 	<!-- About2 Section -->
    <section class="success" id="about2">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>About2</h2>
                    <hr class="star-light">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>Freelancer is a free bootstrap theme created by Start Bootstrap. The download includes the complete source files including HTML, CSS, and JavaScript as well as optional LESS stylesheets for easy customization.</p>
                </div>
                <div class="col-lg-4">
                    <p>Whether you're a student looking to showcase your work, a professional looking to attract clients, or a graphic artist looking to share your projects, this template is the perfect starting point!</p>
                </div>
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <a href="#" class="btn btn-lg btn-outline">
                        <i class="fa fa-download"></i> Download Theme
                    </a>
                </div>
            </div>
        </div>
    </section>
   

    <!-- Contact Section -->
   
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Contact Us</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form action="test/send_ok.jsp"  method="post" name="frm" >
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="name">�̸�</label>
                                <input type="text" class="form-control" placeholder="�̸�" id="name" name="inputName" required="" data-validation-required-message="�̸��� �Է��� �ּ���.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="email">�̸���</label>
                                <input type="email" class="form-control" placeholder="�̸���" id="email" name="inputEmail" required="" data-validation-required-message="�̸����� �Է��� �ּ���.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="phone">�޴���</label>
                                <input type="tel" class="form-control" placeholder="�޴���" id="phone" name="inputPhone" required="" data-validation-required-message="����ó�� �Է��� �ּ���.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="message">�޼���</label>
                                <textarea rows="5" class="form-control" placeholder="�޼���" id="message" name="inputMessage" required="" data-validation-required-message="�޼����� �ۼ��� �ּ���."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">������</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
   

    <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>��ġ</h3>
                        <p>����Ư���� ������ ����� 18 
                            <br>��ȭ���� 2,3�� �ֿ밭�ϱ�������</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Around the Web</h3>
                        <ul class="list-inline">
                            <li>
                                <a href="https://www.facebook.com/" class="btn-social btn-outline"><span class="sr-only">���̽���</span><i class="fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="https://plus.google.com/collections/featured" class="btn-social btn-outline"><span class="sr-only">�����÷���</span><i class="fa fa-fw fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="https://twitter.com/?lang=ko" class="btn-social btn-outline"><span class="sr-only">Ʈ����</span><i class="fa fa-fw fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="https://kr.linkedin.com/" class="btn-social btn-outline"><span class="sr-only">��ũ����</span><i class="fa fa-fw fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="https://dribbble.com/" class="btn-social btn-outline"><span class="sr-only">�帮��</span><i class="fa fa-fw fa-dribbble"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>About Us</h3>
                        <p>Festigo is created by open source, <a href="board/list.jsp">Contact Board</a>.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        copyleft �� SISTH Absent is right
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
    
    

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
  <!-- 
    <script src="js/contact_me.js"></script>  �̸��� ��� ����
 	-->
    <!-- Theme JavaScript -->
    <script src="js/freelancer.min.js"></script>



</body>
<script src="js/owl.carousel.min.js"></script>
<script>

var owl = $('.owl-carousel');
owl.owlCarousel({
    items:3,
    loop:true,
    margin:100,
    autoplay:true,
    autoplayTimeout:5000
});

</script>
</html>