<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/lib/w3.css">
<body>

<div class="w3-container">
  
  <button onclick="document.getElementById('id01').style.display='block'" class="w3-button">Open Modal</button>

  <div id="id01" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-closebtn">&times;</span>
        <h2>Modal Header</h2>
      </header>
      <div class="w3-container">
        <p>Some text..</p>
        <p>Some text..</p>
      </div>
      <footer class="w3-container w3-teal">
        <p>Modal Footer</p>
      </footer>
    </div>
  </div>
</div>
            
</body>
</html>
