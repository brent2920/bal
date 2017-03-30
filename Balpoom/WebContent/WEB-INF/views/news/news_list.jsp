<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="wrap-950 news-container">
	<div class="content">
		<h2>뉴스</h2>
		<ul>
			<div class="row">
				<c:forEach var="obj" items="${news }" varStatus="status">
					<div class="col-sm-10">
						<li><a href="${obj.URL }" target="_blank">"${obj.TITLE }"
								<span>"${obj.DATES }"</span>
						</a></li>
					</div>
					<div class="col-sm-2">
						<button class="btn commentdel" type="button"
							style="background-color: white;" value="${obj.URL }">
							<span class="glyphicon glyphicon-remove-circle"></span>
						</button>
					</div>

				</c:forEach>
			</div>

		</ul>
	</div>
</div>

</div>
<script>
	$(".commentdel").click(function() {
		//alert($(this).val());
		console.log("commendal");
		$.ajax({
				"url" : "/news_delete",
				"data" : {
					
					"url" : $(this).val()
				},
				"method" : "post"
			}).done(function(rst){
				if (rst == 'YYY') {
					window.alert("삭제 되었습니다");
					location.reload();
				} else {
					window.alert("삭제중 문제가 발생되었습니다");
				}
			});
		});
			
	
		
		

				
	
</script>


