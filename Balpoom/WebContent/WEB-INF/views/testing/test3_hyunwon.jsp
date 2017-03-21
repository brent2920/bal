<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<div class="container">
  <button type="button" class="btn btn-primary" id="a1" >Primary Button</button>
</div>

<script>

	$("#a1").on("click",function(){
		if(!($(this).hasClass("active"))){
		 
		 $(this).addClass("active");
		 $(this).css("color","white");
		 
			
		}else{
			$(this).removeClass("active");
		$(this).css("color","black");
		
		}
	});
	
</script>