<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<c:choose>
	<c:when test="${email eq 'master@master.com' }">
		<div class="wrap-950 news-container" style="margin-top: 5%; margin-left: 15%; margin-right: 15%;">
			<div class="content" >
				<h1 align="center">공지사항</h1>
				<table class="table">
					<thead>
						<tr>
							<th style="text-align: center;">
								글번호
							</th>
							<th>
								제목
							</th>
							<th style="text-align: center;">
								등록인
							</th>
							<th style="text-align: center;">
								삭제
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${infolist }" varStatus="status">
							<tr>
								<td style="text-align: center;">${obj.NUM }</td>
								<td>
									<a href = "/informationdetail?num="${obj.NUM }>${obj.TITLE }</a>
								</td>
								<td style="text-align: center;">
									"${obj.ID }"
								</td>
								
								<td style="text-align: center;">
									<button class="btn commentdel" type="button"
										style="background-color: white;" value="${obj.NUM }">
										<span class="glyphicon glyphicon-remove-circle"></span>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:when>
	
	
	<c:otherwise>
		<div class="wrap-950 news-container" style="margin-top: 5%; margin-left: 20%; margin-right: 20%;">
			<div class="content">
				<h1 align="center">공지사항</h1>
				<table class="table">
					<thead>
						<tr>
							<th style="text-align: center;">
								글 번호
							</th>
							<th>
								제목
							</th>
							<th style="text-align: center;">
								등록인
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${infolist }" varStatus="status">
							<tr>
								<td style="text-align: center;">${obj.NUM}</td>
								<td>
									<a href ="/informationdetail?num=${obj.NUM }">${obj.TITLE }</a>
								</td>
								<td style="text-align: center;">
									"${obj.ID }"
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:otherwise>
</c:choose>

<script>

	$(".commentdel").click(function() {
		//alert($(this).val());
		console.log("commendal");
		$.ajax({
			"url" : "/informationdelete",
			"data" : {

				"url" : $(this).val()
			},
			"method" : "post"
		}).done(function(rst) {
			if (rst == 'YYY') {
				window.alert("삭제 되었습니다");
				location.reload();
			} else {
				window.alert("삭제중 문제가 발생되었습니다");
			}
		});
	});
</script>