<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <div class="well">
  		<span><h200>오피스텔 월세<h300> 1000/65만원</h300> <h200></span><br><br/>
  		<h400>안양역 byc 1.5룸 오피스텔 인기최고풀 옵션</h400><br><br>
  		<h500>경기도 안양시 만얀구 안양동 현대 아파트 504동 </h500>
  		<hr>
  		<button id="bt1" class="mybutton button1" style="color:black">❤</button>
		<button id="bt2" class="mybutton button1" >☎</button>
		
  </div>
  <hr/>
  <div class="well">
  		
  		<span><h201>희망공인 중개 사무소 <h201></span><br><br/>
  		
  		<h400>대표 이현원</h400><br/><br/>
  		<br/>
  		[담당지]<h400>경기도 안양시 안양로  344번길 18 </h400><br/>
  		
  		<h402>중개사와의 거래시 수수료가 발생하기 참조하세요</h402><br/><br/>
  	
  		<button class="mybutton button1">연락처 보기 </button>
  		
  </div>
  <script>
  

  document.getElementById('bt1').onclick = function() {
     
//       if(this.innerHTML.equals("❤")){
//     	 this.innerHTML ="hi";
//       }
		//if(this.style.cssText.equals(''))
		//if(this.get)
			console.log(this.style.color);
			if(this.style.color =="rgb(255, 0, 0)"){
				
				this.style.color ="rgb(0, 0, 0)";
			}else{
				this.style.color ="rgb(255, 0, 0)";
			}
		}
 </script>

    
 <style>
 
h100 {
    text-shadow: 3px 2px red;
}
h200 {
	padding: 3px;
	background-color: #04B486;
	border-radius : 2px;
	color: white;
	word-spacing: 10px;
	font-size: 100%;


}
h201 {
	padding: 3px;
	background-color: #2FA273  ;
	border-radius : 2px;
	color: white;
	word-spacing: 10px;
	font-size: 100%;


}
h300 {
	padding: 3px;
	background-color: #04B486;
	border-radius : 2px;
	color: red;
	word-spacing: 10px;
	font-size: 100%;


}

h400{
	padding: 3px;
	border-radius : 2px;
	color: black;
	word-spacing: 3px;
	font-size: 100%;
	font-family: "Times New Roman";
}
h401{
	padding: 3px;
	border-radius : 2px;
	color: black;
	word-spacing: 3px;
	font-size: 100%;
	font-family: "Times New Roman";
	 font-weight: bold;

}
h402{
	padding: 3px;
	border-radius : 2px;
	color: black;
	word-spacing: 3px;
	font-size: 50%;
	font-family: "Times New Roman";
	 font-weight: bold;

}


h500{
	padding: 3px;
	border-radius : 2px;
	color:rgba(0,0,0,0.6);
	word-spacing: 3px;
	font-size: 100%;
	font-family: "Times New Roman";
	text-shadow: 2px 4px 3px rgba(0,0,0,0.3);
	

}

.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 10px 22px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    }
.buttonx {
    background-color: #E83B16  ; /* Red */
    border: none;
    color: white;
    padding: 10px 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    margin: 20px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    }
.button1 {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}

.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9));
	background:-moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9',GradientType=0);
	background-color:#f9f9f9;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
	background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
	background-color:#e9e9e9;
}
.myButton:active {
	position:relative;
	top:1px;
}




</style>