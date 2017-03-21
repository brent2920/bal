<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
</head>
<body>

	<form action="/broker_join/data" method="post">

		<div class="container" style="padding-left: 10%; padding-right: 10%;">
			<h2>중개사 회원가입</h2>

			<div class="well">
				<h4>등록인 정보입력</h4>
				<br />

				<div class="form-group">
					<label for="bk_address" style="float: left; width: 115">등록인
						이름:</label> <input type="text" class="form-control" id="bk_regname"
						name="bk_regname" style="float: left; width: 250" /> <b
						style="color: gray; width: 300">&emsp;등록인 이름을 입력하세요.</b>
				</div>

				<div class="form-group">
					<label for="id" style="float: left; width: 115">아이디(Email):</label>
					<input type="email" class="form-control"
						style="float: left; width: 250" id="id"
						placeholder="ID(Email)를 입력하세요" name="id" /> <b
						style="color: gray">&emsp;가입 후 아이디로 사용됩니다.</b>
				</div>


				<div class="form-group">
					<label for="bk_password" style="float: left; width: 115">비밀번호:</label>
					<input type="password" class="form-control" id="bk_password"
						placeholder="비밀번호를 입력하세요" style="float: left; width: 250"
						name="bk_password" /> <b style="color: gray">&emsp;비밀번호를
						입력하세요.</b>
				</div>


				<div class="form-group">
					<label for="bk_password1" style="float: left; width: 115">비밀번호
						확인:</label> <input type="password" style="float: left; width: 250"
						class="form-control" id="bk_password1" placeholder="비밀번호를 입력하세요" />
					<b style="color: gray">&emsp;비밀번호를 입력하세요.</b>
				</div>

				<div class="form-group">
					<label for="bk_contact" style="float: left; width: 115">개인
						연락처:</label> <select name="bk_contact" class="form-control"
						style="float: left; width: 80">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select> <input type="text" class="form-control " id="bk_contact"
						name="bk_contact" style="float: left; width: 85" /> <input
						type="text" class="form-control " id="bk_contact"
						name="bk_contact" style="float: left; width: 85" /> <b
						style="color: gray"> &emsp; 개인 휴대전화 번호를 입력하세요.</b>
				</div>
				<hr />
				<h4>중개사무소 정보 입력</h4>
				<br />
				<div class="form-group">
					<label for="bk_address" style="float: left; width: 115">부동산
						이름:</label> <input type="text" class="form-control" id="bk_officename"
						name="bk_officename" style="float: left; width: 250" /> <b
						style="color: gray">&emsp;등록관청에 등록된 사무소 이름을 입력해주세요.</b>
				</div>


				<div class="form-group">
					<label for="bk_email" style="float: left; width: 115">부동산
						이메일:</label> <input type="email" style="float: left; width: 250"
						class="form-control" id="bk_email" placeholder="Enter email"
						name="bk_email" /> <b style="color: gray">&emsp;중개사무소 이메일을
						입력해주세요.</b>
				</div>
				<div class="form-group">
					<label for="bk_contact" style="float: left; width: 115">사무소
						유선번호:</label> <select name="bk_agentnum" class="form-control"
						style="float: left; width: 80">
						<option>02</option>
						<option>031</option>
						<option>032</option>
						<option>033</option>
						<option>041</option>
						<option>042</option>
						<option>043</option>
						<option>051</option>
						<option>052</option>
						<option>053</option>
						<option>054</option>
						<option>055</option>
						<option>061</option>
						<option>062</option>
						<option>063</option>
						<option>064</option>
					</select> <input type="text" class="form-control" id="bk_agentnum"
						name="bk_agentnum" style="float: left; width: 85" /> <input
						type="text" class="form-control" id="bk_agentnum"
						name="bk_agentnum" style="float: left; width: 85" /> <b
						style="color: gray">&emsp;사무소 유선번호를 지역번호부터 입력해주세요.</b>
				</div>
				<hr />
				<div class="form-group">
					<label for="bk_address" style="float: left; width: 115">부동산
						주소:</label>
					<button class="btn" name="btn" type="button"
						id="postcodify_search_button">검색</button>
					<input type="text" class="form-control postcodify_address" id="bk_address" name="bk_address" style="float: left; width: 250" />
					<br /> 
					<label for="bk_address" style="float: left; width: 115">상세주소:</label> <input type="text" class="form-control postcodify_address"
						id="bk_address" name="bk_address" style="float: left; width: 250" />

				</div>
				<hr />

				<div class="form-group">
					<label for="bk_num" style="float: left; width: 115">중개등록번호:</label>
					<input type="text" class="form-control" id="bk_num" name="bk_num"
						style="float: left; width: 250" /> <b style="color: gray">&emsp;중개사무소
						사업자 등록번호를 입력해주세요.</b>
				</div>

			</div>
			
		<hr/>
			&emsp;전체약관에 동의합니다. <input type="checkbox" id="a1" />
		<hr />
			<div class="container">
				<div>
				<input type="checkbox" class="sub" id="a2" />이용약관에 동의합니다.
		
				<a type="button" data-toggle="modal"
						data-target="#aa3">보기</a>
							</div>
				</div>	

				<div class="modal fade" id="aa3" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>

								<h4 class="modal-title">부동산 중개사무소 매물등록 서비스 약관</h4>
							</div>
							<div class="modal-body">
								<p>
								
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>

							</div>
						</div>

					</div>

				</div>

		<div class="container">
				<div>

				<input type="checkbox" class="sub" id="a3" /> 부동산 중개사무소 매물 등록 서비스
				약관에 동의합니다.
			<a type="button" data-toggle="modal"
						data-target="#aa2">보기</a>
			</div>
				</div>

				<div class="modal fade" id="aa2" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>

								<h4 class="modal-title">부동산 중개사무소 매물등록 서비스 약관</h4>
							</div>
							<div class="modal-body">
								<p>
								
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>

							</div>
						</div>

					</div>

				</div>
	<div class="container">
				<div>
			<input type="checkbox" class="sub" id="a4" /> 개인정보 수집 및 이용에 대한 동의에
					동의합니다. <a type="button" data-toggle="modal"
						data-target="#aa1">보기</a>
				</div>



			
				<div class="modal fade" id="aa1" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>

								<h4 class="modal-title">개인정보처리방침</h4>
							</div>
							<div class="modal-body">
								<p>
								
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>

							</div>
						</div>

					</div>

				</div>
				<hr />
				<button type="submit" class="btn btn-default" id="next" disabled="disabled">Submit</button>
			</div>
			</div>
	</form>
	
	
	<script>
	var cnt = 0;
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
			
		});
		$("#a1").on("click", function() {
			$(".sub").each(function() {
				$(this).prop("checked", $("#a1").prop("checked"));
				if($(this).prop("checked")){
					$("#next").prop("disabled",false);
				}else{
					$("#next").prop("disabled",true);
				}
			})
			enableCheck();
		});
		$("#a2").click(function() {
			enableCheck();
		});

		$("#a3").click(function() {
			enableCheck();
		});

			$("#a4").click(enableCheck);
			function enableCheck() {
				var cnt = 0;
				$(".sub").each(function() {
					if ($(this).prop("checked"))
						cnt++;
				});

				if (cnt == 3) {
					$("#a1").prop("checked", true);

					$("#next").prop("disabled", false);
				} else {
					$("#a1").prop("checked", false);
					$("#next").prop("disabled", true);
				}
			}
		
		console.log(cnt)
	</script>
	<c:if test="${fail ne null }">
		<script>
			window.alert("다시 입력하세요!!");
		</script>
	</c:if>