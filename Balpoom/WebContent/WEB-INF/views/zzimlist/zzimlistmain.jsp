<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:choose>
	<c:when test="${listsize eq 0 }">
		<div align="center" style="padding-top: 25%; padding-bottom: 25%;
			font-size: 30px; color: #D8D8D8;">
			등록된 메물이 없습니다
		</div>
	</c:when>
	
	<c:otherwise>
<!-- 		<div style="margin-left: 100px; margin-top: 50px"> -->
		<div align="center" style="margin: 50px">
			<c:forEach items="${zzimlist }" var="i">
				<div class="roomInfo" style="float: left; background-color: #F2F2F2; border-radius: 5px; 
					padding: 20px; margin: 20px;" align="left" onclick="pageMove(${i.SELL_NUM})">
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
			</c:forEach>
		</div>
	</c:otherwise>
</c:choose>

<script>
	function pageMove(snum) {
		location.replace("http://localhost/detail?num=" + snum);
	}

	$(document).on("mouseenter", ".roomInfo", function() {
		$(this).css("cursor", "pointer");
	});

	$(document).on("mouseleave", ".roomInfo", function() {
		$(this).css("cursor", "default");
	});
</script>