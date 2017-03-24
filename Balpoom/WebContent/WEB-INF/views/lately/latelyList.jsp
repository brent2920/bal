<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
현재 있는 페이지는...<b>${page }</b>	





<div id="table_div" style="padding-left: 20%">
</div>




 <hr/>
 <div align="center">
<c:choose>
<c:when test="${page eq 1 }">
<a>이전</a>
</c:when>
<c:otherwise>
<a href ="/02?page=${page -1}">이전</a> 
</c:otherwise>
</c:choose>

<c:forEach var="p" begin="1"  end="${size}" varStatus="vs">
<c:choose>
<c:when test="${page eq p }">
	<b style="color: red">${p }</b>
</c:when>
<c:otherwise>
<a href ="/02?page=${p }">${p }</a> 
</c:otherwise>
</c:choose>
<c:if test="${vs.last eq false }">|</c:if> 
	
</c:forEach>
<c:choose>
<c:when test="${page eq size }">
<a>다음</a>
</c:when>
<c:otherwise>
<a href ="/02?page=${page +1}">다음</a> 
</c:otherwise>
</c:choose>
 </div>
 

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '제목');
        data.addColumn('string', '방 사진');
        data.addColumn('string', '월세/보증금');
        data.addColumn('string', '방종류');
        data.addColumn('string', '방정보');
        data.addColumn('string', '매물번호');
        data.addRows([
        	
        	   <c:forEach var="list" items="${list1 }" varStatus="vs" >
              	['${list.B_TITLE }', "<img src='${list.url }'/>", '${list.B_MPAY } / ${list.B_DEPOSIT }', '${list.B_RKIND }'
              		,'${list.B_RINFO}','<a href="/detail?num=${list.SELL_NUM}">${list.SELL_NUM}</a>']
              	<c:if test="${!vs.last }">,</c:if>
             	</c:forEach>
                 ]);
      

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {allowHtml : true, showRowNumber: true, width: '80%', height: '100%'});
      }
    </script>
   