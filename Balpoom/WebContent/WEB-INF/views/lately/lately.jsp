<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
/*   .container { */
/*       padding: 80px 120px; */
/*   } */
/*   .person { */
/*       border: 10px solid transparent; */
/*       margin-bottom: 25px; */
/*       width: 30%; */
/*       height: 30%; */
/*       opacity: 0.7; */
/*   } */
/*   .person:hover { */
/*       border-color: #f1f1f1; */
/*   } */
  </style>
</head>
<body>

<div class="col-sm-4 carousel slide" id="myCarousel" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
	    <c:forEach var="i" begin="1" end="${size }" >
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	    </c:forEach>
    </ol>
    
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

	<c:forEach var="list" items="${list }" varStatus="vs">
		<c:choose>
			<c:when test="${vs.first}">
		      <div class="item active">   
		        <img src="${list.url }" alt="${list.SELL_NUM }" width="400" height="400">
		        <div class="carousel-caption">
		          <h3>${list.B_TITLE }</h3>
		          <p>${list.B_RINFO }</p>
		        </div>      
		      </div>
			</c:when>
		      
			<c:otherwise>
		      <div class="item">   
		        <img src="${list.url }" alt="${list.SELL_NUM }" width="400" height="400">
		        <div class="carousel-caption">
		          <h3>${list.B_TITLE }</h3>
		          <p>${list.B_RINFO }</p>
		        </div>      
		      </div>
			</c:otherwise>
	      </c:choose>
      
 	</c:forEach>
     </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<c:forEach begin="1" end="2" step="1">
	<div class="col-sm-4">
		<table class="table">
			<thead>
				<tr>
					<th><b style="font-size: 22px;">공지사항</b></th>
					<th>
						<div align="right">
							<button type="button" class="btn btn-default btn-sm">더보기</button>
						</div>
					</th>					
				</tr>
			</thead>
			<tbody>
				<tr><td colspan="2">Test1</td></tr>
				<tr><td colspan="2">Test2</td></tr>
				<tr><td colspan="2">Test3</td></tr>
			</tbody>
		</table>
	</div>
</c:forEach>