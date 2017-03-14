<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">
					<img alt="logo" src="/WEB-INF/images/Logo.png"/>
				</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">방 검색</a></li>
				<li><a href="#">관심목록</a></li>
<!-- 				<li class="dropdown"><a class="dropdown-toggle" -->
<!-- 					data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a> -->
<!-- 					<ul class="dropdown-menu"> -->
<!-- 						<li><a href="#">Page 1-1</a></li> -->
<!-- 						<li><a href="#">Page 1-2</a></li> -->
<!-- 						<li><a href="#">Page 1-3</a></li> -->
<!-- 					</ul></li> -->
				<li><a href="#">방 등록</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<span class="glyphicon glyphicon-user"></span> 회원가입
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">개인 회원가입</a></li>
						<li><a href="#">공인중개사 회원가입</a></li>
					</ul>
				</li>
				<li>
					<a href="#">
<!-- 						<span class="glyphicon glyphicon-log-in"></span> 로그인 -->
						 <span class="glyphicon glyphicon-user" data-toggle="modal" data-target="#myModal">로그인</span>
						 <!-- 모델 바디 -->
						 			
					</a>
											 <div class="modal fade" id="myModal" role="dialog">
											   <form action="/login/loginHandler" method="post">
												    <div class="modal-dialog">
												    
												      <!-- Modal content-->
												      <div class="modal-content">
												        <div class="modal-header">
												          <button type="button" class="close" data-dismiss="modal">&times;</button>
												          <h4 class="modal-title">로그인</h4>
												        </div>
												        <div class="modal-body">
												         		
															          <div class="form-group">
																	      <label for="inputdefault">이메일</label>
																	      <input class="form-control" id="inputdefault" type="text">
																	    </div>
																	    
																	    
															          <div class="form-group">
																	      <label for="inputdefault">비밀번호</label>
																	      <input class="form-control" id="inputdefault" type="text">
																	    </div>
																	<button type="button" class="btn btn-success">로그인</button>
																	    
												        </div>
												        <div class="modal-footer">
												          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												        </div>
												      </div>
												      
												    </div>
												    </form>
												  </div>
				</li>
			</ul>
		</div>
	</nav>
<body>