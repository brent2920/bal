<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/table.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="/javascript/table.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
   
  	.carousel-inner > .item > img,
  	.carousel-inner > .item > a > img {
  	    width: 70%;
   	   margin: auto;
  	}
 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>

<div class="jumbotron" style="margin-left:10em; margin-right:10em;">
  <div class="container text-center">
    <h1>다방정보</h1>      
    <p>정보들</p>
  </div>
</div>
  
<div class="container-fluid bg-3 text-center">    
  <h3>매물 사진</h3><br>
  <!-- 매물 정보 -->
  <div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="images/room.jpg" alt="Chania" width="260" height="145">
      </div>

      <div class="item">
        <img src="images/room2.jpg" alt="Chania" width="260" height="145">
      </div>
    
      <div class="item">
        <img src="images/room3.jpg" alt="Flower" width="260" height="145">
      </div>

      <div class="item">
        <img src="images/room4.jpg" alt="Flower" width="260" height="145">
      </div>
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
<!-- 매물정보 -->
</div><br>

<div class="container-fluid bg-3 text-center" style="margin-left:10em; margin-right:10em">    
 <h2>매물 정보</h2>
  <hr>
     보증금 /월세(조절 가능)    3000/20 <&nbsp>   방종류                     원룸 <br/>
     <hr/>
   해당 층 / 건물 층                 2층 /7층            공급/천용면적                    26.3<br/>
   <hr/>
   관리비                                       7만원                        관리비 항목<br/>
   <hr/>
   관리비                                       7만원                        관리비 항목<br/>
   <hr/>
 입주 가능일 즉시 입주<br/>
<hr/>

<div id="sForm" class="sForm sFormPadding">
        <span class="button close"><img src="http://i.imgur.com/nnzONel.png" alt="X"  class="" /></span>
        <h2 class="title">Add a New Record</h2>  
    </div>

<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
  
  
  
  
  
  
  
</div><br><br>

<div class="container-fluid bg-3 text-center">    
    <div class="row" style="margin-left:10em; margin-right:10em;">
    <div class="col-sm-2">
      <p>Some text..</p>
      <img src="images/e.PNG" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <p>Some text..</p>
      <img src="images/e.PNG" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
      <div class="col-sm-2">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>

  </div>
</div><br><br>


<div class="container-fluid bg-3 text-center">    
  <div class="row" style="margin-left:10em; margin-right:10em;">
    <div class="col-sm-2">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
      <div class="col-sm-2">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>

  </div>
</div><br><br>


<div class="container-fluid bg-3 text-center">   

  <div class="row" style="margin-left:10em; margin-right:10em;"> 
 <div class="col-sm-2">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
      <div class="col-sm-2">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>

  </div>
</div><br><br>

<div class="container-fluid bg-3 text-center">   

  <div class="row" style="margin-left:10em; margin-right:10em;"> 
상세설명
</div><br><br>
  <div class="row" style="margin-left:10em; margin-right:10em;"> 
 방에 대한 정보 
</div><br><br>

<footer class="container-fluid text-center">
  <p>지도 부분</p>
</footer>

</body>
</html>