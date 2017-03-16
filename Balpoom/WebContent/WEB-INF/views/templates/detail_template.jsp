<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<div>
	<tiles:insertAttribute name="navbar" />
</div>
<div class="row" style="min-height: 80%;">
	<div style="margin-left: 4em; margin-right: 4em;">
		<div class="col-sm-8">
			<tiles:insertAttribute name="detail" />
		</div>
		<div class="col-sm-4">
			<!-- 중개사 정보 타일삽입 -->
		</div>
	</div>
</div>
<div>
	<tiles:insertAttribute name="footer" />
</div>
