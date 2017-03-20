<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/table.css">
<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900'
			rel='stylesheet' type='text/css'></link>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/javascript/table.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
/* 	margin: auto; */
}

.carousel {
	width: 75%;
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
		<div class="carousel-inner" role="listbox">
		

				<c:forEach var="val" items="${pj }" varStatus="vs">
					<c:choose>

						<c:when test="${vs.first}">
							<div class="item active">
								<img src=${val } width="260" height="145">
							</div>
						</c:when>
						<c:otherwise>
							<div class="item">
								<img src=${val } width="260" height="145">
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">이전</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">다음</span>
			</a>
		</div>
	</div>
</div>

<div style="margin: 2em;">
	<h3>매물 정보</h3>
	<table style="width: 100%">
		<tr>
			<th><b>보증금/월세</b></th>
			<td style="color: orange; font-size: 25px;"><b>3000/20</b></td>
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
			<th><b>관리비 포함항목</b></th>
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
<hr/>

<div style="margin: 2em;">
	<h3>위치 및 주변 편의시설</h3>
	<span>
		지도 표시
	</span>
	<br>
	<br>
</div>