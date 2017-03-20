<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


	<style>
	table{

	
	
	}
	
	#title{
		width: 150px;
		height: 60px;
		background-color: #B0C4DE;
		font-size: 12px;
		text-align: center;
	}
	#memo{
		width: 400px; //490
		height: 60px;
		padding-left: 2%;

	}
	#memo1{
		width: 410px; //490
		height: 60px;
		padding-left: 1%;
	}
	#btn{
		text-align: center;
		width: 100%;
		height: 100px;
	
	}
	#Isbt{
		width: 260px;
		height: 60px;
	
	}
	#btc{
		width: 260px;
		height: 60px;
		background-color: #e7e7e7; color: black;
	}
		
	</style>

	<div style="padding-left:26%; padding-top:6%; padding-bottom:6%; padding-right: 26%;" >   <!-- "padding-left:30%; padding-top:6%; padding-bottom:6%" -->
	<div class="well" style="background-color: white;">
	<h4 style="font-family: 나눔고딕; font-style: bold">
<!-- 	<img alt="발품로고" src="/images/logo.png" width="70px" height="20px" /> -->
	&nbsp;회원 정보 수정</h4>
	<form action="/infochange" method="post" enctype="multipart/form-data">
	<br/>
	<table style="table-layout:fixed;  word-break:break-all; border: 2px solid #5ABEF5; "> 
	<tr>
		<td id="title">본인 성명2</td>
		<td id="memo"><input type="text" class="form-control" value="${id }" name="id"></td>
		<td id="memo1" rowspan="6"><img alt="프로필사진" src=" ${info.UIMG }" style="width: 80%; height : 200px; margin: 0; padding: 0; padding-left: 15%"  id="uimg" >
			<input type="file" name="file" id="file" style="display: none;" /> 
		</td>
	</tr>
	<tr>
		<td id="title">이메일 주소</td>
		<td id="memo">${info.EMAIL }</td>
	
	</tr>
	<tr>
		<td id="title">휴대폰 번호</td>
		<td id="memo" >
		<select class="form-control" style="float: left; width: 94px" name="telenum1" >
				<option value="${tele1 }">${tele1 }</option>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
		</select>
		<input class="form-control"  value="${tele2 }" name="telenum2" type="text" style="width: 94px; float: left;" >
		 <input class="form-control" value="${tele3 }"name="telenum3" type="text" style="width: 94px; float: left; ">
		</td>
	
	</tr>
	<tr>
		<td id="title" rowspan="3">비밀번호 변경</td>
		<td id="memo"><label><span id="PpassResult" > </span></label>
			<input type="password" class="form-control" placeholder="현재 비밀번호"  id="Pass" >
		</td>
		
	</tr>
	<tr>
		<td id="memo"><label><span id="passResult"> </span></label><input type="password" class="form-control" placeholder="변경될 비밀번호" name="password" id="PASS1"></td>
		
	</tr>
	
	<tr>
<!-- 		<td id="title">아</td> -->
		<td id="memo"><label><span></span></label><input type="password" class="form-control" placeholder="변경될 비밀번호 확인"  id="RPASS1"  onkeyup="javascript:IPassCompare()" ></td>
		
	</tr>
	<tr>
		<td colspan="3" id="btn"><input type="submit" class="btn btn-primary" value="확인" id="Isbt" disabled >
				<a href="/"><button type="button" class="btn"  id="btc" style="background-color: ;">취소</button></a> 
				
		</td>
		
	</tr>
</table>
</form>
</div>
</div>
	
<script>

	$("#uimg").click(function(){
			$("#file").trigger("click")
	})
	
// 	$(function(){ 
//   		 $('#file').change(function(){ 
//       			$('#uimg').attr('src', this.value); 
//   		 }); 
// 	}); 
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#uimg').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#file").change(function(){
	    readURL(this);
	});




	document.getElementById("Pass").onkeyup = function() {
		var xhr = new XMLHttpRequest();
		// this .. 이 스크립트를 호출시킨 DOM 객체
		// document.getElementById("id") 
		xhr.open("get", "/passcheckAjax?Pass="+this.value, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if(xhr.readyState==4 && xhr.status==200) {
				var txt = xhr.responseText;
				console.log(txt);
				if(txt == 'YYYYY') {
					document.getElementById("PpassResult").innerHTML = "비밀번호가 일치합니다";
					document.getElementById("PpassResult").style.color= "green";
					Flag1=true;
				}else {
					document.getElementById("PpassResult").innerHTML = "비밀번호가 일치하지않습니다";
					document.getElementById("PpassResult").style.color="red";
				}
			}
			sbtChange();
		};
	};
	
	
	
	function IPassCompare( ) {
		var p1 = document.getElementById("PASS1").value;
		var p2 = document.getElementById("RPASS1").value;
		console.log(p1)
		console.log(p2)
		var Flag = document.getElementById("PASS1").value == document.getElementById("RPASS1").value;
		console.log(Flag)
		if(Flag) {
			Flag2 =true;
			document.getElementById("passResult").innerHTML = "비밀번호가 일치합니다.";
			document.getElementById("passResult").style.color = "green";
		}else {
			Flag2 =false;
			document.getElementById("passResult").style.color = "red";
			document.getElementById("passResult").innerHTML = "비밀번호가 일치하지 않습니다.";
		}
		sbtChange();
	}
	
	
	var Flag1 =false, Flag2 =false;
	function sbtChange() {
		if(Flag1 && Flag2 ) {
			document.getElementById("Isbt").disabled = false;
		}else {
			document.getElementById("Isbt").disabled = true;
		}
	}
	// string .. length 라는 property 가 존재함.. 문자열 길이.
	

 	</script>