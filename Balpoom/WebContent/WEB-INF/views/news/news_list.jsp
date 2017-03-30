<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<c:choose>
	<c:when test="${email eq 'master@master.com' }">
		<div class="wrap-950 news-container" style="margin-top: 5%; margin-left: 15%; margin-right: 15%;">
			<div class="content" >
				<h1 align="center">NEWS</h1>
				<table class="table">
					<thead>
						<tr>
							<th style="text-align: center;">
								순번
							</th>
							<th>
								기사제목
							</th>
							<th style="text-align: center;">
								등록일
							</th>
							<th style="text-align: center;">
								삭제
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${news }" varStatus="status">
							<tr>
								<td style="text-align: center;">${status.index +1 }</td>
								<td>
									<a href="${obj.URL }" target="_blank">${obj.TITLE }</a>
								</td>
								<td style="text-align: center;">
									<fmt:formatDate value="${obj.DATES }"/> 
								</td>
								<td style="text-align: center;">
									<button class="btn commentdel" type="button"
										style="background-color: white;" value="${obj.URL }">
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
				<h1 align="center">NEWS</h1>
				<table class="table">
					<thead>
						<tr>
							<th style="text-align: center;">
								순번
							</th>
							<th>
								기사제목
							</th>
							<th style="text-align: center;">
								등록일
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${news }" varStatus="status">
							<tr>
								<td style="text-align: center;">${status.index +1 }</td>
								<td>
									<a href="${obj.URL }" target="_blank">${obj.TITLE }</a>
								</td>
								<td style="text-align: center;">
									<fmt:formatDate value="${obj.DATES }"/> 
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
			"url" : "/news_delete",
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