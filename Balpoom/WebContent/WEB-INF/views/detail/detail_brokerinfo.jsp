<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
div {
	font-family: 'Jeju Gothic';
}

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

.table > tbody > tr {
	height: 30px;
}

.table > tbody > tr > th {
	font-size: 13px;
	vertical-align: middle;
	text-align: center;
}

.table > tbody > tr > td {
	font-size: 13px;
	vertical-align: middle;
}

.modal-contact {
	background-color: #04B486;
	border-radius: 10px; 
	height: 30px;
	margin-left: 30px; 
	margin-right: 30px;
	font-size: 17px;
	color: white;
}
</style>

<div class="well">
	<div class="info">
		<span class="mKind">${list1.B_RKIND }</span>&nbsp;
		<c:choose>
		<c:when test="${list1.MPAY eq 0 }">
		<span class="mKind">전세</span>&nbsp;
		</c:when>
		<c:otherwise>
		<span class="mKind">월세</span>&nbsp;
		
		</c:otherwise>
		</c:choose>
		<span class="price">1000/65 만원</span> 
	</div>
	
	<div class="title">
		안양역 1.5룸 오피스텔 인기최고 풀옵션	
	</div>
	
	<div class="room_address">
		경기도 안양시 만안구 안양동
	</div>
	<hr/>
	<button id="jjim" class="btn btn-default btn-lg btn-block">
		♥ 찜
	</button>
</div>

<div class="well">
	
	<div class="agent_office">
	<span style="padding: 3px; background-color: #04B486; 
						border-radius: 5px; color: white;">중개</span>	
						 ${list.BK_OFFICENAME }	
	</div>
	
	
		대표 : ${list.BK_REGNAME }
	
	<div class="office_address">
		${list.BK_ADDRESS }
	</div>
	<div class="agent_name">
		[등록인] ${list.reg }
	</div>
	<div class="agency_number">
		중개등록번호: ${list.BK_NUM }
	</div>
	<div class="msg">
		※ 중개사와의 거래시 수수료가 발생하기 참조하세요
	</div>

	<button class="btn btn-default btn-info btn-lg btn-block contact"
		data-toggle="modal" data-target="#myModal">
		☎ 연락처
	</button>

	<!-- Modal 영역 - 중개사 연락처 -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content" style="padding: 10px;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div align="center">
					<h3 style="color: #82E0AA; margin-bottom: 20px;">
						[ 매물번호 ${list.SELL_NUM } ]
					</h3>
				</div>
				<div align="center">
					<table class="table">
						<tbody>
							<tr>
								<th>중개사무소명</th>
								<td>${list.BK_OFFICENAME }</td>
							</tr>
							<tr>
								<th>대표명</th>
								<td>${list.BK_REGNAME }</td>
							</tr>
							<tr>
								<th>대표번호</th>
								<td>${list.BK_AGENTNUM }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div align="center" style="margin-bottom: 15px;">
					<h4>등록인 : ${list.reg }</h4>
				</div>
				<div class="modal-contact" align="center">
					연락처 : ${list.BK_CONTACT }
				</div>
				<div align="center" style="margin-top: 20px; margin-bottom: 20px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						닫기
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

	$("#jjim").click(function() {
// 		if ($(this).attr("color : black"))
			$("#jjim").css("background-color","#FCF3CF");
			$("#jjim").css("color", "red");
// 		else
// 			$(this).attr("color", "black");
	});
</script>