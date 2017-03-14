<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>

 .button {
   border: 0px solid #0a3c59;
   background: #3e779d;
   background: -webkit-gradient(linear, left top, left bottom, from(#65a9d7), to(#3e779d));
   background: -webkit-linear-gradient(top, #65a9d7, #3e779d);
   background: -moz-linear-gradient(top, #65a9d7, #3e779d);
   background: -ms-linear-gradient(top, #65a9d7, #3e779d);
   background: -o-linear-gradient(top, #65a9d7, #3e779d);
   background-image: -ms-linear-gradient(top, #65a9d7 0%, #3e779d 100%);
   padding: 6px 12px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   text-shadow: #7ea4bd 0 1px 0;
   color: #06426c;
   font-size: 14px;
   font-family: 나눔고딕;
   text-decoration: none;
   vertical-align: middle;
  
   }
.button:hover {
   border: 0px solid #0a3c59;
   text-shadow: #1e4158 0 1px 0;
   background: #3e779d;
   background: -webkit-gradient(linear, left top, left bottom, from(#65a9d7), to(#3e779d));
   background: -webkit-linear-gradient(top, #65a9d7, #3e779d);
   background: -moz-linear-gradient(top, #65a9d7, #3e779d);
   background: -ms-linear-gradient(top, #65a9d7, #3e779d);
   background: -o-linear-gradient(top, #65a9d7, #3e779d);
   background-image: -ms-linear-gradient(top, #65a9d7 0%, #3e779d 100%);
   color: #fff;
   }
.button:active {
   text-shadow: #1e4158 0 1px 0;
   border: 0px solid #0a3c59;
   background: #65a9d7;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#3e779d));
   background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
   background: -moz-linear-gradient(top, #3e779d, #65a9d7);
   background: -ms-linear-gradient(top, #3e779d, #65a9d7);
   background: -o-linear-gradient(top, #3e779d, #65a9d7);
   background-image: -ms-linear-gradient(top, #3e779d 0%, #65a9d7 100%);
   color: #fff;
   }


	div.col-md-9{
		border: 1px solid;
		height: 85%;
	}
	div.col-md-3{
		border: 1px solid;
		height: 85%;
	}
	


</style>
<div style="min-width: 100%;"> 
<div id="nav" style="height: 5%;  padding: 0%; margin: 0%;  position: fixed;  min-width:100%">

<div class="col-md-11" style="padding: 0%; margin: 0%; height: 0;" >
	<button type="submit" class="button" >최근 본방</button>
	<button type="submit" class="button">찜한 방</button>
	<button type="submit" class="button">연락한 방</button>
</div>
<div class="col-md-1" style="padding: 0%; margin: 0%;" >
	<button type="submit" class="button" >지도</button>
	<button type="submit" class="button">리스트</button>
</div>
</div>


<div style="height: 33px"></div>
<div class="well row">
	<div class="col-md-9"  style="width: 72%"></div>
	<div class="col-md-3"  style="width: 28%; ">
		<div id="snav" style="height: 6%; width: 100%; background-color: 3490D2">
			<b style="font-family: 나눔고딕; color: white; line-height: 38px; padding-left: 3%"> > 검색결과</b><br/>
		</div>
		<!-- 중간 틀 -->
		<div style="overflow-x:hidden; overflow-y:auto; height: 87%" >
		
		<b style="font-family: 나눔고딕; color: black; line-height: 38px; padding-left: 3%"> 최근 본 방</b><br/>
		
		<!-- ==================확인용=================== -->
		<div style="min-height: 125px; background-color: white; border: 1px solid">확인용</div><!-- 목록창 -->
		<div style="min-height: 125px; background-color: white;border: 1px solid">확인용</div><!-- 목록창 -->
		<div style="min-height: 125px; background-color: white;border: 1px solid">확인용</div><!-- 목록창 -->
		<div style="min-height: 125px; background-color: white;border: 1px solid">확인용</div><!-- 목록창 -->
		<div style="min-height: 125px; background-color: white;border: 1px solid">확인용</div><!-- 목록창 -->
		
		</div>
		<div align="center">
		<div id="snav" style="height: 7%; width: 100%; background-color: 3490D2; line-height: 48px">
		<a href="" style="color:white; font-size: 14px; text-decoration: none;"> PREV < </a>
		<a href="" style="color:white; font-size: 14px; text-decoration: none;"> > NEXT </a>
			</div>
		</div>
	</div>
	</div>
	</div>
