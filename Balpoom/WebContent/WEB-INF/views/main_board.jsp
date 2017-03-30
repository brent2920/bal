<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	font-family: '나눔고딕';
	font-size: 10pt;
}
</style>

<body>
	<div class="container" style="padding-top: 2%">
		<div class="row">
			<div class="col-sm-6">
				<table class="table">
					<thead>
						<tr>
							<th><b style="font-size: 22px;">뉴스</b></th>
							<th>
								<div align="right">
									<a href="/news_list"><button type="button"
											class="btn btn-default btn-sm">더보기</button></a>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="0" end="3" varStatus="status">
							<c:if test="${news[i] != null }">
								<tr>
									<td colspan="2">
										<a href="${news[i].URL }">${news[i].TITLE }</a>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			
			<div class="col-sm-6">
				<table class="table">
					<thead>
						<tr>
							<th><b style="font-size: 22px;">공지사항</b></th>
							<th>
								<div align="right">
									<button type="button" class="btn btn-default btn-sm">더보기</button>
								</div>

							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="2">Test1</td>
						</tr>
						<tr>
							<td colspan="2">Test2</td>
						</tr>
						<tr>
							<td colspan="2">Test3</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>