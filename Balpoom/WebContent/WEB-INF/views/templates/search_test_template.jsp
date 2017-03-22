<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div>
		<tiles:insertAttribute name="navbar" />
	</div>
	<div>
		<tiles:insertAttribute name="search_navbar" />
	</div>
	<div style="min-height: 80%;">
		<tiles:insertAttribute name="main" />
	</div>
</body>
</html>