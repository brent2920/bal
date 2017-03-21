<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>












<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>





<!-- 달력 -->
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>








<style>
td, th {
	height: 40px;
	font-size: 12px;
	font-family: 나눔고딕;
}

#title {
	width: 160px;
	background-color: #57ABDB;
}

#memo {
	/* 			width: 300px; */
	width: 300px;
}

#memo4 {
	width: 220px;
}

#memo3 {
	width: 250px;
}

#memo1 {
	width: 60px;
}

#map {
	width: 250px;
	background-color: #EEF2EA;
}

#memo6 {
	width: 760px;
}

#title1 {
	height: 250px;
	background-color: #57ABDB
}

#title2 {
	height: 100px;
	background-color: #57ABDB
}

#title3 {
	height: 100px;
	width: 920px;
}

#memo7 {
	width: 920px;
	height: 500px;
}

.mCost>td {
	vertical-align: middle;
}
</style>


<div style="padding-left: 19%; padding-right: 19%; padding-top: 5%">
	<div style="padding: 0; margin: 0; width: 1000px; height: 50px">
		<h2 style="font-family: 나눔고딕;">&nbsp;방등록 하기</h2>
	</div>
	<div class="well" style="boder: 1px solid; background-color: black;">
		<font color="white"> - 등록한 방 정보는 직거래 매물로 등록되며, 최대 30일까지 노출 후
			거래완료 상태로 전환됩니다.<br /> - 방 등록이 완료된 매물은 방 정보와 회원정보(연락처, 메일 등)와 함께
			노출됩니다.<br /> - 거래완료된 매물을 완료처리하지 않은 경우 허위매물 등록으로 이용이 제한될 수 있습니다<br />
			- 매물 관리규정에 위배 되거나 신고된 매물은 비공개 또는 삭제처리되며 경고 및 제재조치를 받을 수 있습니다.<br />
		</font> <b style="color: #00BFFF">- 부동산 중개사는 직거래 매물을 등록할 수 없으며, 공인중개사회원
			가입 후 이용하시기 바랍니다.</b><br />
	</div>

	<div style="height: 50px"></div>




	<h3 style="font-family: 나눔고딕;">&nbsp;위치 정보</h3>
	<table border="1" rules="none">

		<tr>
			<td id="title" rowspan="5">주소</td>
			<td id="memo4">도로명, 건물명, 지번에 대해 통합검색이 가능합니다.</td>
			<td id="memo1"></td>
			<td id="map" rowspan="5" style="width: 250; height: 200">
				<!-- 				<div id="gmap"></div> -->
			</td>
		</tr>


		<tr>

			<td id="memo"><input type="text" id="sample4_postcode"
				placeholder="우편번호" class="form-control" style="width: 70%;">
			</td>
			<td id="memo4"><input type="button"
				onclick="sample4_execDaumPostcode()" value="주소검색"
				class="btn btn-primary"></td>

		</tr>

		<tr>
			<td id="memo" colspan="2"><input type="text"
				id="sample4_roadAddress" placeholder="도로명주소" class="form-control"
				style="width: 100%;"></td>

		</tr>


		<tr>
			<td id="memo" colspan="2"><input type="text"
				id="sample4_jibunAddress" placeholder="지번주소" class="form-control"
				style="width: 100%"></td>

		</tr>


		<tr>
			<td id="memo" colspan="2"><input type="text" id=""
				placeholder="상세주소" class="form-control" style="width: 100%"></td>
		</tr>

	</table>


	<div style="height: 50px"></div>

	<h3 style="font-family: 나눔고딕;">&nbsp;기본 정보</h3>
	<table border="1" rules="none">
		<tr>

			<td id="title">방 종류</td>
			<td id="memo"><select class="form-control" style="width: 85%">
					<option selected="방종류선택">방종류선택</option>
					<option value="원룸">원룸</option>
					<option value="1.5룸">1.5룸</option>
					<option value="투룸">투룸</option>
					<option value="쓰리룸">쓰리룸</option>
					<option value="오피스텔">오피스텔</option>
					<option value="아파트">아파트</option>
			</select></td>
			<td id="momo" colspan="3">다방에서는 고시원(텔)등의 고시원업 매물 등록을 제한합니다(차단조치)
			</td>
		</tr>

		<tr>
			<td id="title" rowspan="2">거래 종류</td>
			<td id="memo" colspan="4">
				<button type="button" class="btn btn-primary" id="junseadd">전세
					추가</button>
				<button type="button" class="btn btn-primary" id="wolseadd">월세
					추가</button>
				<button type="button" class="btn btn-primary" id="mubojeungadd">무보증
					추가</button> <input type="checkbox">단기 가능
			</td>
			<!-- 				<td id="memo">아</td> -->
			<!-- 				<td id="memo">아</td> -->
			<!-- 				<td id="memo">아</td>	 -->
		</tr>


		<tr>

			<td id="memo" colspan="4"><font style="color: red">거래종류를
					추가해 주세요. 다중 선택 가능하며, 첫 번째 선택한 거래종류가 우선 노출 됩니다.<br /> (예치금이 있는 경우
					보증금 입력란에 필히 예치금을 입력 하세요. - 미 입력시 허위 매물로 적발됩니다.)
			</font>


				<div style="display: none; height: 50px" id="junse">
					<input type="number"
						style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="전세">
					<button type="button" id="btn1" style="float: left;" class="btn">취소</button>
				</div>


				<div style="display: none; height: 50px;" id="wolse">
					<input type="number"
						style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="보증금"> <input
						type="number" style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="월세">
					<button type="button" id="btn2" style="float: left;" class="btn">취소</button>
				</div>

				<div style="display: none; height: 50px" id="mubojeung">
					<input type="number"
						style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="예치금"> <input
						type="number" style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="월세">
					<button type="button" id="btn3" style="float: left;" class="btn">취소</button>
				</div></td>
		</tr>

		<tr>
			<td id="title" rowspan="2">건물 층수</td>
			<td id="memo" colspan="2"><select class="form-control"
				style="width: 85%">
					<option selected="건물 층수 선택">건물 층수 선택</option>
					<c:forEach begin="1" end="50" var="i">
						<option value="${i }">${i }층</option>
					</c:forEach>
			</select></td>
			<td id="title" rowspan="2">건물크기<br /> (1P = 3.3058㎡)
			</td>
			<td id="memo"><input type="number" class="form-control"
				style="width: 50%"></td>
		</tr>


		<tr>

			<td id="memo" colspan="2"><select class="form-control"
				style="width: 85%">
					<option selected="건물 층수 선택">해당 층수 선택</option>
					<option value="반지층">반지층</option>
					<option value="옥탑">옥탑</option>
					<c:forEach begin="1" end="50" var="i">
						<option value="${i }">${i }층</option>
					</c:forEach>
			</select></td>

			<td id="memo"><input type="number" class="form-control"
				style="width: 50%"></td>
		</tr>
	</table>

	<div style="height: 50px"></div>




	<h3 style="font-family: 나눔고딕;">&nbsp;추가 정보</h3>

	<table border="1">
		<tr>
			<td id="title" rowspan="2">관리비</td>
			<td id="memo" colspan="3">
				<!-- 					<div align="center" style="vertical-align: middle;"> --> <!-- 					<div style="float: left; padding-right: 2%;"> -->
				<!-- 						<input type="checkbox">있음 --> <!-- 					</div> --> <!-- 					<div style="float: left; padding-right: 2%"> -->
				<!-- 						<input type="text" class="form-control" style="width: 100%"> -->
				<!-- 					</div> --> <!-- 					<div style="float: left; padding-right: 2%;"> -->
				<!-- 						<font size="2px">만원</font> --> <!-- 					</div> --> <!-- 					<div style="float: left; padding-right: 2%"> -->
				<!-- 						<input type="checkbox" checked="checked">없음 --> <!-- 					</div> -->
				<!-- 				</div> -->
				<table>
					<tr class="mCost">

						<td><input type="text" class="form-control"
							style="width: 100%; margin-right: 12px; text-align: right;"></td>
						<td><font size="2px" style="padding-right: 10px">만원</font></td>
						<td><input type="checkbox" style="padding-right: 10px">있음</td>
						<td><input type="checkbox" checked="checked"
							style="margin-left: 10px">없음</td>
					</tr>
				</table>
			</td>

		</tr>

		<tr>
			<td id="memo" colspan="3">관련 항목 선택 : <input type="checkbox"
				style="margin-left: 10px">인터넷 <input type="checkbox"
				style="margin-left: 10px">유선 TV <input type="checkbox"
				style="margin-left: 10px">청소비 <input type="checkbox"
				style="margin-left: 10px">수도세 <input type="checkbox"
				style="margin-left: 10px">도시가스 <input type="checkbox"
				style="margin-left: 10px">전기세
			</td>

		</tr>

		<tr>
			<td id="title">주차 여부</td>
			<td id="memo" colspan="3">
				<table>
					<tr class="mCost">

						<td><input type="text" class="form-control"
							style="width: 100%; margin-right: 12px; text-align: right;"></td>
						<td><font size="2px" style="padding-right: 10px">만원</font></td>
						<td><input type="checkbox" style="padding-right: 10px">있음</td>
						<td><input type="checkbox" checked="checked"
							style="margin-left: 10px">없음</td>
					</tr>
				</table>

			</td>


		</tr>

		<tr>
			<td id="title">엘리베이터</td>
			<td id="memo"><input type="checkbox">있음 <input
				type="checkbox" checked="checked" style="margin-left: 10px">없음

			</td>
			<td id="title">반려동물</td>
			<td id="memo"><input type="checkbox">가능 <input
				type="checkbox" checked="checked" style="margin-left: 10px">불가능
			</td>
		</tr>

		<tr>
			<td id="title">입주 가능일</td>
			<td id="memo" colspan="3">

				<table>
					<tr class="mCost">

						<td><input type="text" id="datepicker" class="form-control"></td>
						<td><input type="checkbox" style="margin-left: 10px">즉시
							입주</td>
						<td><input type="checkbox" style="margin-left: 10px">
							날짜 협의</td>

					</tr>
				</table>
			</td>

		</tr>

		<tr>
			<td id="title" rowspan="2">옵션항목</td>
			<td id="memo" colspan="3"><input type="checkbox"
				style="margin-left: 10px">에어컨 <input type="checkbox"
				style="margin-left: 10px">세탁기 <input type="checkbox"
				style="margin-left: 10px">침대 <input type="checkbox"
				style="margin-left: 10px">책상 <input type="checkbox"
				style="margin-left: 10px">옷장 <input type="checkbox"
				style="margin-left: 10px">TV <input type="checkbox"
				style="margin-left: 10px">신발장 <input type="checkbox"
				style="margin-left: 10px">냉장고 <input type="checkbox"
				style="margin-left: 10px">가스레인지 <input type="checkbox"
				style="margin-left: 10px">인덕션</td>
		</tr>

		<tr>

			<td id="memo" colspan="3"><input type="checkbox"
				style="margin-left: 10px">전자레인지 <input type="checkbox"
				style="margin-left: 10px">전자도어락 <input type="checkbox"
				style="margin-left: 10px">비데</td>

		</tr>
	</table>

	<div style="height: 50px"></div>

	<h3 style="font-family: 나눔고딕;">&nbsp;상세 설명</h3>

	<table border="1">
		<tr>
			<td id="title">방 제목</td>
			<td id="memo6"><input type="text" class="form-control"
				placeholder="예 ) 신논현역 도보 5분거리, 혼자 살기 좋은 방 입니다."></td>

		</tr>

		<tr>
			<td id="title1">방 정보</td>
			<td><textarea rows="15px" cols="90px"
					placeholder="방에 대한 추가 설명을 적어주세요. " class="form-control"></textarea>
			</td>
		</tr>
	</table>


	<div style="height: 50px"></div>
	<h3 style="font-family: 나눔고딕;">&nbsp;사진 업로드</h3>


	<table border="1px solid #FF0000">
		<tr>
			<td id="title3">- 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800픽셀)<br />
				- 사진 용량은 사진 1장당 10MB까지 등록이 가능합니다.<br /> - 사진은 최소 3장 이상 등록해야하며, 최대
				15장까지 권장합니다. 그 이상 등록할 경우 업로드 시간이 다소 지연될 수 있습니다.
			</td>
		</tr>
	</table>
	<div style="height: 15px"></div>


	<table border="1">

		<tr>
			<td id="memo7" style="padding: 0%; margin: 0%;"><c:forEach
					begin="1" end="15" var="i">
					<div style="float: left; width: 170px; height: 200px; margin: 5px;"
						align="left">
						<img alt="" src="" style="width: 170px; height: 150px"
							id="img${i }"> <input type="file" id="file${i }"
							style="display: none">
						<div align="center" style="padding-top: 10px;">
							<button type="button" id="bbt${i }" class="btn btn-primary">추가</button>
							<button type="button" id="cbt${i }" class="btn btn-danger">취소</button>
						</div>
					</div>
				</c:forEach> <!-- 			<div id="fid" style="display: """> --> <!-- 			<button type="button" class="btn btn-primary"  style="margin-top: 20%; width: 300px; height: 70px " id="fbtn">사진 추가</button> -->
				<!-- 				<input type="file" style="display: none" id="file"> --> <!-- 			</div> -->
				<!-- 			<div id="ffid" style="display: none; padding: 0%; margin: 0%" align="left"> -->
				<!-- 				<img alt="" src="" id="fimg" style="width: 150px; height: 150px" align="left" > -->
				<!-- 				<button type="button" id="cccbtn">취소</button> --> <!-- 			</div> -->


			</td>
	</table>

	<div style="height: 150px"></div>





