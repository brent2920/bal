<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'></link>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="/javascript/table.js"></script>
<link rel="stylesheet" href="/css/table.css">

<title><tiles:getAsString name="title" /></title>

	<div>
		<tiles:insertAttribute name="navbar" />
	</div>
	<div style="min-height: 80%;">
		<tiles:insertAttribute name="main" />
	</div>
	

	<div style="min-height: 10%">
		<tiles:insertAttribute name="footer"/>
	</div>
