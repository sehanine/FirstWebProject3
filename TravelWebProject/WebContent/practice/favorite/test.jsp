<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String status = "checked";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link href="css/tiny-toggle.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
	$('#star').tinyToggle();
	$('#star2').tinyToggle();
	$("#star").tinyToggle("event", "onCheck", function() {
	  console.log("onCheck Input now is TRUE");
	});
	$("#star").tinyToggle("event", "onUncheck", function() {
		  console.log("onUncheck Input now is FALSE");
	});
});
/*
$(function(){
	$("#cb1").tinyToggle({
		  
		  onReady: function(obj) { writeLog("onReady", "TinyToggle '" + obj.attr("name") + "'  is ready!"); },
		  onClick: function(obj) { writeLog("onClick", "TinyToggle '" + obj.attr("name") + "'  was clicked!"); },
		  onChange: function(obj, value) { writeLog("onChange", "Input value changed for '" + obj.attr("name") + "' new value is " + value ); },
		  onUncheck: function(obj) { writeLog("onUncheck", "Input '" + obj.attr("name") + "' now is FALSE"); },
		  onDisabled: function(obj) { writeLog("onDisabled", "Input '" + obj.attr("name") + "' now is DISABLED"); },
		  onEnabled: function(obj) { writeLog("onEnabled", "Input '" + obj.attr("name") + "' now is ENABLED"); }          
	});
});
*/
function writeLog(status, log){
	console.log(status + " " + log);
}
</script>
</head>
<body>
<input id="star" name="my_option" type="checkbox" class="tiny-toggle" 
    data-tt-type="circle"
    data-tt-size="large" unchcked>
<input id="star2" name="my_option" type="checkbox" class="tiny-toggle" 
data-tt-type="star"
data-tt-size="large" checked>

<script src="js/tiny-toggle.js"></script>
</body>
</html>