<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
testing2<br/>

${mlistsize }<br/>

<c:forEach var="obj" items="${mlist }" varStatus="status">
	
		WRITER: "${obj.B_TITLE }",<br/>
	  	CONTENT :"${obj.B_GPAY }" <br/>
	  	
	  
<%-- 	  	WRITEDATE : "<fmt:formatDate value="${obj.WRITEDATE }" pattern="MM.dd HH:mm"/>"<br/> --%>
	  	<hr/>

</c:forEach>
