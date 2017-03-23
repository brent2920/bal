<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<title><tiles:getAsString name="title" /></title>
<div>
	<tiles:insertAttribute name="navbar" />
</div>
<div class="row" style="min-height: 80%; margin-left: 12%; margin-right: 12%; margin-top: 30px;">
	<div class="col-sm-8">
		<tiles:insertAttribute name="detail" />
	</div>
	<div class="col-sm-4" style="margin-top: 1em;">
	<div>
		<tiles:insertAttribute name="broker" />
	</div>
	</div>
</div>
<div>
	<tiles:insertAttribute name="footer" />
</div>
