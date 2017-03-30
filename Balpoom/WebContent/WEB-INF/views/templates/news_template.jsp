<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<html>
	<head>
		<title><tiles:getAsString name="title"/></title>
	</head>
	<body>
		<div>
			<tiles:insertAttribute name="navbar" />
		</div>
		
		<div>
			<tiles:insertAttribute name="main" />
		</div>
			<div>
			<tiles:insertAttribute name="reg" />
		</div>
		
		<div>
			<tiles:insertAttribute name="footer"/>
		</div>
	</body>
</html>