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
		<c:when test="${list1.B_MPAY eq 0 }">
		<span class="mKind">전세</span>&nbsp;
		</c:when>
		<c:otherwise>
		<span class="mKind">월세</span>&nbsp;
		
		</c:otherwise>
		</c:choose>
		<span class="price">${list1.B_DEPOSIT }/${list1.B_MPAY } 만원</span> 
	</div>
	
	<div class="title">
		${list1.B_RINFO}	
	</div>
	
	<div class="room_address">
		${list1.B_LOCATION }
	</div>
	<hr/>
	<button id="jjim" class="btn btn-default btn-lg btn-block">
		♥ 찜
	</button>
</div>

<div class="well">
	<div class="agent_office">
			<span style="padding: 3px; background-color: #04B486; 
						border-radius: 5px; color: white;">개인</span>	
	</div>
	<div class="boss">
		개인 직거래
	</div>
	<div class="office_address">
		${list1.B_TITLE }
	</div>
	<div class="agent_name">
		[등록인] ${list.ID }
	</div>
	<div class="agency_number">
		이메일 : ${list.EEMAIL }
	</div>
	<div class="msg">
		※ 개인 직거래시 사기에 주의 하세요!!!
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
						[ 매물번호 ${list1.SELL_NUM } ]
					</h3>
				</div>
				<div align="center">
					<table class="table">
						<tbody>
							<tr>
								<th>개인 직거래</th>
								<td></td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${list.ID }</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${list.TELENUM }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div align="center" style="margin-bottom: 15px;">
					<h4>등록인 : ${list.ID }</h4>
				</div>
				<div class="modal-contact" align="center">
					연락처 : ${list.TELENUM }
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