</div>




<script>
	$("#junseadd").click(function() {
		$("#junse").fadeIn(500);
	})
	$("#btn1").click(function() {
		$("#junse").fadeOut(500);

	})

	$("#wolseadd").click(function() {
		$("#wolse").fadeIn(500);
	})
	$("#btn2").click(function() {
		$("#wolse").fadeOut(500);

	})

	$("#mubojeungadd").click(function() {
		$("#mubojeung").fadeIn(500);
	})
	$("#btn3").click(function() {
		$("#mubojeung").fadeOut(500);

	})
</script>

<script>
	
</script>




<script>

	
	

	// 	function initMap1() {

	// 		var pos1 = {
	// 			lat : 37.5172363,
	// 			lng : 127.0473248
	// 		};
	// 		// Create a map object and specify the DOM element for display.
	// 		var map1 = new google.maps.Map(document.getElementById('gmap'), {
	// 			"center" : pos1,
	// 			"scrollwheel" : false,
	// 			"zoom" : 15
	// 		});
	// 		var marker = new google.maps.Marker({
	// 			"map" : map1,
	// 			"position" : pos1,
	// 			"title" : ''
	// 		});
	// 	}
</script>









<script>
	<c:forEach begin="1" end="15" var="i">
	$("#bbt${i}").click(function() {
		$("#file${i}").trigger("click");

	});
	$("#file${i}").change(function() {
		console.log(this);
		readURL(this);
	});

	$("#cbt${i}").click(function() {
		$("#img${i}").attr("src", "")

	})

	</c:forEach>

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(input).prev().attr("src", e.target.result); // prev 는 위에 있는.. next 는 아래에 있는..
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>












<script>
	// 달력 
	$(function() {
		$("#datepicker").datepicker();
	});
</script>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					autoClose : true,
					oncomplete : function(data) {
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
						//===================================================================
						resetMap();	
						//=============================================================	
					}
				}).open();
	}
	function resetMap() {
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/roomMap?map=" + $("#sample4_roadAddress").val(), true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.status == 200 && xhr.readyState == 4) {
				var obj = JSON.parse(xhr.responseText);
				console.log(obj);
					llat = obj.results[0].geometry.location.lat
					llng = obj.results[0].geometry.location.lng
				initMap1(llat, llng);
			}
		}
	}
	function initMap1(llat, llng) {
		var pos1 = {
			lat : llat == "" ? 37.5172363 : llat,
			lng : llng == "" ? 127.0473248 : llng
		};
		// Create a map object and specify the DOM element for display.
		var map1 = new google.maps.Map(document.getElementById('map'), {
			"center" : pos1,
			"scrollwheel" : true,
			"zoom" : 16
		});
		var marker = new google.maps.Marker({
			"map" : map1,
			"position" : pos1,
			"title" : ''
		});
	}
</script>


<!-- 지도 // script 는 맵 아래 에 놓는다 -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap1"
	async defer></script>

