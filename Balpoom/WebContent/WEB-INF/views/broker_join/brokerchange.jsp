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
	



	<form action="/broker/ChangeResult" method="post">

		<div class="container" style="padding-left: 10%; padding-right: 10%;">
			<h2>중개사 정보수정</h2>

			<div class="well">
				<h4>등록인 정보입력</h4>
				<br />

				<div class="form-group">
					<label for="bk_address" style="float: left; width: 115">등록인
						이름:</label> <input type="text" class="form-control" id="bk_regname"
						name="bk_regname" style="float: left; width: 250" /> <b
						style="color: gray; width: 300">&emsp; 등록인 이름을 입력하세요.</b>
				</div>

				<div class="form-group">
					<label for="id" style="float: left; width: 115">아이디(Email):</label>
					<input type="text" disabled="disabled" class="form-control"
						style="float: left; width: 250" id="id123" 
						placeholder="ID(Email)를 입력하세요" name="id" value="${list.ID }"/><br/>
					
				</div>


				<div class="form-group">
					<label for="bk_password" style="float: left; width: 115">비밀번호:</label>
					<input type="password" class="form-control" id="bk_password"
						placeholder="비밀번호를 입력하세요" style="float: left; width: 250"
						name="bk_password" /> <b style="color: gray">&emsp; 비밀번호를 입력하세요.</b>
				</div>


				<div class="form-group">
					<label for="bk_password1" style="float: left; width: 115">비밀번호
						확인:</label> <input type="password" style="float: left; width: 250"
						class="form-control" id="bk_password1" placeholder="비밀번호를 입력하세요" />&emsp;<b id ="rst"></b><br/>
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
						name="bk_officename" style="float: left; width: 250" value="${list.BK_OFFICENAME }"  disabled="disabled"/>
				</div>
<br/>	

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
					<label for="bk_address" style="float: left; width: 115">부동산 주소:</label>
					<button class="btn" name="btn" type="button"
						id="postcodify_search_button" style="height: 35">검색</button>
					<input type="text" class="form-control postcodify_address" id="bk_address" name="bk_address" style="float: left; width: 200"/>
					<b style="color: gray">&emsp;부동산 주소를 입력해주세요.</b><br/>
					<label for="bk_address" style="float: left; width: 115">상세주소:</label> <input type="text" class="form-control"
						id="bk_address" name="bk_address" style="float: left; width: 250" />

				</div>
				<hr />

				<div class="form-group">
					<label for="bk_num" style="float: left; width: 115">중개등록번호:</label>
					<input type="text" class="form-control" id="bk_num" name="bk_num"
						style="float: left; width: 250" disabled="disabled" value="${list.BK_NUM }"/><br/>
				</div>

			</div>
			
		<hr/>
		<button type="submit" class="btn btn-default" id="next" disabled="disabled">Submit</button>

		</div>
	
	</form>
	
	
	<script>
	
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
			
		});
	</script>
	
	<c:if test="${fail ne null }">
		<script>
			window.alert("다시 입력하세요!!");
		</script>
	</c:if>
	
	
	

	

<script>
 $(function(){
  $('#bk_password').keyup(function(){
   $('span[id=rst]').text('');
  }); //#user_pass.keyup

  $('#bk_password1').keyup(function(){
   if($('#bk_password').val()!=$('#bk_password1').val()){
    $('b[id=rst]').text('');
    $('b[id=rst]').html(" 비밀번호가 일치하지 않습니다.");
    $('b[id=rst]').css("color","red");
   }else{
    $('b[id=rst]').text('');
    $('b[id=rst]').html("비밀번호가 일치합니다.");
    $('b[id=rst]').css("color","green");
   	 $("#next").attr("disabled",false);
   }
  }); //#chpass.keyup
 });
</script>


