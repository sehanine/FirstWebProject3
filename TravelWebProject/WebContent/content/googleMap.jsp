<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
        <%
		String add = request.getParameter("add");
        request.setAttribute("add", add);
        
		%>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyALLMohZAbxWMtIL3--4x6C4ctVBxG7lc4&callback=initMap"
  type="text/javascript"></script>
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script type="text/javascript">
    function initialize() {
     
        var mapOptions = {
                            zoom: 16, // ������ ����� ���� �� ũ��
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
         
         
        var map = new google.maps.Map(document.getElementById("map-canvas"), // div�� id�� ���� ���ƾ� ��. "map-canvas"
                                    mapOptions);
         
        var size_x = 40; // ��Ŀ�� ����� �̹����� ���� ũ��
        var size_y = 40; // ��Ŀ�� ����� �̹����� ���� ũ��
     
        // ��Ŀ�� ����� �̹��� �ּ�
        var image = new google.maps.MarkerImage( '�ּ� ���⿡ ����!',
                                                    new google.maps.Size(size_x, size_y),
                                                    '',
                                                    '',
                                                    new google.maps.Size(size_x, size_y));
         
        // Geocoding *****************************************************

        var address= "${add}";
        var marker = null;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker = new google.maps.Marker({
                                map: map,
                                icon: image, // ��Ŀ�� ����� �̹���(����)
                                title: '', // ��Ŀ�� ���콺 ����Ʈ�� ���ٴ��� �� �ߴ� Ÿ��Ʋ
                                position: results[0].geometry.location
                            });
 
                var content = ""; // ��ǳ�� �ȿ� �� ����
             
                // ��Ŀ�� Ŭ������ ���� �̺�Ʈ.
                var infowindow = new google.maps.InfoWindow({ content: content});
                google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
        // Geocoding // *****************************************************
         
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
<div id="map-canvas" style="width: 100%; height: 750px" title="���� ��ġ�Դϴ�."></div>
</body>
</html>