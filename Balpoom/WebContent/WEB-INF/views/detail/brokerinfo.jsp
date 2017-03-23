<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.well {
	background-color: white;
	border-radius: 0px;
	padding: 30px;
	margin-top: -1px;
	margin-bottom: -1px;
}

.mKind {
	font-weight: bold;
	font-size: 22px;
	font-family: 나눔고딕;
}

.price {
	color: #04B486;
	font-size: 20px;
	font-weight: bold;
}

.title {
	font-size: 16px;
}

.room_address {
	color: gray;
}

.info, .title, .address {
	margin-top: 5px;
	margin-bottom: 5px;
}

.agent_office {
	font-weight: bold;
	font-size: 17px;
	margin-bottom: 5px;
}

.office_address {
	margin-bottom: 10px;
}

.office_address, agent_name, agency_number {
	font-size: 14px;
	
}

.msg {
	font-size: 12px;
	color: gray;
	margin-bottom: 15px;
}

.contact {
	background-color: #04B486;
	color: white;
}
</style>

<div class="well">
	<div class="info">
		<span class="mKind">원룸</span>&nbsp<span class="mKind">월세</span>&nbsp
		<span class="price">1000/65 만원</span> 
	</div>
	
	<div class="title">
		안양역 1.5룸 오피스텔 인기최고 풀옵션	
	</div>
	
	<div class="room_address">
		경기도 안양시 만안구 안양동
	</div>
	<hr/>
	<button class="btn btn-default btn-lg btn-block">
		<span id="jjim">♥</span> 찜
	</button>
</div>

<div class="well">
	<div class="agent_office">
		희망공인중개사무소	
	</div>
	<div class="boss">
		대표 : 이현원
	</div>
	<div class="office_address">
		경기도 안양시 안양로 344번길 18
	</div>
	<div class="agent_name">
		[등록인] 정덕찬
	</div>
	<div class="agency_number">
		중개등록번호: 92430000-1481
	</div>
	<div class="msg">
		※ 중개사와의 거래시 수수료가 발생하기 참조하세요
	</div>

	<button class="btn btn-default btn-lg btn-block contact">
		☎ 연락처
	</button>

</div>
<script>
// $("#jjim").onclick(function() {
// 	if($(this).prop("color : black"))
// 		$(this).prop("color", "red");
// 	else
// 		$(this).prop("color", "black");
// });
</script>