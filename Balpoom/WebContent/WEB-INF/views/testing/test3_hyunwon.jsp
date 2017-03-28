<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<form action="/img" enctype="multipart/form-data">

	<table>
		<tr>
			<td id="memo7" style="padding: 0%; margin: 0%; text-align: center;">
				<c:forEach begin="1" end="15" var="i">
					<div style="float: left; width: 170px; height: 200px; margin: 5px;"
						align="left">
						<img alt="" src="" style="width: 170px; height: 150px; background-color: #EEEEEE;"
							id="img${i }"> 
							<input type="file" id="file${i }"style="display: none"
							name="file">
						<div align="center" style="padding-top: 10px;">
							<button type="button" id="bbt${i }" 
								class="btn btn-default" style="color: #646464;
								border-color: #646464">추가</button>
							<button type="button" id="cbt${i }" 
								class="btn btn-default"  style="color: #646464;
								border-color: #646464">취소</button>
						</div>
					</div>
				</c:forEach>
			</td>
		</tr>
	</table>
	<button type="submit">버튼</button>
	</form>
	<script>
	<c:forEach begin="1" end="15" var="i">
	$("#bbt${i}").click(function() {
		$("#file${i}").trigger("click");

	});
	$("#file${i}").change(function() {
		console.log(this);
		readURL(this);
	});

	$("#cbt${i}").click(function() {
		$("#img${i}").attr("src", "")

	})

	</c:forEach>

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(input).prev().attr("src", e.target.result); // prev 는 위에 있는.. next 는 아래에 있는..
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>