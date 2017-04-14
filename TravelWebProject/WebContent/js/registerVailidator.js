$(function(){
	var w = 450;
	var h = 340;
	var left = (screen.width/2)-(w/2);
	var top = (screen.height/2)-(h/2);
	var strWindowFeatures = "menubar=no,location=no,resizable=no,scrollbars=no,status=yes";
	$('#emailcheck').click(function(){
		window.open("../member/emailcheck.jsp","idcheck","width="+w+",height="+h+", top="+top+", left="+left, strWindowFeatures);
	})
	$('#nickcheck').click(function(){
		window.open("../member/nickcheck.jsp","nickcheck","width="+w+",height="+h+",toolbar=no,statusbar=no,scrollbars=no, top="+top+", left="+left);
	})
});

function validcheck(){
	
	var email=$('[name=email]').val();
	var nick=$('[name=nick]').val();
	var pwd=$('[name=pwd]').val();
	var pwd1=$('[name=pwd1]').val();
	
	if(email.trim()==""){
	    alert("이메일을 입력해주세요");
	    return false;
    } else if(nick.trim()==""){
    	alert("닉네임을 입력해주세요.");
    	return false;
    } else if(pwd.trim() !== pwd1.trim()){
		alert("패스워드가 일치하지 않습니다.");
		return false;
	} 
}