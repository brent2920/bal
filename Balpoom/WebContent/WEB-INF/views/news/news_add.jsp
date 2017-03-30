<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
    
<div class="col-md-9">
	<form action="/freeboard/addnewcontent_02" method="post">
	<p>
		<b>뉴스 제목</b>
		
			<input type="text" class="form-control" name="title" value=""/>
	</p>
	<p>
		<b>url</b>
			<textarea rows="10" cols="60" name="content" class="form-control"></textarea>
	</p>
	
	<p>
			
		<button type="submit" class="btn">입력</button>
	</p>
</form>
</div>