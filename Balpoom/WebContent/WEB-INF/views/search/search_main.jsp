<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="/javascript/page.js"></script>
<link rel="stylesheet" href="/css/page.css">

  <!-- 구글 지도 연동 -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap"
		async defer>
</script>
 

<!-- 구글 지도 -->				
<div class="well row" style="margin: 0; padding: 0; ">
	<div class="col-md-9" style="height: 86.5%; background-color: white; width: 75%"  id="map">	
</div>
	
<!-- 최근 본방 목록 -->
	<div class="col-md-3"
		style="height: 86.5%; margin: 0; padding: 0; background-color: white">
		<div
			style="height: 6%; background-color: #222222; color: #919191; line-height: 38px; padding-left: 3%">
			&gt 검색 결과 (방 개수)</div>

		<!-- 방리스트 -->
		<div style="overflow-x: hidden; overflow-y: auto; height: 87%">
			<div style="min-height: 125px; background-color: white; margin: 2%">
				<table>
					<tr>
						<td rowspan="3">
							<img src="/images/room.jpg" style="height: 120px; 
								width: 120px;">
						</td>
						<td style="padding-left: 10px; vertical-align: bottom;">
							<span style="padding: 3px; background-color: #04B486;
								border-radius: 5px; color: white;">월세</span>
								<b style="color: #29B172; font-size: 20px; vertical-align: middle;">
									2000/30
								</b>
						</td>
					</tr>
					<tr>
						<td style="padding-left: 10px; font-size: 14px;">
							귀한 반전세 풀옵션 원룸입니다
						</td>
					</tr>
					<tr>
						<td style="padding-left: 10px; font-size: 12px; 
							color: gray; vertical-align: text-top;">
							원룸 | 3층 | 21.4m<sup>2</sup> | 관리비 5만원
						</td>
					</tr>
				</table>
			</div>
			<hr style="margin: 5px;"/>
			
			<div style="min-height: 125px; background-color: white; margin: 2%">
				<table>
					<tr>
						<td rowspan="3">
							<img src="/images/room2.jpg" style="height: 120px; 
								width: 120px;">
						</td>
						<td style="padding-left: 10px; vertical-align: bottom;">
							<span style="padding: 3px; background-color: #04B486;
								border-radius: 5px; color: white;">월세</span>
								<b style="color: #29B172; font-size: 20px; vertical-align: middle;">
									2000/30
								</b>
						</td>
					</tr>
					<tr>
						<td style="padding-left: 10px; font-size: 14px;">
							귀한 반전세 풀옵션 원룸입니다
						</td>
					</tr>
					<tr>
						<td style="padding-left: 10px; font-size: 12px; 
							color: gray; vertical-align: text-top;">
							원룸 | 3층 | 21.4m<sup>2</sup> | 관리비 5만원
						</td>
					</tr>
				</table>
			</div>
		</div>

		<!-- 전/후 -->
		<nav class="navbar navbar-inverse" style="padding: 0%; margin: 0%">
			<div class="container-fluid">
				<div align="center">
					<div id="snav" style="height: 7%; width: 100%; 
						border-radius: 0%; background-color: #222222; line-height: 48px">
<!-- 						<a href="#" -->
<!-- 							style="color: white; font-size: 14px; text-decoration: none; color: #919191;"> -->
<!-- 							&lt; 이전  -->
<!-- 						</a>  -->
<!-- 						<a href="#"  -->
<!-- 							style="color: white; font-size: 14px; text-decoration: none; color: #919191;"> -->
<!-- 							다음 &gt; -->
<!-- 						</a> -->
								<div id="paging"/>
					</div>
				</div>
			</div>
		</nav>
	</div>
</div>


