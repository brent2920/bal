<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>

td, th {
	height: 40px;
	font-size: 12px;
	font-family: 나눔고딕;
	padding: 10px;
}

#title {
	width: 160px;
	background-color: #E6FFF7;
	font-size: 15px;
}

#memo {
	/* 			width: 300px; */
	width: 300px;
}

#memo4 {
/* 	width: 220px; */
}

#memo3 {
	width: 250px;
}

#memo1 {
	width: 60px;
}

#memo6 {
	width: 760px;
}

#title1 {
	height: 250px;
	background-color: #E6FFF7;
	font-size: 15px;
}

#title2 {
	height: 100px;
	background-color: #E6FFF7;
}

#title3 {
	height: 100px;
	width: 920px;
	font-size: 13px;
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
<form action="/roominsert" method="post" enctype="multipart/form-data">
	<div style="padding: 0; margin: 0; width: 1000px; height: 50px">
		<h2>방등록</h2>
	</div>
	<div class="well" style="margin-bottom: 50px;">
		<font>
			 - 등록한 방 정보는 직거래 매물로 등록되며, 최대 30일까지 노출 후 거래완료 상태로 전환됩니다.<br />
			 - 방 등록이 완료된 매물은 방 정보와 회원정보(연락처, 메일 등)와 함께 노출됩니다.<br />
			 - 거래완료된 매물을 완료처리하지 않은 경우 허위매물 등록으로 이용이 제한될 수 있습니다<br />
			 - 매물 관리규정에 위배 되거나 신고된 매물은 비공개 또는 삭제처리되며 경고 및 제재조치를 받을 수 있습니다.<br />
		</font>
		<b style="color: #FA5858">
			- 부동산 중개사는 직거래 매물을 등록할 수 없으며, 공인중개사회원 가입 후 이용하시기 바랍니다.
		</b>
	</div>


	<h3>위치 정보</h3>
	<hr style="margin: 0px;"/>
	<input type="hidden" name="b_latitude" id="b_lat"/>
	<input type="hidden" name="b_longitude" id="b_lng"/>
	<table>
		<tr>
			<td id="title" rowspan="5">주소</td>
			<td id="memo4">
				<span class="glyphicons glyphicons-exclamation-sign"></span>
				도로명, 건물명, 지번에 대해 통합검색이 가능합니다.</td>
			<td id="memo1"></td>
			<td id="map" rowspan="5" style="width: 400px; height: 250px; padding: 10px;">
			</td>
		</tr>
		<tr>
			<td id="memo"><input type="text" id="sample4_postcode"
				placeholder="우편번호" class="form-control" style="width: 70%;">
			</td>
			<td id="memo4">
				<input type="button" onclick="sample4_execDaumPostcode()"
				value="주소검색" class="btn btn-default" style="
					color: #54B594; border-color: 54B594;">
			</td>
		</tr>
		<tr>
			<td id="memo" colspan="2"><input type="text"
				id="sample4_roadAddress" placeholder="도로명주소" class="form-control"
				style="width: 100%;"></td>
		</tr>
		<tr>
			<td id="memo" colspan="2"><input type="text"
				id="sample4_jibunAddress" placeholder="지번주소" class="form-control"
				style="width: 100%" name="b_title"></td>
		</tr>
		<tr>
			<td id="memo" colspan="2"><input type="text" id=""
				placeholder="상세주소" class="form-control" style="width: 100%"></td>
		</tr>
	</table>
	<hr style="margin-top: 0px; margin-bottom: 100px;"/>


	<h3>기본 정보</h3>
	<hr style="margin: 0px;"/>
	<table>
		<tr>

			<td id="title">방 종류</td>
			<td id="memo"><select class="form-control" style="width: 85%" name="b_rkind">
					<option selected>방종류선택</option>
					<option value="원룸">원룸</option>
					<option value="1.5룸">1.5룸</option>
					<option value="투룸">투룸</option>
					<option value="쓰리룸">쓰리룸</option>
					<option value="오피스텔">오피스텔</option>
					<option value="아파트">아파트</option>
			</select></td>
			<td id="momo" colspan="3">
				발품에서는 고시원(텔)등의 고시원업 매물 등록을 제한합니다(차단조치)
			</td>
		</tr>

		<tr>
			<td id="title" rowspan="2">거래 종류</td>
			<td id="memo" colspan="4">
				<button type="button" class="btn btn-primary" id="wolseadd">
					가격 추가
				</button>
			</td>
		</tr>


		<tr>

			<td id="memo" colspan="4"><font style="color: red">금액을 입력해주세요</font>


				<div style="display: none; height: 50px" id="junse">
					<input type="number"
						style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="전세">
					<button type="button" id="btn1" style="float: left;" class="btn">취소</button>
				</div>


				<div style="display: none; height: 50px;" id="wolse">
					<input type="number"
						style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="보증금" name="b_deposit"> <input
						type="number" style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="월세" name="b_mpay">
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
				style="width: 85%" name="b_floor_all">
					<option selected="건물 층수 선택">건물 층수 선택</option>
					<c:forEach begin="1" end="50" var="i">
						<option value="${i }층">${i }층</option>
					</c:forEach>
			</select></td>
			<td id="title" rowspan="2">건물크기<br /> (1P = 3.3058㎡)
			</td>
			<td id="memo"><input type="number" class="form-control"
				style="width: 50%" placeholder="평수" name="b_size" id="b_size"></td>
		</tr>


		<tr>

			<td id="memo" colspan="2"><select class="form-control"
				style="width: 85%" name="b_floor">
					<option selected="건물 층수 선택">해당 층수 선택</option>
					<option value="반지층">반지층</option>
					<option value="옥탑">옥탑</option>
					<c:forEach begin="1" end="50" var="i">
						<option value="${i }층">${i }층</option>
					</c:forEach>
			</select></td>

			<td id="memo"><input type="text" class="form-control"
				style="width: 50%" placeholder="면적" name="b_size_m2" readonly value="" id="bsm2"></td>
		</tr>
	</table>
	<hr style="margin-top: 0px; margin-bottom: 100px;"/>
	

	<h3>추가 정보</h3>
	<hr style="margin: 0px;"/>
	<table>
		<tr>
			<td id="title" rowspan="2">관리비</td>
			<td id="memo" colspan="3">
				<table style="margin-left: -10px;">
					<tr class="mCost">
						<td><input type="text" class="form-control"
							style="width: 100%; margin-right: 12px; text-align: right;" disabled id="b_gpay3" name="b_gpay"></td>
						<td><font size="2px" style="padding-right: 10px">만원</font></td>
						<td><input type="checkbox" style="padding-right: 10px" id="b_gpay1">있음</td>
						<td><input type="checkbox" checked="checked"
							style="margin-left: 10px" id="b_gpay2" name="b_gpay" value="없음">없음</td>
					</tr>
				</table>
			</td>

		</tr>

		<tr>
			<td id="memo" colspan="3">관련 항목 선택 : <input type="checkbox"
				style="margin-left: 10px" name="b_glist" value="인터넷">인터넷 <input type="checkbox"
				style="margin-left: 10px"  name="b_glist" value="유선 TV">유선 TV <input type="checkbox"
				style="margin-left: 10px"  name="b_glist" value="청소비">청소비 <input type="checkbox"
				style="margin-left: 10px"  name="b_glist" value="수도세">수도세 <input type="checkbox"
				style="margin-left: 10px"  name="b_glist" value="도시가스">도시가스 <input type="checkbox"
				style="margin-left: 10px"  name="b_glist" value="전기세">전기세
			</td>

		</tr>

		<tr>
			<td id="title">주차 여부</td>
			<td id="memo" colspan="3">
				<span>
					<span class="mCost">
						<input type="checkbox" id="b_parking1" name="b_parking" value="가능">있음
						<input type="checkbox" checked="checked"
							style="margin-left: 10px" id="b_parking2" name="b_parking" value="불가능">없음
					</span>
				</span>
			</td>
		</tr>

		<tr>
			<td id="title">엘리베이터</td>
			<td id="memo"><input type="checkbox" id="b_eleve1" name="b_eleve" value="있음">있음 <input
				type="checkbox" checked="checked" style="margin-left: 10px" id="b_eleve2" name="b_eleve" value="없음">없음

			</td>
			<td id="title">반려동물</td>
			<td id="memo"><input type="checkbox" name="b_petpossible" id="b_petpossible1" value="가능">가능 <input
				type="checkbox" checked="checked" style="margin-left: 10px" name="b_petpossible" id="b_petpossible2" value="불가능">불가능
			</td>
		</tr>

		<tr>
			<td id="title">입주 가능일</td>
			<td id="memo" colspan="3">
				<span>
					<span class="mCost">
						<input type="text" id="datepicker"
							placeholder="날짜를 선택해주세요" class="form-control" name="b_enterdate">
					</span>
				</span>
			</td>

		</tr>

		<tr>
			<td id="title">근처역</td>
			<td colspan="3">
				<input type="text" name="b_nstation" class="form-control" placeholder="근처에 있는 역을 입력해주세요">
			</td>
			
		</tr>
		<tr>
			<td id="title" rowspan="2">옵션항목</td>
			<td id="memo" colspan="3"><input type="checkbox"
				style="margin-left: 10px" name="b_option" value="에어컨">에어컨 <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="세탁기">세탁기 <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="침대">침대 <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="책상">책상 <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="옷장">옷장 <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="TV">TV <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="신발장">신발장 <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="냉장고">냉장고 <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="가스레인지">가스레인지 <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="인덕션">인덕션</td>
		</tr>

		<tr>
			<td id="memo" colspan="3">
				<input type="checkbox" style="margin-left: 10px"
					value="전자레인지" name="b_option">전자레인지
				<input type="checkbox" style="margin-left: 10px" 
					value="전자도어락" name="b_option">전자도어락 
				<input type="checkbox" style="margin-left: 10px" 
					value="비데" name="b_option">비데
			</td>
		</tr>
	</table>
	<hr style="margin: 0px;"/>
	<div align="right" style="margin-bottom: 100px; padding-right: 7%; padding-top: 1%">
		<font color="red">※ LH 가능 여부</font>
		<input type="checkbox" name="b_lhok" id="b_lhok1" value="가능">가능
		<input type="checkbox" name="b_lhok" checked id="b_lhok2" value="불가능">불가능
	</div>
	


	<h3>상세 설명</h3>
	<hr style="margin: 0px;"/>
	<table>
		<tr>
			<td id="title">방 제목</td>
			<td id="memo6"><input type="text" class="form-control"
				placeholder="예 ) 신논현역 도보 5분거리, 혼자 살기 좋은 방 입니다." name="b_rinfo"></td>

		</tr>

		<tr>
			<td id="title1">방 정보</td>
			<td>
				<textarea rows="15px" cols="90px"
					placeholder="방에 대한 추가 설명을 적어주세요. " class="form-control" name="b_detail"></textarea>
			</td>
		</tr>
	</table>
	<hr style="margin: 0px; margin-bottom: 100px;"/>

	<h3>사진 업로드</h3>
	<table>
		<tr>
			<td id="title3">
				- 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800픽셀)<br />
				- 사진 용량은 사진 1장당 10MB까지 등록이 가능합니다.<br />
				- 사진은 최소 3장 이상 등록해야하며, 최대
				15장까지 권장합니다. 그 이상 등록할 경우 업로드 시간이 다소 지연될 수 있습니다.
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td id="memo7" style="padding: 0%; margin: 0%; text-align: center;">
				<c:forEach begin="1" end="15" var="i">
					<div style="float: left; width: 170px; height: 200px; margin: 5px;"
						align="left">
						<img alt="" src="" style="width: 170px; height: 150px; background-color: #EEEEEE;"
							id="img${i }"> <input type="file" id="file${i }"
							style="display: none" name="file">
						<div align="center" style="padding-top: 10px;">
							<button type="button" id="bbt${i }" 
								class="btn btn-default" style="color: #646464;
								border-color: #646464">추가</button>
							<button type="button" id="cbt${i }" 
								class="btn btn-default"  style="color: #646464;
								border-color: #646464">취소</button>
						</div>
					</div>
				</c:forEach>
			</td>
		</tr>
	</table>
	<br/>
	<div align="center" style="margin-top: 20px; margin-bottom: 80px;">
		<button type="submit" class="btn btn-primary" 
			style="font-size: 20px; padding-left: 20px; padding-right: 20px;
			padding-top: 10px; padding-bottom: 10px;">등록</button>
		<a href="/">
			<button type="submit" class="btn btn-danger" 
				style="font-size: 20px; padding-left: 20px; padding-right: 20px;
				padding-top: 10px; padding-bottom: 10px;">취소</button>
		</a>
	</div>
