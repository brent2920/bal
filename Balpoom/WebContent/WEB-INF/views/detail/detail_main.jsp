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
		<div class="btn btn-default selected" id="hosBtn" style="border: none;">
			<img width="60px;" height="60px;" src="/images/map/detail/hospital_selected.png">
			<div id="btnName" style="margin-top: 10px;">병원</div>
		</div>
	</div>
</div>

<script>
	var roomLocation = {			// 방 좌표(지도 중간지점역할)
		lat : ${list1.B_LATITUDE},
		lng : ${list1.B_LONGITUDE}
	};
	
	console.log(roomLocation);
	
	var map;
	var mapZoom = 17;		// 초기값 17
	var mapCenter = roomLocation;
	var roomMarker;
	var hospitalMarker = [];
	var mapBounds = {
		east : ${list1.B_LONGITUDE} + 0.0036844272613241174,
		west : ${list1.B_LONGITUDE} - 0.0036844272613809608,
		south : ${list1.B_LATITUDE} - 0.0040662938383111396,
		north : ${list1.B_LATITUDE} + 0.0040662365040777786
	};
	
	var isDelMarker = false;
	
	// 병원정보가 들어갈 객체
	var hospitalInfo;
	
	function initMap() {
		
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : mapZoom,
			center : mapCenter,
			streetViewControl : true,
		});
		
		map.addListener('dragstart', function() {
			console.log("drag start!!");
			
			map.addListener('idle', function() {
				console.log("idle!!");
				if(isDelMarker == false) {
					viewHospitalMarkers();
				} else {
					delHospitalMarker();
				}
			});
		});
		
		map.addListener('zoom_changed', function() {
			console.log("zoom_changed!!");
			
			map.addListener('idle', function() {
				console.log("idle!!");
				if(isDelMarker == false) {
					viewHospitalMarkers();
				} else {
					delHospitalMarker();
				}
			});
		});
		
		setRoomMarker(map);
		setHospitalMarker(map);
	}
	
	function setRoomMarker(map) {
		
		var image = {
			url : "/images/map/detail/room_marker.png",
			size : new google.maps.Size(93, 92),
			anchor: new google.maps.Point(46, 46)
		};
			
		roomMarker = new google.maps.Marker({
		    position : roomLocation,
		    map : map,
		    icon : image
		});
	}
	
	function setHospitalMarker(map) {
		
		$.ajax({
			"url" : "/getApiInfo",
			"type" : "get",
			"dataType" : "json",
			"async" : false,
			"data" : mapBounds
		}).done(function(rst) {
			
			if(isDelMarker == true) {
				
			} else {
				hospitalInfo = rst;
				var image = {
					url : "/images/map/detail/hospital_marker.png",
					size : new google.maps.Size(29, 30),
					anchor: new google.maps.Point(15, 15)
				};
				
				for(var i=0; i<hospitalInfo.length; i++) {
					var hospital = hospitalInfo[i];
					hospitalMarker = new google.maps.Marker({
					    position : {
					    	lat : Number(hospital.lat),
					    	lng : Number(hospital.lng)
					    },
					    map : map,
					    icon : image,
					    title: hospital.h_name
					});
				}
			}
		});
	}
	
	function viewHospitalMarkers() {
		isDelMarker = false;
		setChangedMapStatus();
		initMap();
	}
	
	function delHospitalMarker() {
		isDelMarker = true;
		setChangedMapStatus();
		initMap();
	}
	
	function setChangedMapStatus() {
		mapBounds = map.getBounds().toJSON();
		mapZoom = map.getZoom();
		mapCenter = map.getCenter();
	}
	
	// ============== 이벤트처리부 ==============
	
	$("#hosBtn").on("mouseenter", function() {
		$(this).css("cursor", "pointer");
	});
	
	$("#hosBtn").on("mouseelave", function() {
		$(this).css("cursor", "default");
	});
 
	$("#hosBtn").on("click", function() {
		
		if (!($(this).hasClass("selected"))) {		// 해제 -> 선택
			$(this).addClass("selected");
			$(this).find("img").prop("src", "/images/map/detail/hospital_selected.png");
			$(this).find("#btnName").css("color", "black");
			
			viewHospitalMarkers();
			
		} else {									// 선택 -> 해제
			$(this).removeClass("selected");
			$(this).find("img").prop("src", "/images/map/detail/hospital_unselected.png");
			$(this).find("#btnName").css("color", "silver");
			
			delHospitalMarker();
		}
	});
</script>
<script async defer
      src="https://maps.googleapis.com/maps/api/js?key=${apiKey }&callback=initMap"></script>
 