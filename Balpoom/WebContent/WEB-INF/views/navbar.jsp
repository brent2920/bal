<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.container-fluid {
	font-size: 15px;
}
</style>

<nav class="navbar navbar-inverse"
	style="border-radius: 0px; margin-bottom: 0px;">
	<div class="container-fluid">
		<c:choose>
			<c:when test="${sessionScope.id == null }">
				<div class="navbar-header">
					<a class="navbar-brand" href="/"> <img alt="발품로고"
						src="/images/logo.png" width="70px" height="20px" />
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
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> 회원가입
					</a>
						<ul class="dropdown-menu">
							<li><a href="#"><span data-toggle="modal"
									data-target="#myJoin">개인 회원가입</span></a></li>
							<li><a href="#">공인중개사 회원가입</a></li>
						</ul></li>
					<li><a href="#"> <span class="glyphicon glyphicon-user"
							data-toggle="modal" data-target="#myModal">로그인</span>
			</c:when>


			<c:otherwise>
				<div class="navbar-header">
					<a class="navbar-brand" href="/"> <img alt="발품로고"
						src="/images/logo.png" width="70px" height="20px" />
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
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> ${sessionScope.id }
					</a>
						<ul class="dropdown-menu">
							<li><a href="t_info"><span data-toggle="modal"
									data-target="#myInfo">내 정보 수정</span></a></li>
							<li><a href="#">회원 탈퇴</a></li>
						</ul></li>
					<li><a href="/logout"> <span
							class="glyphicon glyphicon-user" data-toggle="modal"
							data-target="">로그아웃</span>
			</c:otherwise>
		</c:choose>

		<!-- 로그인 전 후 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ (session 부여) -->



		</a>
		<div class="modal fade" id="myModal" role="dialog">
			<form action="/login" method="post">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">로그인</h4>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="inputdefault">이메일</label> <input
									class="form-control" id="inputdefault" type="text" name="email">
							</div>

							<div class="form-group">
								<label for="inputdefault">비밀번호</label> <input
									class="form-control" id="inputdefault" type="text" name="pass1">
							</div>
							<button type="submit" class="btn btn-success"
								style="background-color: #04B486;">로그인</button>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</form>
		</div>



		<div class="modal fade" id="myJoin" role="dialog">
			<form action="/join" method="get">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">회원가입</h4>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="inputdefault">이름</label> <input class="form-control"
									name="id" type="text">
							</div>

							<div class="form-group">
								<label for="inputdefault">이메일</label> <input
									class="form-control" name="email" type="email">
							</div>
							<div class="form-group">
								<label for="inputdefault">비밀번호</label> <input
									class="form-control" name="password" type="password" id="pass" >
							</div>
							<div class="form-group">
								<label for="inputdefault">비밀번호 확인<span id="cmpResult"></span>
								</label> <input class="form-control" type="password" 
									id="rpass" onkeyup="javascript:passCompare()">
							</div>

							<div class="form-group">
								<label for="inputdefault">전화번호</label><br /> <select
									class="form-control" style="float: left; width: 100px"
									name="telenum1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> <input class="form-control" name="telenum2" type="text"
									style="width: 100px; float: left;"> <input
									class="form-control" name="telenum3" type="text"
									style="width: 100px; float: left;">
							</div>
							<br />
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success"
								style="background-color: #04B486;" disabled id="sbt">가입</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		
		</li>
		</ul>
	</div>
</nav>


<script>
	var flag1 = true, flag2 = false;
	function sbtChange() {
		if (flag1 && flag2) {
			document.getElementById("sbt").disabled = false;
		} else {
			document.getElementById("sbt").disabled = true;
		}
	}
	// string .. length 라는 property 가 존재함.. 문자열 길이.

	function passCompare() {

		var flag = document.getElementById("pass").value == document.getElementById("rpass").value;
		if (flag) {
			flag2 = true;
			document.getElementById("cmpResult").innerHTML = "비밀번호가 일치합니다";
			document.getElementById("cmpResult").style.color = "green";
		} else {
			flag2 = false;
			document.getElementById("cmpResult").style.color = "red";
			document.getElementById("cmpResult").innerHTML = "비밀번호가 일치하지 않습니다";
		}
		sbtChange();
	}
</script>
