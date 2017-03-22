<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="table_div">
</div>



 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'TITLE');
        data.addColumn('string', '방 사진');
        data.addColumn('string', '월세/보증금(월세가 0일때는 전세)');
        data.addColumn('string', '방종류');
        data.addRows([
        	   <c:forEach var="list" items="${list }" varStatus="vs">
              	['${list.B_TITLE }', "<img src='${list.url }'/>", '${list.B_MPAY } / ${list.B_DEPOSIT }', '${list.B_RKIND }']
              	<c:if test="${!vs.last }">,</c:if>
             	</c:forEach>
                 ]);
      

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {allowHtml : true, showRowNumber: true, width: '700%', height: '30%'});
      }
    </script>