<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.input {
	font-family: '나눔고딕';
	font-size: 10pt;
}

.main_search_area {
    position: relative;
    top: 82.3%;
    background-color: rgba(0,0,0,.5);
    padding-bottom: 16px;
    padding-top: 30px;
}
</style>

<div class="main_visual" style="width: 100%; height: 80%; overflow: hidden;
	background-image: url(&quot;images/mainImg.jpg&quot;)">
	<div class="main_search_area" style="margin: auto;" align="center">
		<form action="/search">
			<div class="input-group" style="width: 45%;">
				<input type="text" id="keyword" name="keyword" class="form-control" style="height: 55px; font-size: 18px; 
					border: 4px solid; border-color: #04B486;" placeholder="원하시는 지역명, 지하철역을 입력해주세요">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit" style="height: 55px; width: 120px; font-size: 18px; 
							border: 4px solid; border-color: #04B486; background-color: #04B486; color: white;" >
						<b>찾아보기</b>
					</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
// 나중에 자동완성기능 처리하기!
// 	var autoComplete = new google.maps.places.Autocomplete(
// 		$("#keyword"), {
// 		types: ['(regions)'];
// 	});
</script>