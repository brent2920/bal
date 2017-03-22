<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
      
  }
  .carousel-inner img {
      -webkit-filter: grayscale(90%);
      filter: grayscale(90%); /* make all photos black and white */ 
      width: 30%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }  
  
  
 
  .carousel-control.left,  .carousel-control.right {
 
    background-image: linear-gradient(to right,rgba(0,0,0,.0) 0,rgba(0,0,0,.0001) 100%);
  
}
  
  
  
  
  
  </style>


<div style="padding-left: 5%; padding-right: 5%;">
<div class="col-sm-4 carousel slide" id="myCarousel" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
	    <c:forEach var="i" begin="1" end="${size }" >
	      <li data-target="#myCarousel" data-slide-to="${i }" class="active"></li>
	    </c:forEach>
    </ol>
    
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

	<c:forEach var="list" items="${list }" varStatus="vs">
		<c:choose>
			<c:when test="${vs.first}">
		      <div class="item active">   
		        <img src="${list.url }" alt="${list.SELL_NUM }" width="100" height="300">
		        <div class="carousel-caption">
		          <h4>${list.B_TITLE }</h4>
		          <p>${list.B_RINFO }</p>
		        </div>      
		      </div>
			</c:when>
		      
			<c:otherwise>
		      <div class="item">   
		        <img src="${list.url }" alt="${list.SELL_NUM }" width="100" height="300">
		        <div class="carousel-caption">
		          <h4>${list.B_TITLE }</h4>
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
</div>