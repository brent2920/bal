<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
 td {font-family: 나눔고딕;}
 h1 {font-family: 나눔고딕;}
</style>
<html>
	<head>
	<title><tiles:getAsString name="title" /></title>
	</head>
	<body>
		<div>
			<tiles:insertAttribute name="navbar" />
		</div>
		<div style="min-height: 80%" >
			<tiles:insertAttribute name="main" />
		</div>
		<div style="min-height: 10%">
			<tiles:insertAttribute name="footer"/>
		</div>
	</body>
</html>