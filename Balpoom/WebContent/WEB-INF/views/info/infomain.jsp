<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<style>
	table{
	bgColor=#424242;
	
	
	}
	
	#title{
		width: 150px;
		height: 60px;
		background-color: #B0C4DE;
		font-size: 12px;
	}
	#memo{
		width: 490px;
		height: 60px;
		padding-left: 4%;

	}
	#btn{
		text-align: center;
		width: 100%;
		height: 100px;
	
	}
	#bt{
		width: 260px;
		height: 60px;
	
	}
		
	
	
	</style>
	
	<div style="padding-left:30%; padding-top:6%; padding-bottom:6%">
	<form action="/infochange">
	<h3 style="font-family: 나눔고딕"><img alt="발품로고" src="/images/logo.png" width="70px" height="20px" />회원 정보 수정</h3>
	<br/>
	<table border="2px solid">
	<tr>
		<td id="title">본인 성명</td>
		<td id="memo"><input type="text" class="form-control" value="${id }" name="id"></td>
	
	</tr>
	<tr>
		<td id="title">이메일 주소</td>
		<td id="memo">${info.EMAIL }</td>
		
	</tr>
	<tr>
		<td id="title">휴대폰 번호</td>
		<td id="memo">
		<select class="form-control" style="float: left; width: 100px" name="telenum1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
		</select>
		<input class="form-control" name="telenum2" type="text"
			style="width: 100px; float: left;"> <input class="form-control"
			name="telenum3" type="text" style="width: 100px; float: left;">
		</td>
	</tr>
	<tr>
		<td id="title" rowspan="3">비밀번호 변경</td>
		<td id="memo">
			<input type="password" class="form-control" placeholder="현재 비밀번호">
		</td>
	</tr>
	<tr>
<!-- 		<td id="title">아</td> -->
		<td id="memo"><input type="password" class="form-control" placeholder="변경될 비밀번호" name="pass1"></td>
	</tr>
	<tr>
<!-- 		<td id="title">아</td> -->
		<td id="memo"><input type="password" class="form-control" placeholder="변경될 비밀번호 확인" name="pass2" ></td>
	</tr>
	<tr>
		<td colspan="2" id="btn"><input type="submit" class="btn btn-primary" value="확인" id="bt">
				<a href="/"><button type="button" class="btn btn-white"  id="bt">취소</button></a> 
		</td>
	</tr>
	</form>
</div>
	
	</table>