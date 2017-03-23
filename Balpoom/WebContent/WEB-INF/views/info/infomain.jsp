<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
}

tr {
	padding-top: 8px;
	padding-bottom: 8px;
}

h1 {
	font-weight: bolder;
}

#title {
	width: 150px;
	height: 60px;
	font-size: 15px;
	text-align: center;
}

#memo {
	width: 400px; //490
	height: 60px;
	padding-left: 2%;
}

#memo1 {
	width: 410px; //490
	height: 60px;
	padding-left: 1%;
}

#btn {
	text-align: center;
	height: 80px;
}

#Isbt {
	width: 150px;
	height: 40px;
	background-color: #04B486;
	color: white;
}

#btc {
	width: 150px;
	height: 40px;
	background-color: #e7e7e7;
	color: black;
}

#id, #PASS, #PASS1, #RPASS1 {
	width: 350px;
}


</style>
<div align="center"
	style="padding-left: 26%; padding-top: 6%; padding-bottom: 6%; padding-right: 26%;">
	<div class="well">
		<h1>회원 정보 수정</h1>
		<form action="/infochange" method="post" enctype="multipart/form-data">
			<table style="word-break: break-all;">
				<tr>
					<th id="title">이름</th>
					<td id="memo">
						<input type="text" class="form-control" value="${id }" id="id" name="id">
					</td>
				</tr>
				<tr>
					<th id="title">이메일 주소</th>
					<td id="memo">${info.EEMAIL }</td>
				</tr>
				<tr>
					<th id="title">휴대폰 번호</th>
					<td id="memo">
						<select class="form-control" style="float: left; width: 94px" name="telenum1">
							<option value="${tele1 }">${tele1 }</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> 
						<input class="form-control" value="${tele2 }" name="telenum2"
							type="text" style="width: 94px; float: left;">
						<input class="form-control" value="${tele3 }" name="telenum3" 
							type="text" style="width: 94px; float: left;">
					</td>
				</tr>
				<tr>
					<th id="title" rowspan="3">비밀번호 변경</th>
					<td id="memo">
						<label>
							<span id="PpassResult"> </span>
						</label>
						<input type="password" class="form-control" 
							placeholder="현재 비밀번호" id="Pass">
					</td>
				</tr>
				<tr>
					<td id="memo">
						<label>
							<span id="passResult"> </span>
						</label>
						<input type="password" class="form-control"
							placeholder="변경할 비밀번호" name="password" id="PASS1">
					</td>
				</tr>
				<tr>
					<td id="memo">
						<label>
							<span></span>
						</label>
						<input type="password" class="form-control"
							placeholder="변경할 비밀번호 확인" id="RPASS1" 
							onkeyup="javascript:IPassCompare()">
					</td>
				</tr>
				<tr>
					<td colspan="2" id="btn">
						<input type="submit" class="btn" value="확인" id="Isbt" disabled>
						<a href="/">
							<button type="button" class="btn" id="btc">
								취소
							</button>
						</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<script>
	$("#uimg").click(function() {
		$("#file").trigger("click")
	})

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#uimg').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#file").change(function() {
		readURL(this);
	});

	document.getElementById("Pass").onkeyup = function() {
		var xhr = new XMLHttpRequest();
		// this .. 이 스크립트를 호출시킨 DOM 객체
		// document.getElementById("id") 
		xhr.open("get", "/passcheckAjax?Pass=" + this.value, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var txt = xhr.responseText;
				console.log(txt);
				if (txt == 'YYYYY') {
					document.getElementById("PpassResult").innerHTML = "비밀번호가 일치합니다";
					document.getElementById("PpassResult").style.color = "green";
					Flag1 = true;
				} else {
					document.getElementById("PpassResult").innerHTML = "비밀번호가 일치하지않습니다";
					document.getElementById("PpassResult").style.color = "red";
				}
			}
			sbtChange();
		};
	};

	function IPassCompare() {
		var p1 = document.getElementById("PASS1").value;
		var p2 = document.getElementById("RPASS1").value;
		console.log(p1)
		console.log(p2)
		var Flag = document.getElementById("PASS1").value == document
				.getElementById("RPASS1").value;
		console.log(Flag)
		if (Flag) {
			Flag2 = true;
			document.getElementById("passResult").innerHTML = "비밀번호가 일치합니다.";
			document.getElementById("passResult").style.color = "green";
		} else {
			Flag2 = false;
			document.getElementById("passResult").style.color = "red";
			document.getElementById("passResult").innerHTML = "비밀번호가 일치하지 않습니다.";
		}
		sbtChange();
	}

	var Flag1 = false, Flag2 = false;
	function sbtChange() {
		if (Flag1 && Flag2) {
			document.getElementById("Isbt").disabled = false;
		} else {
			document.getElementById("Isbt").disabled = true;
		}
	}
</script>