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
  <form>
    <div class="form-group">
      <label for="email">아이디(Email):</label>
      <input type="email" class="form-control" id="id" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호:</label>
      <input type="password" class="form-control" id="bk_password" placeholder="Enter password">
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 확인:</label>
      <input type="password" class="form-control" id="bk_password1" placeholder="Enter password">
    </div>
   <div class="form-group">
      <label for="pwd">부동산 이메일:</label>
      <input type="text" class="form-control" id="bk_email" placeholder="Enter password">
    </div>
   <div class="form-group">
      <label for="pwd">부동산 이메일:</label>
      <input type="password" class="form-control" id="bk_contact" placeholder="Enter password">
    </div>
   
   
   
   
   
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>

</body>
</html>
