<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/javascript/page.js"></script>

<nav class="navbar navbar-inverse"
	style="background-color: #F2F2F2; border-radius: 0%; margin-bottom: 0%">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<!-- 매물종류 Dropdown -->
			<li class="dropdown" id="mkind"><a class="dropdown-toggle"
				data-toggle="dropdown" style="font-family: 나눔고딕;"> 매물종류 <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu" style="padding-left: 15px;">
					<li class="mKind" id="jPay" style="height: 35px;"><input
						class="mKind" type="radio" name="mKind" id="jPay_Chk" value="jPay">
						전세</li>
					<li class="mKind" id="mPay" style="height: 35px;"><input
						class="mKind" type="radio" name="mKind" id="mPay_Chk" value="mPay">
						월세</li>
					<li class="mKind" id="allPay" style="height: 35px;"><input
						class="mKind" type="radio" name="mKind" id="allPay_Chk" checked
						value="allPay"> 전세 + 월세</li>
				</ul></li>

			<!-- 방종류 Dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" style="font-family: 나눔고딕;"> 방종류 <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu" style="padding-left: 15px;">
					<li style="padding-top: 5px; padding-bottom: 5px;"><input
						class="rKind-all" type="checkbox" checked name="rKind"
						value="all_room"> <span class="rKind-all"> 전체</span></li>
					<li style="padding-top: 5px; padding-bottom: 5px;"><input
						class="rKind" type="checkbox" name="rKind" value="one_open">
						<span class="rKind"> 원룸(오픈형)</span></li>
					<li style="padding-top: 5px; padding-bottom: 5px;"><input
						class="rKind" type="checkbox" name="rKind" value="one_seperate">
						<span class="rKind"> 원룸(분리형)</span></li>
					<li style="padding-top: 5px; padding-bottom: 5px;"><input
						class="rKind" type="checkbox" name="rKind" value="one_dfloor">
						<span class="rKind"> 원룸(복층형)</span></li>
					<li style="padding-top: 5px; padding-bottom: 5px;"><input
						class="rKind" type="checkbox" name="rKind" value="two_room">
						<span class="rKind"> 투룸</span></li>
					<li style="padding-top: 5px; padding-bottom: 5px;"><input
						class="rKind" type="checkbox" name="rKind" value="gt_three">
						<span class="rKind"> 쓰리룸+</span></li>
				</ul></li>

			<!-- 보증금 Dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" style="font-family: 나눔고딕;"> <span
					style="padding: 3px; background-color: #04B486; border-radius: 5px; color: white;">보</span>
					0만원 ~ 무제한 <span class="caret"></span>
			</a>
				<ul class="dropdown-menu"
					style="padding-left: 15px; padding-right: 15px; width: 250px;">
					<li><b style="font-size: 16px; font-family: 나눔고딕">보증금</b><br>
						<span style="color: gray; font-size: 13px;"> 보증금
							(ex.10,000만원 = 1억원) </span>
						<div align="center">
							<input class="dprice-from" type="text" style="width: 100px"
								value="0 만원" name="dprice_from"> ~ <input
								class="dprice-to" type="text" style="width: 100px"
								value="9999999 만원" name="dprice_to">
						</div>
						<hr style="margin-top: 12px; margin-bottom: 3px;" /> 
						<c:set var="deposit_prices"
							value="100, 500, 1000, 2000, 3000,
									4000, 5000, 6000, 7000, 8000, 9000, 10000"
							scope="page" />
						<div class="row">
							<div class="col-sm-6" id="price-list-from">
								<ul style="list-style: none; -webkit-padding-start: 0px;">
									<li class="deposit-from" value="0"
										style="color: #04B486; font-weight: bold; padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: left;">
										0 만원</li>
									<c:forTokens var="price" items="${deposit_prices }" delims=",">
										<li class="deposit-from" value="${price }"
											style="padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: left;">
											<fmt:formatNumber groupingUsed="true">
												${price }</fmt:formatNumber> 만원
										</li>
									</c:forTokens>
									<li class="deposit-from" value="999999"
										style="padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: left;">
										무제한</li>
								</ul>
							</div>
							<div class="col-sm-6" id="price-list-to">
								<ul style="list-style: none; -webkit-padding-start: 0px;">
									<li class="deposit-to" value="0"
										style="padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: right;">
										0 만원</li>
									<c:forTokens var="price" items="${deposit_prices }" delims=",">
										<li class="deposit-to" value="${price }"
											style="padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: right;">
											<fmt:formatNumber groupingUsed="true">
												${price }</fmt:formatNumber> 만원
										</li>
									</c:forTokens>
									<li class="deposit-to" value="999999"
										style="color: #04B486; font-weight: bold; padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: right;">
										무제한</li>
								</ul>
							</div>
						</div></li>
				</ul></li>

			<!-- 월세 Dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" style="font-family: 나눔고딕;"> <span
					style="padding: 3px; background-color: #04B486; border-radius: 5px; color: white;">월</span>
					<span id="mPrice-from">0만원</span> ~ <span id="mPrice-to">무제한</span>
					<span class="caret"></span>
			</a>
				<ul class="dropdown-menu"
					style="padding-left: 15px; padding-right: 15px; width: 250px;">
					<li><b style="font-size: 16px; font-family: 나눔고딕">월세</b><br>
						<div align="center">
							<input class="mprice-from" type="text" style="width: 100px"
								value="0 만원" name="mprice_from"> ~ <input
								class="mprice-to" type="text" style="width: 100px"
								value="9999999 만원" name="mprice_to">
						</div>
						<hr style="margin-top: 12px; margin-bottom: 3px;" />
						<div class="row">
							<div class="col-sm-6" id="price-list-from">
								<ul style="list-style: none; -webkit-padding-start: 0px;">
									<li class="mCost-from" value="0"
										style="color: #04B486; font-weight: bold; padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: left;">
										0 만원</li>
									<c:forEach var="price" begin="10" end="100" step="10">
										<li class="mCost-from" value="${price }"
											style="padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: left;">
											<fmt:formatNumber groupingUsed="true">
												${price }</fmt:formatNumber> 만원
										</li>
									</c:forEach>
									<li class="mCost-from" value="999999"
										style="padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: left;">
										무제한</li>
								</ul>
							</div>
							<div class="col-sm-6" id="price-list-to">
								<ul style="list-style: none; -webkit-padding-start: 0px;">
									<c:forEach var="price" begin="0" end="100" step="10">
										<li class="mCost-to" value="${price }"
											style="padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: right;">
											<fmt:formatNumber groupingUsed="true">
												${price }</fmt:formatNumber> 만원
										</li>
									</c:forEach>
									<li class="mCost-to" value="999999"
										style="color: #04B486; font-weight: bold; padding-left: 0; padding-top: 7px; padding-bottom: 7px; text-align: right;">
										무제한</li>
								</ul>
							</div>
						</div></li>
				</ul></li>


			<!-- 추가옵션 Dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" style="font-family: 나눔고딕;"> 추가옵션 <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu" style="padding-left: 15px;">
					<li>
						<div>
							<ul style="list-style: none; -webkit-padding-start: 0px;">
								<li class="additionalOpt_li"
									style="padding-top: 5px; padding-bottom: 5px;"><input
									class="additionalOpt" type="checkbox" name="parking" value="가능">
									주차가능</li>
								<li class="additionalOpt_li"
									style="padding-top: 5px; padding-bottom: 5px;"><input
									class="additionalOpt" type="checkbox" name="pet" value="가능">
									반려동물</li>
								<li class="additionalOpt_li"
									style="padding-top: 5px; padding-bottom: 5px;"><input
									class="additionalOpt" type="checkbox" name="lh" value="가능">
									LH가능</li>
							</ul>
							<hr style="margin-top: 8px; margin-bottom: 8px;" />
							<ul style="list-style: none; -webkit-padding-start: 0px;">
								<li class="additionalOpt_li"
									style="padding-top: 5px; padding-bottom: 5px;"><input
									class="additionalOpt" type="checkbox" name="area" value="lt_5">
									5평 이하</li>
								<li class="additionalOpt_li"
									style="padding-top: 5px; padding-bottom: 5px;"><input
									class="additionalOpt" type="checkbox" name="area"
									value="bt_5_10"> 5평 ~ 10평 이하</li>
								<li class="additionalOpt_li"
									style="padding-top: 5px; padding-bottom: 5px;"><input
									class="additionalOpt" type="checkbox" name="area" value="gt_10">
									10평 이상</li>
							</ul>
							<hr style="margin-top: 8px; margin-bottom: 8px;" />
							<ul style="list-style: none; -webkit-padding-start: 0px;">
								<li class="additionalOpt_li"
									style="padding-top: 5px; padding-bottom: 5px;"><input
									class="additionalOpt" type="checkbox" name="floor"
									value="underground"> 반지층</li>
								<li class="additionalOpt_li"
									style="padding-top: 5px; padding-bottom: 5px;"><input
									class="additionalOpt" type="checkbox" name="floor"
									value="low_floor"> 저층 1층 ~ 3층</li>
								<li class="additionalOpt_li"
									style="padding-top: 5px; padding-bottom: 5px;"><input
									class="additionalOpt" type="checkbox" name="floor"
									value="mid_floor"> 중층 4층 ~ 6층</li>
								<li class="additionalOpt_li"
									style="padding-top: 5px; padding-bottom: 5px;"><input
									class="additionalOpt" type="checkbox" name="floor"
									value="high_floor"> 고층 7층 이상</li>
							</ul>
						</div>
					</li>
				</ul></li>
		</ul>

		<!-- 검색창 -->
		<div class="navbar-form navbar-right"
			style="margin-top: 5px; margin-bottom: 5px;">
			<div class="input-group">
				<input type="text" class="form-control" id="keyword"
					placeholder="원하시는 지역명, 지하철역을 입력해주세요"
					style="width: 300px; height: 40px;">
				<div class="input-group-btn">
					<button class="btn btn-default search" type="button" style="height: 40px;">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
