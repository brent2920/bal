<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<style type="text/css">
td {
	font-family: 나눔고딕;
}

h1 {
	font-family: 나눔고딕;
}
</style>

<html>
<head>
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div>
		<tiles:insertAttribute name="navbar" />
	</div>
	
	<div>
		<tiles:insertAttribute name="main" />
	</div>

	<div>
		<tiles:insertAttribute name="lately" />
	</div>

	<div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>