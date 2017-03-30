<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<div>
		<tiles:insertAttribute name="navbar" />
	</div>
	
	<div style="min-height: 70%;">
		<tiles:insertAttribute name="main" />
	</div>
		<div style="min-height: 10%;">
		<tiles:insertAttribute name="reg" />
	</div>
	

	<div style="min-height: 10%">
		<tiles:insertAttribute name="footer"/>
	</div>
