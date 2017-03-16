<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.dropdown-menu {
	padding: 20px;
}
</style>

<nav class="navbar navbar-inverse" style="background-color: #F2F2F2; border-radius: 0%; margin-bottom: 0%">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<!-- 매물종류 Dropdown -->
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" style="font-family: 나눔고딕;">
					매물종류 <span class="caret"></span>
				</a>
				<ul class="dropdown-menu" style="padding-left: 15px;">
					<li style="padding-top: 5px; padding-bottom: 5px;">
						<input type="checkbox"> 전세
					</li>
					<li style="padding-top: 5px; padding-bottom: 5px;">
						<input type="checkbox"> 월세
					</li>
					<li style="padding-top: 5px; padding-bottom: 5px;">
						<input type="checkbox"> 전세 + 월세
					</li>
				</ul>
			</li>
			
			<!-- 방종류 Dropdown -->
    		<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" style="font-family: 나눔고딕;">
					방종류 <span class="caret"></span>
				</a>
				<ul class="dropdown-menu" style="padding-left: 15px;">
					<li style="padding-top: 5px; padding-bottom: 5px;">
						<input type="checkbox" checked> 전체
					</li>
					<li style="padding-top: 5px; padding-bottom: 5px;">
						<input type="checkbox"> 원룸
					</li>
					<li style="padding-top: 5px; padding-bottom: 5px;">
						<input type="checkbox"> 1.5룸
					</li>
					<li style="padding-top: 5px; padding-bottom: 5px;">
						<input type="checkbox"> 투룸
					</li>
					<li style="padding-top: 5px; padding-bottom: 5px;">
						<input type="checkbox"> 쓰리룸
					</li>
					<li style="padding-top: 5px; padding-bottom: 5px;">
						<input type="checkbox"> 오피스텔
					</li>
					<li style="padding-top: 5px; padding-bottom: 5px;">
						<input type="checkbox"> 아파트
					</li>
				</ul>
			</li>
			
			<!-- 보증금 Dropdown -->
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" style="font-family: 나눔고딕;">
					<span style="padding: 3px; background-color: #04B486;
						border-radius: 5px; color: white;">보</span> 0만원 ~ 무제한 <span class="caret"></span>
				</a>
				<ul class="dropdown-menu" style="padding-left: 15px; padding-right: 15px; width: 250px;">
					<li>
						<b style="font-size: 16px; font-family: 나눔고딕">보증금</b><br>
						<span style="color: gray; font-size: 13px;">
							보증금 (ex. 10,000만원 = 1억원)
						</span>
						<div align="center">
							<input type="text" style="width: 100px"> ~ <input type="text" style="width: 100px">
						</div>
						<hr style="margin-top: 12px; margin-bottom: 3px;"/>
						<c:set var="deposit_prices" value="0, 100, 500, 1000, 2000, 3000,
								4000, 5000, 6000, 7000, 8000, 9000, 10000" scope="page"/>
						<div class="row">
							<div class="col-sm-6" id="price-list-from">
								<ul style="list-style: none; -webkit-padding-start: 0px;">
									<c:forTokens var="price" items="${deposit_prices }" delims=",">
										<li style="padding-left: 0; padding-top: 7px; 
											padding-bottom: 7px; text-align: left;">
											<fmt:formatNumber groupingUsed="true">
												${price }</fmt:formatNumber> 만원
										</li>
									</c:forTokens>
									<li style="padding-left: 0; padding-top: 7px; 
										padding-bottom: 7px; text-align: left;">
										무제한
									</li>
								</ul>
							</div>
							<div class="col-sm-6" id="price-list-to">
								<ul style="list-style: none; -webkit-padding-start: 0px;">
									<c:forTokens var="price" items="${deposit_prices }" delims=",">
										<li style="padding-left: 0; padding-top: 7px; 
											padding-bottom: 7px; text-align: right;">
											<fmt:formatNumber groupingUsed="true">
												${price }</fmt:formatNumber> 만원
										</li>
									</c:forTokens>
									<li style="padding-left: 0; padding-top: 7px; 
										padding-bottom: 7px; text-align: right;">
										무제한
									</li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</li>
			
			<!-- 월세 Dropdown -->
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" style="font-family: 나눔고딕;">
					<span style="padding: 3px; background-color: #04B486;
						border-radius: 5px; color: white;">월</span> 0만원 ~ 무제한 <span class="caret"></span>
				</a>
				<ul class="dropdown-menu" style="padding-left: 15px; padding-right: 15px; width: 250px;">
					<li>
						<b style="font-size: 16px; font-family: 나눔고딕">보증금</b><br>
						<span style="color: gray; font-size: 13px;">
							보증금 (ex. 10,000만원 = 1억원)
						</span>
						<div align="center">
							<input type="text" style="width: 100px"> ~ <input type="text" style="width: 100px">
						</div>
						<hr style="margin-top: 12px; margin-bottom: 3px;"/>
						<div class="row">
							<div class="col-sm-6" id="price-list-from">
								<ul style="list-style: none; -webkit-padding-start: 0px;">
									<c:forEach var="price" begin="0" end="100" step="10">
										<li style="padding-left: 0; padding-top: 7px; 
											padding-bottom: 7px; text-align: left;">
											<fmt:formatNumber groupingUsed="true">
												${price }</fmt:formatNumber> 만원
										</li>
									</c:forEach>
									<li style="padding-left: 0; padding-top: 7px; 
										padding-bottom: 7px; text-align: left;">
										무제한
									</li>
								</ul>
							</div>
							<div class="col-sm-6" id="price-list-to">
								<ul style="list-style: none; -webkit-padding-start: 0px;">
									<c:forEach var="price" begin="0" end="100" step="10">
										<li style="padding-left: 0; padding-top: 7px; 
											padding-bottom: 7px; text-align: right;">
											<fmt:formatNumber groupingUsed="true">
												${price }</fmt:formatNumber> 만원
										</li>
									</c:forEach>
									<li style="padding-left: 0; padding-top: 7px; 
										padding-bottom: 7px; text-align: right;">
										무제한
									</li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</li>
		
		
			<!-- 추가옵션 Dropdown -->
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" style="font-family: 나눔고딕;">
					추가옵션 <span class="caret"></span>
				</a>
				<ul class="dropdown-menu" style="padding-left: 15px;">
					<li>
						<div>
							<ul style="list-style: none; -webkit-padding-start: 0px;">
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> 주차가능
								</li>
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> 반려동물
								</li>
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> LH가능
								</li>
							</ul>
							<hr style="margin-top: 8px; margin-bottom: 8px;"/>
							<ul style="list-style: none; -webkit-padding-start: 0px;">
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> 5평 이하
								</li>
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> 5평 ~ 10평 이하
								</li>
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> 10평 이상
								</li>
							</ul>
							<hr style="margin-top: 8px; margin-bottom: 8px;"/>
							<ul style="list-style: none; -webkit-padding-start: 0px;">
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> 반지층
								</li>
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> 저층 1층 ~ 3층
								</li>
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> 중층 4층 ~ 6층
								</li>
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> 고층 7층 이상
								</li>
								<li style="padding-top: 5px; padding-bottom: 5px;">
									<input type="checkbox"> 옥탑
								</li>
							</ul>
						</div>
					</li>
				</ul>
			</li>
		</ul>
		
		<!-- 검색창 -->
		<form class="navbar-form navbar-right" style="margin-top: 5px; margin-bottom: 5px;">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="원하시는 지역명, 지하철역을 입력해주세요"
					style="width: 300px; height: 40px;">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit" style="height: 40px;">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
</nav>