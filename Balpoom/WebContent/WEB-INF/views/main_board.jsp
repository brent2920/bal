<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	font-family: '나눔고딕';
	font-size: 10pt;
}
</style>

<c:choose>
<c:when test="${size gt 0 }">
 <style>
  .container {
   
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
      width: 69.5%; /* Set width to 100% */
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


<div style="padding-left: 5%; padding-top: 2%; " >


<div class="col-sm-3 carousel slide" id="myCarousel" data-ride="carousel" style="padding-top: 1%; padding-bottom: 1%">
    <!-- Indicators -->
    <ol class="carousel-indicators">
	   
    </ol>
    
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

	<c:forEach var="list" items="${list }" varStatus="vs">
		<c:choose>
			<c:when test="${vs.first}">
		      <div class="item active"> 
		     
		     
		      <c:choose> 
		      <c:when test="${list.url eq null }"> 
		      <img src="/images/soldout.jpg" width="100" height="300"> 	
		        </c:when>
		        <c:otherwise>
		     <img src="${list.url }" width="100" height="300"> 		        
		        </c:otherwise>
		        </c:choose>
		        
		        <div class="carousel-caption">
		          <h4> <a href="/detail?num=${list.SELL_NUM }" style="color: white;">  ${list.B_TITLE }</a></h4>
		          <p>${list.B_RINFO }</p>
		        </div>      
		      </div>
			</c:when>
		      
			<c:otherwise>
			
			
		      <div class="item">    
		       <c:choose> 
		      <c:when test="${list.url eq null }"> 
		      <img src="/images/soldout.jpg" width="100" height="300"> 	
		        </c:when>
		        <c:otherwise>
		     <img src="${list.url }" width="100" height="300"> 		        
		        </c:otherwise>
		        </c:choose>
		        
		      
		        <div class="carousel-caption">
		    <h4> <a href="/detail?num=${list.SELL_NUM }" style="color: white;">  ${list.B_TITLE }</a></h4>
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
</div>
  </c:when>
  <c:otherwise>
  
  <div style="padding-left: 5%; padding-top: 2%;"  class="col-sm-3" >
   <img src="/images/profile.jpg" width="300" height="200"> 
  
  </div>
  
  
  </c:otherwise>
  </c:choose>
  
  

<!-- 사진 슬라이드 끝 -->



	<div class="container" style="padding-top: 2%;">
		<div class="row">
			<div class="col-sm-4">
				<table class="table">
					<thead>
						<tr>
							<th><b style="font-size: 22px;">뉴스</b></th>
							<th>
								<div align="right">
									<a href="/news_list"><button type="button"
											class="btn btn-default btn-sm">더보기</button></a>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="0" end="3" varStatus="status">
							<c:if test="${news[i] != null }">
								<tr>
									<td colspan="2">
										<a href="${news[i].URL }">${news[i].TITLE }</a>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			
			<div class="col-sm-5">
				<table class="table">
					<thead>
						<tr>
							<th><b style="font-size: 22px;">공지사항</b></th>
							<th>
								<div align="right">
									<a href="/informationlist"><button type="button" class="btn btn-default btn-sm">더보기</button>
											</a>								
								</div>

							</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="i" begin="0" end="3" items="${infolist }">
						<c:if test="${i ne numm }">
						<tr>
							<td colspan="2">${i.NUM } &nbsp;<a href="/informationdetail?num=${i.NUM}" >${i.TITLE }</a></td>
						</tr>
						</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
</body>