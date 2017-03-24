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
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner " role="listbox">
				<c:forEach var="val" items="${pj }" varStatus="vs">
					<c:choose>
						<c:when test="${vs.first}">
							<div class="item active">
								<img src=${val } width="400px;" height="300px;">
							</div>
						</c:when>
						<c:otherwise>
							<div class="item">
								<img src=${val } width="400px;" height="300px;">
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
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
			<td style="color: #04B486; font-size: 25px;"><b>3000/20</b></td>
			<th><b>방종류</b></th>
			<td>원룸</td>
		</tr>
		<tr>
			<th><b>해당층/건물층</b></th>
			<td>2층/7층</td>
			<th><b>크기</b></th>
			<td>26.3m<sup>2</sup> (8P)</td>
		</tr>
		<tr>
			<th><b>관리비</b></th>
			<td>7만원</td>
			<th><b>관리비<br/>포함항목</b></th>
			<td>전기, 수도, 가스</td>
		</tr>
		<tr>
			<th><b>주차</b></th>
			<td>가능</td>
			<th><b>엘리베이터</b></th>
			<td>없음</td>
		</tr>
		<tr>
			<th><b>옵션</b></th>
			<td colspan="3">세탁기, 냉장고, 책상, 옷장, 침대</td>
		</tr>
	</table>
</div>

<div style="margin: 2em;">
	<h3>상세설명</h3>
	<span>
		내용
	</span>
</div>
<hr style="margin: 2em;"/>

<div style="margin: 2em;">
	<h3>위치</h3>
	<div id="map" align="center"></div>
</div>

<script>

	function initMap() {
		var roomLocation = {lat : 37.481215, lng : 126.952744};		// 여기에 좌표값 받아와서 EL태그로 표시!
		
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 17,
			center : roomLocation,
			streetViewControl : true,
		});
		
		var marker = new google.maps.Marker({
		    position: roomLocation,
		    map: map,
		  });
	}
</script>
<script async defer
      src="https://maps.googleapis.com/maps/api/js?
      key=2e3dec069aed3a50278a0f8556d7520d84d3c4e6&callback=initMap"></script>
 