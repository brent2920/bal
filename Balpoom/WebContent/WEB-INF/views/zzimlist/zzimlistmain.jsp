<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:choose>

	<c:when test="${listsize eq 0 }">
		등록된 메물이 없습니다
	</c:when>
	<c:otherwise>
	
		<div style="margin-left : 100px; margin-top: 50px">
			<c:forEach items="${zzimlist }" var="i">
				<div  class="roomInfo" style="float: left;
					background-color: #E6E6E6; border-radius: 5px; padding: 20px; margin: 20px;" align="left" 
					onclick="pageMove(${i.SELL_NUM})">
					<span><img alt="${i.SELL_NUM}" src="${i.IMAGE }" style="width: 250px; height: 210px;"> </span><br/>
					<span>${i.B_TITLE }</span><br/><br/>
					<span style="font-size: 12px; color: green">${fn:substring(i.B_RINFO, 0, 20) }.. </span><br/>
					
					<span style="font-size: 12px; color: green">${fn:substring(i.B_OPTION, 0, 20) }..</span>
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