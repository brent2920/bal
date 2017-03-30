<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<c:choose>
	<c:when test="${email eq 'master@master.com' }">
<!-- 등록 버튼 -->
<div style="height: 25px"></div>

<div align="center">
	<button type="submit" class="btn btn-primary" data-toggle="modal"
		data-target="#myWrite" id="commentadd">등록</button>
	<a href="/"><button type="button" class="btn btn-danger " >취소</button></a>
</div>



<!-- 등록 모달 -->
<div class="modal fade" id="myWrite" role="dialog">
	<div class="modal-dialog modal-la">
		<div class="modal-content" style="padding: 10px;">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<div class="modal-contact" align="center">관리자 뉴스 등록</div>
			<div style="height: 20px"></div>
			<div>
				<input type="text" placeholder="title" class="form-control"
					name="titles" id="titles">
			</div>
			<br/>
			<div>
				<input type="text" placeholder="url" class="form-control"
					name="urls" id="urls">
			</div>
			
			<div align="center" style="margin-top: 20px; margin-bottom: 20px;">
				<button type="submit" class="btn btn-primary" id="rwrite" >
					등록</button>
				<button type="button" class="btn btn-default" data-dismiss="modal"
					>닫기</button>
			</div>
		</div>
	</div>
</div>
</c:when>
<c:otherwise>

<div style="height: 25px"></div>

<div align="center">
	<a href="/"><button type="button" class="btn btn-danger " >되돌아기</button></a>
</div>


<div class="modal fade" id="myWrite" role="dialog">
	<div class="modal-dialog modal-la">
		<div class="modal-content" style="padding: 10px;">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<div class="modal-contact" align="center">관리자 뉴스 등록</div>
			<div style="height: 20px"></div>
			<div>
				<input type="text" placeholder="title" class="form-control"
					name="titles" id="titles">
			</div>
			<br/>
			<div>
				<input type="text" placeholder="url" class="form-control"
					name="urls" id="urls">
			</div>
			
			<div align="center" style="margin-top: 20px; margin-bottom: 20px;">
				<button type="submit" class="btn btn-primary" id="rwrite" >
					등록</button>
				<button type="button" class="btn btn-default" data-dismiss="modal"
					>닫기</button>
			</div>
		</div>
	</div>
</div>
</c:otherwise>
</c:choose>
<script>

	$("#rwrite").click(function(){
		
			$.ajax({
				"url" : "/news_insert",
				"data" : {
					"title" : $("#titles").val(),
					"url" : $("#urls").val()
				},
				"method" : "post"
			}).done(function(rst){
				if (rst == 'YYY') {
					window.alert("댓글 등록이 성공적으로 처리 되었습니다");
					location.reload();
				} else {
					window.alert("댓글 등록중 오류가 발생 하였습니다");
				}
			});
		
	});
				
</script>		
			

