<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2 align="center">공지사항</h2>

<div class="well" style="padding: 5%; margin: 5%">
<div class="container" >
<c:forEach var="hi" items="${list }" >
<c:if test="${hi.NUM ne null }">
<div class="form-group">
<div class="col-sm-3 alert alert-success">
<strong>공지사항 번호&emsp;</strong>${hi.NUM }<br/>
</div>
<div class ="col-sm-9 alert alert-danger" style="height: ">
<strong>공지사항 제목&emsp;</strong>${hi.TITLE }<br/>

</div>

</div>

</c:if>
<div class="form-group">
<c:if test="${hi.detail ne null }">
<br/><br/>
 <div class="alert alert-info">
 <div align="center">
   <h3> <strong>공지사항 내용</strong> </h3><br/>
   </div>
   <hr/>&emsp; ${hi.detail }
  </div>
</c:if>
</div>
</c:forEach>

</div>


</div>
<div align="center">
<form action="/informationlist">
<button type="submit" class="btn btn-info">이전</button>
</form>
</div>