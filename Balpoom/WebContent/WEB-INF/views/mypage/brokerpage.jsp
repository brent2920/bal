<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:choose>
<%-- "${list.size() eq 0 }" --%>
	<c:when test="${listzero eq 0 }">
	<div align="center" style="padding-top: 25%; padding-bottom: 25%;
			font-size: 30px; color: #D8D8D8;">
			등록된 메물이 없습니다
		</div>
	</c:when>
	<c:otherwise>

		<div align="center" style="margin: 50px">
			<c:forEach items="${list }" var="i">
				<div class="roomInfo" style="float: left; background-color: #F2F2F2; border-radius: 5px; 
					padding: 20px; margin: 20px;" align="left" >
					<div onclick="pageMove(${i.SELL_NUM})">
					<div style="display: none" >
						<input type="text" id="sell"  value="${i.SELL_NUM }">
					</div>
						<div>
							<img alt="${i.SELL_NUM}" src="${i.IMAGE }" style="width: 150px; height: 150px;">
						</div>
						<div align="center" style="margin-top: 10px; font-size: 13px; color: #585858;">
							<b>[ 매물번호: ${i.SELL_NUM} ]</b>
						</div>
						<div align="center" style=" margin-bottom: 5px; color: #FE9A2E;">
							<b>${i.B_RINFO }</b>
						</div>
						<div align="center" style="font-size: 12px; color: gray;">
							위치 : ${fn:substring(i.B_TITLE, 0, 20) }
						</div>
						<div align="center" style="font-size: 12px; color: gray;">
							옵션: ${fn:substring(i.B_OPTION, 0, 20) } 등
						</div>
					</div>
					<div>
					<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#complate" id="commentadd" style="width: 150px">판매완료</button>
					</div>
				</div>
			</c:forEach>
		</div>

	</c:otherwise>

</c:choose>


<!-- 모델 부분 -->
<div class="modal fade" id="complate" role="dialog">
	<div class="modal-dialog modal-la">
		<div class="modal-content" style="padding: 10px;">
			<div class="modal-contact" align="center">판매완료 및 매물등록을 삭제 하고 싶을
				경우 확인을 눌러주세요</div>
				<br/>
			<div align="center">
				<button type="button" class="btn btn-primary" id="complateok"
					style="width: 120px">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal"
					 style="width: 120px">취소</button>
			</div>
		</div>
	</div>
</div>


<script>
	function pageMove(snum) {
// 		window.aleart("test");
		location.replace("http://localhost/detail?num=" + snum);
	}

	$(document).on("mouseenter", ".roomInfo", function() {
		$(this).css("cursor", "pointer");
	});

	$(document).on("mouseleave", ".roomInfo", function() {
		$(this).css("cursor", "default");
	});
	
	$("#complateok").click(function(){
		var sell = $("#sell").val();
		var comp = new XMLHttpRequest();
		comp.open("get", "/brokercomplate?sell="+sell, true);
		comp.send();
		comp.onreadystatechange = function(){
			if (comp.status == 200 && comp.readyState == 4) {
				var zzim1 = comp.responseText;
				console.log(zzim1);
				if (zzim1 == 'CY') {
					window.alert("등록된 매물이 삭제 되었습니다");
					location.reload();
				}
			}
		}
		
	})
	
	
	
	
	
	
</script>