</nav>

<script> 

	// 상세검색 navbar 상의 검색창 이벤트 처리부분
	// 검색버튼 클릭시 이벤트 처리
	$(".search").click(function() {
		kwdCheck();
	});

	$("#keyword").keydown(function(key) {
		if(key.keyCode == 13) {	// Enter(key code = 13)
			$(".search").trigger("click");
		}
	});
	
	function kwdCheck() {
		var chk = true;
		var keyword = $("#keyword").val();
		console.log("KEYWORD : " + keyword);
		
		$.ajax({
			"url" : "/detail_search_chk",
			"dataType" : "json",
			"async" : false, 
			"data" : {
				"keyword" : keyword
			}
		}).done(function(result) {
			if(result != null) {
				$("#loca").append(PagingHelper.loca(result));
			} else {
				window.alert("지역명 또는 지하철역명을 입력해주세요");
			}
		});
	}

	$(".dropdown").mouseenter(function() {
		$(this).children().eq(1).css({
			"display" : "block",
			"cursor" : "pointer"
		});
	});

	$(".dropdown").mouseleave(function() {
		console.log($(this).children().eq(1));
		$(this).children().eq(1).css({
			"display" : "none",
			"cursor" : "pointer"
		});
	});

	// ===========================================================================

	// [ 매물종류 nav 기능 ]
	$(".mKind").click(function() {
		console.log(this);
		$(this).find("input").prop("checked", true);
		Ajax();
	});

	// ===========================================================================

	// [ 방종류 nav 기능 ]
	$(".rKind-all").click(function() {
		if ($(this).prev().prop("checked")) {
			$(this).prev().prop("checked", false);
		} else {
			$(this).prev().prop("checked", true);

			$(".rKind").each(function() {
				$(this).prev().prop("checked", false);
			});
		}
		Ajax();
	});

	$(".rKind").click(function() {
		console.log($(this));
		if ($(this).prev().prop("checked")) {
			$(this).prev().prop("checked", false);
		} else {
			$(this).prev().prop("checked", true);
		}
		$(".rKind-all").prev().prop("checked", false);
		Ajax();
	});

	// ===========================================================================

	// [ 보증금 nav 기능 ]
	$(".deposit-from").click(function() {
		$(".deposit-from").each(function() {
			$(this).css({
				"color" : "black",
				"font-weight" : "normal"
			});
		});
		$(this).css({
			"color" : "#04B486",
			"font-weight" : "bold"
		});

		console.log($(this).val());
		$(".dprice-from").val($(this).val() + " 만원");
		Ajax();
	});

	$(".deposit-to").click(function() {
		$(".deposit-to").each(function() {
			$(this).css({
				"color" : "black",
				"font-weight" : "normal"
			});
		});
		$(this).css({
			"color" : "#04B486",
			"font-weight" : "bold"
		});

		console.log($(this).val());
		$(".dprice-to").val($(this).val() + " 만원");
		Ajax();
	});

	// ===========================================================================

	// [ 월세 nav 기능 ]
	$(".mCost-from").click(function() {
		$(".mCost-from").each(function() {
			$(this).css({
				"color" : "black",
				"font-weight" : "normal"
			});
		});
		$(this).css({
			"color" : "#04B486",
			"font-weight" : "bold"
		});

		console.log($(this).val());
		$(".mprice-from").val($(this).val() + " 만원");
		Ajax();
	});

	$(".mCost-to").click(function() {
		$(".mCost-to").each(function() {
			$(this).css({
				"color" : "black",
				"font-weight" : "normal"
			});
		});
		$(this).css({
			"color" : "#04B486",
			"font-weight" : "bold"
		});

		console.log($(this).val());
		$(".mprice-to").val($(this).val() + " 만원");
		Ajax();
	});

	// ===========================================================================

	// [ 추가옵션 nav 기능 ]
	$(".additionalOpt_li").click(function() {
		if ($(this).find("input").prop("checked"))
			$(this).find("input").prop("checked", false);
		else
			$(this).find("input").prop("checked", true);
		Ajax();
	});

	$(".additionalOpt").click(function() {
		if ($(this).prop("checked"))
			$(this).prop("checked", false);
		else
			$(this).prop("checked", true);
	});

	// ===========================================================================

	// [ 방리스트 Ajax 처리 ]
	// : 검색조건이 변경될 때마다 실행하고 방리스트가 변경되도록 구현
	function Ajax() {

		var mKind = $("input[name='mKind']:checked").val(); // 매물종류
		var rKind = []; // 방종류
		$("input[name='rKind']:checked").each(function() {
			rKind.push($(this).val());
		});

		// 보증금 값 읽어오기
		var deposit_from = $("input[name='dprice_from']").val();
		var deposit_to = $("input[name='dprice_to']").val();

		// 월세 값 읽어오기
		var mpay_from = $("input[name='mprice_from']").val();
		var mpay_to = $("input[name='mprice_to']").val();

		var parking = null; // 주차가능여부
		if ($("input[name='parking']").prop("checked"))
			parking = $("input[name='parking']").val();

		var pet = null; // 애완동물 가능여부
		if ($("input[name='pet']").prop("checked"))
			pet = $("input[name='pet']").val();

		var lhok = null; // LH 가능여부
		if ($("input[name='lh']").prop("checked"))
			lhok = $("input[name='lh']").val();

		// 평수 읽어오기
		var area = [];
		$("input[name='area']:checked").each(function(i) {
			area.push($(this).val());
		});

		// 층수 읽어오기
		var floor = [];
		$("input[name='floor']:checked").each(function(i) {
			floor.push($(this).val());
		});

		var mapBound = map.getBounds().toJSON();
		console.log(JSON.stringify(mapBound));
		console.log(mapBound.east);
		console.log(mapBound.west);
		console.log(mapBound.south);
		console.log(mapBound.north);
		// 전체데이터
		var allData = {
			"mKind" : mKind, // 매물종류
			"rKind" : rKind, // 방종류
			"deposit_from" : deposit_from, // 보증금
			"deposit_to" : deposit_to,
			"mpay_from" : mpay_from, // 월세
			"mpay_to" : mpay_to,
			"parking" : parking, // 주자가능
			"pet" : pet, // 애완동물가능
			"lhok" : lhok, // LH가능
			"area" : area, // 평수(면적)
			"floor" : floor, // 층수

			// 구글맵 범위좌표
			"east" : mapBound.east,
			"west" : mapBound.west,
			"south" : mapBound.south,
			"north" : mapBound.north
		};
		$("#allData").append(PagingHelper.allData(allData));

		console.log("Alldata::=>"+JSON.stringify(allData));

		$.ajax({
			"url" : "/gsearchTest",
			"type" : "POST",
			"dataType" : "json",
			"async" : false,
			"data" : allData
		}).done(function(rst) {
			// ajax로 날라온거를 rst로 쓰겠다는것 변수명은 맘대로 지정
			// 			$("#result").append(rst);
			//console.log("덕찬 덕찬rst=>" + JSON.stringify(rst));
			console.log("덕찬 사이즈rst.size" + rst.length)

			if (rst.length != 0) {
				//console.log("search_arrl->"+JSON.stringify(arrl));
				arrl = [];
				arrl = rst;
				//console.log("arrl="+arrl);
				njj = [];
				for (var i = 0; i < arrl.length; i++) {

					var obj = arrl[i];
					njj.push(obj["SELL_NUM"]);

					//console.log("njj->"+njj);
				}

			}
		});

		PagingHelper.gotoPage_nav(1);
	}
</script>