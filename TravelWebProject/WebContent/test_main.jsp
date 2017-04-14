<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.ArrayList, web.dao.*"%>
<!-- 
	1. 로그인 disable see login_ok.jsp
	2. email 인증 disable see join_ok.jsp
 -->
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
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
<link rel="stylesheet" type="text/css" href="shadow/css/table.css">
<link rel="stylesheet" type="text/css" href="shadow/css/shadowbox.css">

<!-- <link rel="stylesheet" type="text/css" href="fancybox/jquery.fancybox.min.css">
<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="fancybox/jquery.fancybox.min.js"></script>
 -->
<script type="text/javascript">

Shadowbox.init({
	players:["iframe"]
});
/*
$(function(){
	$('#join_click').click(function(){
		Shadowbox.open({
			content:'member/join_.jsp',
			player:'iframe',
			title:'회원가입',
			width:440,
			height:420
		});
	});
});
*/
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


function showTabMenu(n){
	var conId;

	for(i=1;i < 3; i++){
		conId = document.getElementById("con"+i);	
		if(i==n){
		conId.style.display = "";
		}else{
		conId.style.display = "none";
		}
	}
}
function showTabSeason(n){
	var seasonId;

	for(i=1;i < 5; i++){
		seasonId = document.getElementById("seasonSeoul"+i);	
		if(i==n){
			seasonId.style.display = "";
		}else{
			seasonId.style.display = "none";
		}
	}
}
function showTabSeason1(n){
	var seasonId;

	for(i=1;i < 5; i++){
		seasonId = document.getElementById("seasonJeju"+i);	
		if(i==n){
			seasonId.style.display = "";
		}else{
			seasonId.style.display = "none";
		}
	}
}


</script>
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	
    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	<link href="css/w3.css" rel="stylesheet" type="text/css">
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
                        <a href="#portfolio">행사목록</a>
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
                    	<!--  <a onclick="javascript:popupcenter('member/join.jsp', '회원가입', 440, 240)">회원가입</a>-->
                    	<!-- modal test -->
                    	<!--  shadow box --> 
                    	<a onclick="javascript:boxopen('member/join.jsp', '회원가입', 440, 470)">회원가입</a>
                    	
                    </li>
                    
                    <li class="page-scroll" id="logBtn" style="position: fixed; left: 77%;">
                    	<a id="loginform">로그인</a>
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
                   	 <li id="my-page"> <!--  마이페이지 창크기 -->
                    	<a onclick="javascript:boxopen('mypage/mypage.jsp', '마이페이지', 840, 740)">마이페이지</a>	
                   	 </li>
                     <li id="logout"> <!--  마이페이지 창크기 -->
                    	<a onclick="location.href='member/logout.jsp?email=<%=email%>'">로그아웃</a>	
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

			<div>
				<div class="contents" id="con1">
					<img id="seasonSeoul1" width="100%" height="800px" src="img/seoul_1.jpg">
					<img id="seasonSeoul2" width="100%" height="800px" src="img/seoul_2.jpg" style="display:none">
					<img id="seasonSeoul3" width="100%" height="800px" src="img/seoul_3.jpg" style="display:none">
					<img id="seasonSeoul4" width="100%" height="800px" src="img/seoul_4.jpg" style="display:none">
					<div class="page-scroll" style=" position:absolute; top:400px; left:400px; z-index:2">
                        <a href="#portfolio"><font size="10">서울 행사보기</font></a>
                    </div>  
                    <div>
						<a href="javascript:showTabSeason(1)">봄</a>&nbsp
						<a href="javascript:showTabSeason(2)">여름</a>&nbsp
						<a href="javascript:showTabSeason(3)">가을</a>&nbsp
						<a href="javascript:showTabSeason(4)">겨울</a>&nbsp
					</div>  
				</div>
				<div class="contents" id="con2" style="display:none">
					<img id="seasonJeju1" width="100%" height="800px" src="img/jeju_1.jpg">
					<img id="seasonJeju2" width="100%" height="800px" src="img/jeju_2.jpg" style="display:none">
					<img id="seasonJeju3" width="100%" height="800px" src="img/jeju_3.jpg" style="display:none">
					<img id="seasonJeju4" width="100%" height="800px" src="img/jeju_4.jpg" style="display:none">
					<div class="page-scroll" style=" position:absolute; top:400px; left:400px; z-index:2">
                        <a href="#portfolio"><font size="10">제주도 행사보기</font></a>
                    </div>  
                    <div>
						<a href="javascript:showTabSeason1(1)">봄</a>&nbsp
						<a href="javascript:showTabSeason1(2)">여름</a>&nbsp
						<a href="javascript:showTabSeason1(3)">가을</a>&nbsp
						<a href="javascript:showTabSeason1(4)">겨울</a>&nbsp
					</div>
				</div>
			</div>
			 <div style=" position:absolute; top:200px; left:100px; z-index:2">
				<a href="javascript:showTabMenu(1)"><font size="7">서울</font></a><br><br><br><br>
				<a href="javascript:showTabMenu(2)"><font size="7">제주도</font></a>
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
                    <h2>행사목록</h2>
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
                                <label for="name">이름</label>
                                <input type="text" class="form-control" placeholder="이름" id="name" name="inputName" required="" data-validation-required-message="이름을 입력해 주세요.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="email">이메일</label>
                                <input type="email" class="form-control" placeholder="이메일" id="email" name="inputEmail" required="" data-validation-required-message="이메일을 입력해 주세요.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="phone">휴대폰</label>
                                <input type="tel" class="form-control" placeholder="휴대폰" id="phone" name="inputPhone" required="" data-validation-required-message="연락처를 입력해 주세요.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="message">메세지</label>
                                <textarea rows="5" class="form-control" placeholder="메세지" id="message" name="inputMessage" required="" data-validation-required-message="메세지를 작성해 주세요."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">보내기</button>
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
                        <h3>위치</h3>
                        <p>서울특별시 마포구 백범로 18 
                            <br>미화빌딩 2,3층 쌍용강북교육센터</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Around the Web</h3>
                        <ul class="list-inline">
                            <li>
                                <a href="https://www.facebook.com/" class="btn-social btn-outline"><span class="sr-only">페이스북</span><i class="fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="https://plus.google.com/collections/featured" class="btn-social btn-outline"><span class="sr-only">구글플러스</span><i class="fa fa-fw fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="https://twitter.com/?lang=ko" class="btn-social btn-outline"><span class="sr-only">트위터</span><i class="fa fa-fw fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="https://kr.linkedin.com/" class="btn-social btn-outline"><span class="sr-only">링크드인</span><i class="fa fa-fw fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="https://dribbble.com/" class="btn-social btn-outline"><span class="sr-only">드리블</span><i class="fa fa-fw fa-dribbble"></i></a>
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
                        copyleft ← SISTH Absent is right
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
    <script src="js/contact_me.js"></script>  이메일 기능 삭제
 	-->
    <!-- Theme JavaScript -->
    <script src="js/freelancer.min.js"></script>



</body>
<script src="js/owl.carousel.min.js"></script>

</html>