</form>
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

// 관리비
$("#b_gpay1").click(function() {
		console.log($(this).prop("checked"));
	if ($(this).prop("checked")) {
		console.log($(this).prop("checked"));
		$("#b_gpay2").prop("checked", false);
		$("#b_gpay3").prop("disabled",false)
	} else {
		$("#b_gpay2").prop("checked", true);
		
	}
});

$("#b_gpay2").click(function() {
		console.log($(this).prop("checked"));
	if ($(this).prop("checked")) {
		console.log($(this).prop("checked"));
		$("#b_gpay1").prop("checked", false);
		$("#b_gpay3").prop("disabled",true);
	} else {
		$("#b_gpay1").prop("checked", true);
	}
});

// 주차여부


$("#b_parking1").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_parking2").prop("checked", false);
} else {
	$("#b_parking2").prop("checked", true);
}
});

$("#b_parking2").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_parking1").prop("checked", false);
} else {
	$("#b_parking1").prop("checked", true);
}
});

// 엘리베이터


$("#b_eleve1").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_eleve2").prop("checked", false);
} else {
	$("#b_eleve2").prop("checked", true);
}
});

$("#b_eleve2").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_eleve1").prop("checked", false);
} else {
	$("#b_eleve1").prop("checked", true);
}
});


// 반려동물
$("#b_petpossible1").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_petpossible2").prop("checked", false);
} else {
	$("#b_petpossible2").prop("checked", true);
}
});

$("#b_petpossible2").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_petpossible1").prop("checked", false);
} else {
	$("#b_petpossible1").prop("checked", true);
}
});


//LH 가능 여부

$("#b_lhok1").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_lhok2").prop("checked", false);
} else {
	$("#b_lhok2").prop("checked", true);
}
});

$("#b_lhok2").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_lhok1").prop("checked", false);
} else {
	$("#b_lhok1").prop("checked", true);
}
});
</script>



<script>
// 면적 / 평수 계산
$("#b_size").click(function() {
	var  area = 3.3058 * $(this).val();
	
	$("input[name='b_size_m2']").val(area);
});
$("#b_size").keyup(function() {
	var  area = 3.3058 * $(this).val();
	
	$("input[name='b_size_m2']").val(area);
});
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
					llat = obj.results[0].geometry.location.lat;
					llng = obj.results[0].geometry.location.lng;
					$("#b_lat").val(llat);
					$("#b_lng").val(llng);
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
	src="https://maps.googleapis.com/maps/api/js?key=${apiKey }&callback=initMap1"
	async defer></script>
