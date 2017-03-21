<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="/javascript/page.js"></script>
<link rel="stylesheet" href="/css/page.css">
<!-- JPG 처리 소스  -->

<!-- 구글 지도 연동 -->
<!-- <script -->
<!-- 	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap" -->
<!-- 	async defer> -->
<!-- </script> -->

<!--  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap&libraries=places,visualization" async defer></script> -->

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&libraries=places">
<!-- </script> -->
<!--  hi -->
<%-- msize : ${mlist } --%>
<!-- 구글 지도 -->
<div class="well row" style="margin: 0; padding: 0;">
	<div class="col-md-9"
		style="height: 86.5%; background-color: white; width: 75%" id="map">
	</div>

	<!-- 최근 본방 목록 -->
	<div class="col-md-3"
		style="height: 100%; margin: 0; padding: 0; background-color: white">
		<div
			style="height: 6%; background-color: #222222; color: #919191; line-height: 38px; padding-left: 3%">
			&gt 검색 결과 (방 개수)</div>

		<!-- 방리스트 -->
		<div style="overflow-x: hidden; overflow-y: auto; height: 87%">

			<div style="overflow-x: hidden; overflow-y: auto; height: 87%">


				<div id="sh"></div>

			</div>
			<!-- 전/후 -->
			<nav class="navbar navbar-inverse" style="padding: 0%; margin: 0%">
				<div class="container-fluid">
					<div align="center">
						<div id="snav"
							style="height: 7%; width: 100%; border-radius: 0%; background-color: #222222; line-height: 48px">
							<div id="paging"></div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- css -->

	<script>
</script>


	<!-- script -->
	<script>
$(document).ready(function() {
	//해당 영역에 페이징 문자열 출력 
    //class에대한 스타일 정의 필요.
    $("#dn").append(PagingHelper.dn(${dn }));
    $("#nj").append(PagingHelper.nj(${nj }));
    $("#jpglist").append(PagingHelper.jpglist(${mpic }));
    $("#arrlist").append(PagingHelper.arrlist(${mlist }));//search 에 표시할 방 정보 리스트
    $("#paging").append(PagingHelper.pagingHtml(${msize }));// 방정보 리스트의 사이즈 
    $("#gotopage").append(PagingHelper.gotoPage(1));});</script>