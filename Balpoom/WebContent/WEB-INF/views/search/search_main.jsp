<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <!-- 구글 지도 연동 -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap"
		async defer>
</script>

<!-- 구글 지도 -->				
<div class="well row" style="margin: 0; padding: 0; ">
	<div class="col-md-9" style="border: 1px solid; height: 87%; background-color: white; width: 75%"  id="map">	
</div>
	
<!-- 최근 본방 목록 -->
	<div class="col-md-3"
		style="border: 1px solid; height: 87%; margin: 0; padding: 0; background-color: white">
		<div
			style="height: 6%; background-color: #222222; color: #919191; line-height: 38px; padding-left: 3%">>
			검색 결과 (방 개수)</div>

		<!-- 방리스트 -->
		<div style="overflow-x: hidden; overflow-y: auto; height: 87%">
			<div style="min-height: 125px; background-color: white; margin: 2%">
				<img src="/images/room.jpg" style="height: 120px; width: 120px; overflow-x: hidden;">
			</div>
			<hr/>
			<div style="min-height: 125px; background-color: white; margin: 2%">
				확인용
			</div>
		</div>

		<!-- 전/후 -->
		<nav class="navbar navbar-inverse" style="padding: 0%; margin: 0%">
			<div class="container-fluid">
				<div align="center">
					<div id="snav"
						style="height: 7%; width: 100%; background-color: #222222; line-height: 48px">
						<a href="#"
							style="color: white; font-size: 14px; text-decoration: none; color: #919191;">
							&lt; 이전 
						</a> 
						<a href="#" 
							style="color: white; font-size: 14px; text-decoration: none; color: #919191;">
							다음 &gt;
						</a>
					</div>
				</div>
			</div>
		</nav>
	</div>
</div>



<script>
	function initMap() {
		//var pos = { lat : ${json.results[0].geometry.location.lat },lng : ${json.results[0].geometry.location.lng } };
		var map = new google.maps.Map(document.getElementById('map'), {
			"center" : { lat: 37.5172363, lng: 127.0473248},											// 변수명으로 설정 가능		
			"scrollwheel" : true,	//false 로 할경우 마우스 휠 작동이 안된다
			"zoom" : 15
		});
		 var marker = new google.maps.Marker({
	          "map" : map,	// 이 map 은 위에 var map 
	          "position" : { lat: 37.5172363, lng: 127.0473248}, 									// 변수명으로 설정 가능	
	          "title" : '${param.addr}'
	    });
	}
	
	setTimeout(initMap,1000);
</script>
	
	