<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="wrap-950 news-container">
	<div class="content">
		<h2>뉴스</h2>
		<ul>
		
		<c:forEach var="obj" items="${news }" varStatus="status">
			<li><a
				href="${obj.URL }"
				target="_blank">"${obj.TITLE }" <span>"${obj.DATES }"</span>
			</a></li>
		</c:forEach>
		
		</ul>
	</div>
</div>

</div>

