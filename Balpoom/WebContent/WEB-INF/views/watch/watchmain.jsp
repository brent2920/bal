<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>






<nav class="navbar navbar-inverse" style="padding: 0%; margin: 0%">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li><a href="#">방 검색</a></li>
				<li><a href="#">관심목록</a></li>
				<li><a href="#">방 등록</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<li><a href="#">지도</a></li>
					<li><a href="/WEB-INF/views/watch/watchlist.jsp">리스트</a></li>			
				<li>
				</li>
				</ul>
				</div>		
				</nav>
				
<!-- 구글 지도 -->				
<div class="well row" style="margin: 0; padding: 0; ">
	<div class="col-md-9" style="border: 1px solid; height: 87%; background-color: white">	
</div>
	
<!-- 최근 본방 목록 -->	
	<div class="col-md-3"style="border: 1px solid; height: 87%; margin: 0; padding: 0; background-color: white">
	<div style="height: 6%; background-color: #222222; color: #919191; line-height: 38px; padding-left: 3%">> 검색 결과 (?)</div>
	
	
	<div style="overflow-x:hidden; overflow-y:auto; height: 87%">
	<div style="min-height: 125px; background-color: white; border: 1px solid; margin: 2%">확인용</div><!-- 목록창 -->
		<div style="min-height: 125px; background-color: white;border: 1px solid; margin: 2%">확인용</div><!-- 목록창 -->
		<div style="min-height: 125px; background-color: white;border: 1px solid; margin: 2%">확인용</div><!-- 목록창 -->
		<div style="min-height: 125px; background-color: white;border: 1px solid; margin: 2%">확인용</div><!-- 목록창 -->
		<div style="min-height: 125px; background-color: white;border: 1px solid; margin: 2%">확인용</div><!-- 목록창 -->
		</div>


	<!-- 전/후 -->
		<nav class="navbar navbar-inverse" style="padding: 0%; margin: 0%">
		<div class="container-fluid">	
		<div align="center">
		<div id="snav" style="height: 7%; width: 100%; background-color: #222222;  line-height: 48px">
		<a href="#" style="color:white; font-size: 14px; text-decoration: none; color: #919191;"> PREV < </a>
		<a href="#"	 style="color:white; font-size: 14px; text-decoration: none; color: #919191;"> > NEXT </a>
		</div>
		</div>
		</div>
	</nav>
	</div>
	
	
</div>