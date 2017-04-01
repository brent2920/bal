<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="well">
<div class="container" style="padding-left: 30%; padding-right: 30%;">
<c:forEach var="hi" items="${list }" >
<label style="float: left; width: 115">${hi.NUM }</label>
<label style="float: left; width: 250"> ${hi.TITLE }</label>
<c:if test="${hi.detail ne null }">
<textarea rows="10" cols="50" class="form-control" readonly disabled > ${hi.detail }</textarea>
</c:if>
</c:forEach>

</div>


</div>
