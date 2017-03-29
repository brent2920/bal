<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.container {
	width: 100%;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
	overflow: hidden;
}

.carousel {
	width: 100%;
}

h1, h2, h3, h4 {
	font-family: 나눔고딕;
}

tr {
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-top-color: silver;
	border-bottom-color: silver;
	height: 50px;
}

th {
	font-family: 나눔고딕;
	background-color: #EFFBF8;
	width: 18%;
	padding-bottom: 5px;
	padding-top: 5px;
	padding-left: 15px;
	font-size: 15px;
}

td {
	font-family: 나눔고딕;
	width: 32%;
	padding-bottom: 5px;
	padding-top: 5px;
	padding-left: 15px;
	font-size: 15px;
}

#map {
	width: 100%;
	height: 60%;
	margin-top: 2em;
	margin-bottom: 2em;
}
</style>

<div class="container-fluid bg-3">
	<div class="container">
		<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<c:forTokens items="${imglist }" delims="," begin="0" var="i" varStatus="vs">
				<c:choose>
				<c:when test="${vs.first }">
				<li data-target="#myCarousel" data-slide-to="${i }" class="active"></li>
				</c:when>
				<c:otherwise>
				<li data-target="#myCarousel" data-slide-to="${i }"></li>
				</c:otherwise>
				</c:choose>
				</c:forTokens>
				
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner " role="listbox">
				<c:forTokens items="${imglist }" delims="," var="i" varStatus="vs">

					<c:choose>
						<c:when test="${vs.first}">
							<div class="item active">
								<img src=${i} width="400px;" height="300px;">
							</div>
						</c:when>
						<c:otherwise>
							<div class="item">
								<img src=${i } width="400px;" height="300px;">
							</div>
						</c:otherwise>
					</c:choose>
				</c:forTokens>


			</div>
			
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			</a> 
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			</a>
		</div>
	</div>
</div>

<div style="margin: 2em;">
	<h3>매물 정보</h3>
	<table style="width: 100%">
		<tr>
			<th><b>보증금/월세</b></th>
			<td style="color: #04B486; font-size: 25px;">
			<b>${list1.B_DEPOSIT }/${list1.B_MPAY }</b></td>
			<th><b>방종류</b></th>
			<td>${list1.RKIND }</td>
		</tr>
		<tr>
			<th><b>해당층/건물층</b></th>
			<td>${list1.B_FLOOR}/${list1.B_FLOOR_ALL }</td>
			<th><b>크기</b></th>
			<td>${list1.B_SIZE_M2}m<sup>2</sup> (${list1.B_SIZE} P)</td>
		</tr>
		<tr>
			<th><b>관리비</b></th>
			<td>${list1.B_GPAY }</td>
			<th><b>관리비<br/>포함항목</b></th>
			<td>${list1.B_GLIST }</td>
		</tr>
		<tr>
			<th><b>주차</b></th>
			<td>${list1.B_PARKING }</td>
			<th><b>엘리베이터</b></th>
			<td>${list1.B_ELEVE }</td>
		</tr>
		<tr>
			<th><b>옵션</b></th>
			<td colspan="3">${list1.B_OPTION }</td>
		</tr>
	</table>
</div>

<div style="margin: 2em;">
	<h3>상세설명</h3>
	<span>
		${list2.ROOM }
	</span>
</div>
<hr style="margin: 2em;"/>

<div style="margin: 2em;">
	<h3>위치</h3>
	<div id="map" align="center"></div>
	
	<div align="center" style="margin-top: 20px;">
		<button type="button" class="btn btn-default selected" id="hosBtn" style="border: none;">
			<img width="60px;" height="60px;" src="/images/map/detail/hospital_selected.png">
			<div id="btnName" style="margin-top: 10px;">병원</div>
		</button>
	</div>
</div>

<script>
	var map;
	var mapBounds;
	
	var hospitalInfo;

	$("#hosBtn").on("click", function() {

		
		
		if (!($(this).hasClass("selected"))) {		// 선택되지 않았을 때
			$(this).addClass("selected");
			$(this).find("img").prop("src", "/images/map/detail/hospital_selected.png");
			$(this).find("#btnName").css("color", "black");
			initMap();
			
		} else {									// 선택됬을 때
			$(this).removeClass("selected");
			$(this).find("img").prop("src", "/images/map/detail/hospital_unselected.png");
			$(this).find("#btnName").css("color", "silver");
			
		}
	});

	function Ajax() {
		
		mapBounds = map.getBounds().toJSON();
		console.log(JSON.stringify(mapBounds));
		
		$.ajax({
			"url" : "/getApiInfo",
			"type" : "get",
			"dataType" : "json",
			"async" : false,
			"data" : mapBounds
		}).done(function(rst) {
			console.log(rst);
			hospitalInfo = rst;
		});
	}
	
	function initMap() {
		var roomLocation = {					// 여기에 좌표값 받아와서 EL태그로 표시!
			lat : ${list1.B_LATITUDE},
			lng : ${list1.B_LONGITUDE}
		};
		
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : 17,
			center : roomLocation,
			streetViewControl : true,
		});
		
		Ajax();
		setRoomMarker(map);
		setHospitalMarker(map);
	}
	
	
	
	function setRoomMarker(map) {
		var roomLocation = {
			lat : ${list1.B_LATITUDE},
			lng : ${list1.B_LONGITUDE}
		};
		
		var image = {
			url : "/images/map/detail/room_marker.png",
			size : new google.maps.Size(93, 92),
			anchor: new google.maps.Point(46, 46)
		};
		
		
		var marker = new google.maps.Marker({
		    position : roomLocation,
		    map : map,
		    icon : image
		});
	}
	
	function setHospitalMarker(map) {
		var hsptLocation = {
			lat : hospitalInfo.lat,
			lng : hospitalInfo.lng
		};
		
		var image = {
			url : "/images/map/detail/hospital_marker.png",
			size : new google.maps.Size(76, 77),
			anchor: new google.maps.Point(28, 28)
		};
		
		
		var marker = new google.maps.Marker({
		    position : hsptLocation,
		    map : map,
		    icon : image
		});
	}
</script>
<script async defer
      src="https://maps.googleapis.com/maps/api/js?
      key=${apiKey }&callback=initMap"></script>
 