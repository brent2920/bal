<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<style type="text/css">
td {
	font-family: �������;
}

h1 {
	font-family: �������;
}
</style>

<html>
<head>
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div>
		<tiles:insertAttribute name="navbar" />
	</div>
	<div style="min-height: 80%;">
		<tiles:insertAttribute name="main" />
	</div>
<!-- 	<div style="min-height: 10%;"> -->
<%-- 		<tiles:insertAttribute name="footer" /> --%>
<!-- 	</div> -->
</body>
</html>