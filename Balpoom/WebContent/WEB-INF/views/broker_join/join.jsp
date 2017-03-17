<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원가입</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>중개사 회원가입</h2>
  <form action="/join/data">
    <div class="form-group">
      <label for="bk_officename">:</label>
      <input type="text" class="form-control" id="bk_officename"/>
    </div>


        <div class="form-group">
      <label for="id">아이디(Email):</label>
      <input type="email" class="form-control" id="id" placeholder="Enter email"/>
    </div>


    <div class="form-group">
      <label for="bk_password">비밀번호:</label>
      <input type="password" class="form-control" id="bk_password" placeholder="Enter password"/>
    </div>


    <div class="form-group">
      <label for="bk_password1">비밀번호 확인:</label>
      <input type="password" class="form-control" id="bk_password1" placeholder="Enter password"/>
    </div>


   <div class="form-group">
      <label for="bk_email">부동산 이메일:</label>
      <input type="text" class="form-control" id="bk_email" placeholder="Enter email"/>
    </div>


   <div class="form-group">
      <label for="bk_contact">부동산 연락처:</label>
      <input type="password" class="form-control" id="bk_contact"/>
    </div>
    
    
<div class="form-group">
  <label for="bk_contact">개인 연락처:</label>
  <input type="text" class="bk_contact-md-3" id="contact">-
  <input type="text" class="bk_contact-md-3" id="contact"/>-
  <input type="text" class="bk_contact-md-3" id="contact"/>
</div>


 <div class="form-group">
      <label for=bk_agentnum>부동산 연락처:</label>
      <input type="text" class="bk_contact-md-3" id="bk_agentnum"/>-
  <input type="text" class="bk_contact-md-3" id="bk_agentnum"/>-
  <input type="text" class="bk_contact-md-3" id="bk_agentnum"/>
    </div>
    
    <!-- API로 바꾸기 -->
    <div class="form-group">
      <label for="bk_address">부동산 주소:</label>
      <input type="text" class="form-control" id="bk_address"/>
    </div>
    
    
      <div class="form-group">
      <label for="bk_num">:</label>
      <input type="text" class="form-control" id="bk_num"/>
    </div>
   
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>

</body>
</html>

   