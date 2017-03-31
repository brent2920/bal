<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<style type="text/css">
.container-fluid {
   font-size: 15px;
}
</style>
<c:if test="${param.msg1 ne null }">
   <script>
      window.alert("이메일이나 패스워드가 잘못되었습니다.");
   </script>
</c:if>

<c:if test="${param.dmsg ne null }">
   <script>
      window.alert("${param.dmsg}");
   </script>
</c:if>

<c:if test="${msg ne null }">
   <script>
      window.alert("${msg }");
   </script>
</c:if>

<c:if test="${addroom ne null }">
   <script>
      window.alert("${addroom }");
   </script>
</c:if>
<c:if test="${dmsg ne null }">
   <script>
      window.alert("${dmsg }");
   </script>
</c:if>

<c:if test="${passerror ne null }">
   <script>
      window.alert("${passerror }");
   </script>
</c:if>


<nav class="navbar navbar-inverse"
   style="border-radius: 0px; margin-bottom: 0px;">
   <div class="container-fluid">
      <c:choose>
         <c:when test="${sessionScope.id == null && sessionScope.id1 ==null}">
            <div class="navbar-header" style="padding: 0px;">
               <a class="navbar-brand" href="/" style="padding-top: 8px;"> <img alt="발품로고"
                  src="/images/logo.png" width="83px" height="32px" />
               </a>
            </div>
            <ul class="nav navbar-nav">
               <li class="active"><a href="search">방 검색</a></li>
               <li><a href="#" class="nulladd">찜목록</a></li> 
               <li><a href="/recent">최근본방</a></li>
               <li><a href="#" id="nulladd" class="nulladd">방 등록</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
            
            
               <li class="dropdown"><a class="dropdown-toggle"
                  data-toggle="dropdown" href="#"> <span
                     class="glyphicon glyphicon-user"></span> 회원가입
               </a>
                  <ul class="dropdown-menu">
                     <li><a href="#"><span data-toggle="modal"
                           data-target="#myJoin">개인 회원가입</span> </a></li>
                     <li><a href="/broker_join">공인중개사 회원가입</a></li>
                  </ul></li>
                  
               
               <li class="dropdown"><a href="#" id="login" class="dropdown-toggle"
                  data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>로그인
               </a>

                  <ul class="dropdown-menu">
                     <li><a href="#"><span data-toggle="modal"
                           data-target="#myLogin">개인 로그인</span> </a></li>
                           
                     <li><a href="#"><span data-toggle="modal"
                           data-target="#brokerLogin">공인중개사 로그인</span></a></li>
                  </ul>
               </li>
            </ul>
         </c:when>


         <c:otherwise>
            <c:choose>
               <c:when test="${sessionScope.id != null }">
                  <div class="navbar-header" style="padding: 0px;">
                     <a class="navbar-brand" href="/" style="padding-top: 8px;">  <img alt="발품로고"
                        src="/images/logo.png" width="83px" height="32px" />
                     </a>
                  </div>
                  <ul class="nav navbar-nav">
                     <li class="active"><a href="search">방 검색</a></li>
                     <li><a href="/zzimlist">찜목록</a></li>
                     <li><a href="/recent">최근본방</a></li>
                     <li><a href="roomadd">방 등록</a></li>
                  </ul>

                  <ul class="nav navbar-nav navbar-right">
                     <li class="dropdown"><a class="dropdown-toggle"
                        data-toggle="dropdown" href="#"> <span
                           class="glyphicon glyphicon-user"></span> ${sessionScope.id }
                     </a>
                        <ul class="dropdown-menu">
                           <li><a href="/t_info"><span data-toggle="modal"
                                 data-target="#myInfo">내정보수정</span></a>
                                 </li>
                           <li><a href="/mypage"><span data-toggle="modal"
                                 >등록매물관리</span></a></li>
                                     <!-- ========================== 쪽지================= -->
                                  <li><a href="#"><span data-toggle="modal"
                           data-target="#mymsg" id="mymsgb">메세지보관함</span> </a></li>
                                     <!-- ========================== 쪽지================= -->
                           <li><a href="#"><span data-toggle="modal"
                           data-target="#myDelete">회원탈퇴</span> </a></li>
                        </ul></li>
                     <li><a href="/logout"> <span
                           class="glyphicon glyphicon-user" data-toggle="modal"
                           data-target="">로그아웃</span>
                     </a></li>
                  </ul>
               </c:when>

                  <c:when test="${sessionScope.id1 != null}">
                     <div class="navbar-header" style="padding: 0px;">
                        <a class="navbar-brand" href="/" style="padding-top: 8px;">  <img alt="발품로고"
                           src="/images/logo.png" width="83px" height="32px" />
                        </a>
                  </div>
                  <ul class="nav navbar-nav">
                     <li class="active"><a href="search">방 검색</a></li>
                     <li><a href="/zzimlist">찜목록</a></li>
                     <li><a href="/recent">최근본방</a></li>
                     <li><a href="roomadd">방 등록</a></li>
                  </ul>

                  <ul class="nav navbar-nav navbar-right">
                     <li class="dropdown"><a class="dropdown-toggle"
                        data-toggle="dropdown" href="#"> <span
                           class="glyphicon glyphicon-user"></span> ${sessionScope.id1 }
                     </a>
                        <ul class="dropdown-menu">
                           <li><a href="/brokerchange"><span data-toggle="modal"
                                 data-target="#myInfo">내정보수정</span></a></li>
                           <li><a href="/brokerPage"><span data-toggle="modal"
                                 data-target="#myInfo">등록매물관리</span></a></li>
                           <li><a href="#"><span data-toggle="modal"
                           data-target="#myDelete1">회원탈퇴</span> </a></li>
                        </ul></li>
                     <li><a href="/logout"> <span
                           class="glyphicon glyphicon-user" data-toggle="modal"
                           data-target="">로그아웃</span>
                           </a>
                           </li>
                           </ul>
                  
                  
                  </c:when>
               <c:otherwise>
                  
               </c:otherwise>
            </c:choose>
         </c:otherwise>
      </c:choose>

      <!-- 로그인 전 후 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ (session 부여) -->




      <div class="modal fade" id="myLogin" role="dialog">
         <form action="/login" method="post">
            <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">개인 로그인</h4>
                  </div>
                  <div class="modal-body">

                     <div class="form-group">
                        <label for="inputdefault">이메일</label> <input
                           class="form-control" id="inputdefault" type="text"
                           name="Eemail">
                     </div>

                     <div class="form-group">
                        <label for="inputdefault">비밀번호</label> <input
                           class="form-control" id="inputdefault" type="password"
                           name="password">
                     </div>
                     <button type="submit" class="btn btn-success"
                        style="background-color: #04B486;">로그인</button>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close</button>
                  </div>
               </div>
            </div>
         </form>
      </div>
      
      
      
       
         <!-- ========================= 쪽지 ========================= -->
       <div class="modal fade" id="mymsg" role="dialog">
         <form action="" method="post">
            <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">메세지보관함</h4>
                  </div>
                  <div class="modal-body">
			<c:choose>
				<c:when test="${msglist.size() eq 0}">
				 	<span>등록된 메세지가 없습니다</span>
			</c:when>
			<c:otherwise>
	
                 <div class="table1" style="margin-top: 30px; height: 30%; overflow-x:hidden; overflow-y:auto; " >
	 	<c:forEach items="${msglist  }" var="i" >
	 		<div class="row">
		 		<div class="col-sm-10">
		 			<img alt="${i.ID}" src="/images/cmtIcon.png" width="18px;" height="18px;">
		 			<b style="font-size: 15px; font-family: 나눔고딕;"> ${i.ID}(${i.EMAIL })</b><br/>
		 			<div style="font-size: 14px; font-family: 나눔고딕; margin-top: 10px;">
		 				${i.MASSAGE }
		 			</div>
		 			<div style="font-size: 12px; font-family: 나눔고딕; color: gray; margin-top: 10px;">
		 				보낸 날짜 : <fmt:formatDate value="${i.MSYSDATE }" pattern="yyyy/MM/dd hh:mm"/>
		 			</div>
		 		</div>
		 		<div class="col-sm-2">
		 		<button class="btn msgsend" type="button" style="background-color: white;" value="${i.EMAIL }" id="sendemail">
		 				<span class="glyphicon glyphicon glyphicon-envelope" data-toggle="modal" data-target="#msgsend"></span>
		 			</button>
		 			<button class="btn msgdel" type="button" style="background-color: white;" value="${i.MSG_SEQ }" >
		 				<span class="glyphicon glyphicon-remove-circle"></span>
		 			</button>
		 		</div>
		 	</div>
		 
		 	<hr style="margin-top: 20px; margin-bottom: 20px;"/>
	 	</c:forEach>
	 </div>
			</c:otherwise>
            </c:choose>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close</button>
                  </div>
               </div>
            </div>
            </div>
         </form>
      </div>
      
      
      <!-- 쪽지 답변 하기 -->
      <div class="modal fade" id="msgsend" role="dialog">
         <form action="/login" method="post">
            <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">답장하기</h4>
                  </div>
                  <div class="modal-body">

               

                     <div class="form-group">
                        <label for="inputdefault">메세지를 입력해주세요</label> <input
                           class="form-control" id="msgsendmsg" type="text"
                           name="msgsendmsg">
                     </div>
                     <button type="button" class="btn btn-success"
                        style="background-color: #04B486;" id="msgsendgo">답장</button>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close</button>
                  </div>
               </div>
            </div>
         </form>
      </div>
      
      
      <!-- 공인중개사 로그인 -->
   
      <div class="modal fade" id="brokerLogin" role="dialog">
         <form action="/brokerlogin" method="post">
            <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">공인 중개사 로그인</h4>
                  </div>
                  <div class="modal-body">

                     <div class="form-group">
                        <label for="inputdefault">이메일</label> <input
                           class="form-control" id="inputdefault" type="text"
                           name="brokerid">
                     </div>

                     <div class="form-group">
                        <label for="inputdefault">비밀번호</label> <input
                           class="form-control" id="inputdefault" type="password"
                           name="password">
                     </div>
                     <button type="submit" class="btn btn-success"
                        style="background-color: #04B486;">로그인</button>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close</button>
                  </div>
               </div>
            </div>
         </form>
      </div>
      
      
      
      <c:choose>
      <c:when test="${id ne null }">
      
      
      <!-- 회원 탈퇴! -->
      <div class="modal fade" id="myDelete" role="dialog">
         <form action="/mydelete" method="post">
            <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">개인 회원탈퇴</h4>
                  </div>
                  <div class="modal-body">

                     <div class="form-group">
                        <label for="inputdefault">비밀번호 입력</label>&nbsp;&nbsp;
                        <input
                           class="form-control" id="delpass1" type="password"
                           name="delpass">
                     </div>

                     <div class="form-group">
                        <label for="inputdefault">비밀번호 재입력</label>&nbsp;&nbsp;
                        <input class="form-control" id="delpass2" 
                           type="password" onkeyup="javascript:DelpassCompare()">
                           <label>
                           <span id="cmpResult2"></span></label>
                     </div>
                     <button type="button" class="btn btn-success"
                        style="background-color: #04B486;" id="Dsbt" disabled onclick="javascript:Del()" >회원탈퇴</button>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close</button>
                  </div>
               </div>
            </div>
         </form>
      </div>
      
      </c:when>
      
      <c:otherwise>
      
         <!-- 공인 중개사 회원 탈퇴! -->
      <div class="modal fade" id="myDelete1" role="dialog">
         <form action="/brokerdelete" method="post">
            <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">공인 중개사 회원탈퇴</h4>
                  </div>
                  <div class="modal-body">

                     <div class="form-group">
                        <label for="inputdefault">비밀번호 입력&nbsp;&nbsp;</label>
                        <b id="rst"></b>
                        <input
                           class="form-control" id="delpass3" type="password"
                           name="delpass">
                     </div>

                    <div class="form-group">
                        <label for="inputdefault">비밀번호 재입력</label>&nbsp;&nbsp;
                        <input class="form-control" id="delpass4" 
                           type="password" onkeyup="javascript:DelpassCompare1()">
                           <label>
                           <span id="cmpResult1"></span></label>
                     </div>
                     <button type="submit" class="btn btn-success"
                        style="background-color: #04B486;" id="delbnt"  disabled>회원탈퇴</button>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default"
                        data-dismiss="modal" >Close</button>
                  </div>
               </div>
            </div>
         </form>
      </div>
      
</c:otherwise>
</c:choose>
      <!-- 회원가입 -->

      <div class="modal fade" id="myJoin" role="dialog">
         <form action="/join" method="post">
            <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">개인 회원가입</h4>
                  </div>
                  <div class="modal-body">

                     <div class="form-group">
                        <label for="inputdefault">이름</label><input class="form-control"
                           name="id" type="text" id="id">
                     </div>

                     <div class="form-group">
                        <label for="inputdefault">이메일<span id="EchkResult"></span></label>
                        <input class="form-control" name="Eemail" type="email"
                           id="Eemail">
                     </div>
                     <div class="form-group">
                        <label for="inputdefault">비밀번호&nbsp;&nbsp;
                        </label> <input
                           class="form-control" name="password" type="password" id="pass">
                     </div>
                     <div class="form-group">
                        <label for="inputdefault">비밀번호 확인&nbsp;&nbsp;
                        <span id="cmpResult"></span>
                        </label> <input class="form-control" type="password" id="rpass"
                           onkeyup="javascript:passCompare()">
                     </div>

                     <div class="form-group">
                        <label for="inputdefault">전화번호</label><br /> <select
                           class="form-control" style="float: left; width: 100px"
                           name="telenum1">
                           <option value="010">010</option>
                           <option value="011">011</option>
                           <option value="016">016</option>
                           <option value="017">017</option>
                           <option value="018">018</option>
                           <option value="019">019</option>
                        </select> <input class="form-control" name="telenum2" type="text"
                           style="width: 100px; float: left;"> <input
                           class="form-control" name="telenum3" type="text"
                           style="width: 100px; float: left;">
                     </div>
                     <br />
                  </div>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-success"
                        style="background-color: #04B486;" disabled id="sbt">가입</button>
                     <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close</button>
                  </div>
               </div>
            </div>
         </form>
      </div>


   </div>
</nav>
<script>
   $(".nulladd").click(function() {
      window.alert("로그인 후 사용가능합니다")
   })
</script>

<script>
   var flag1 = true, flag2 = false;
   function sbtChange() {
      if (flag1 && flag2) {
         document.getElementById("sbt").disabled = false;
      } else {
         document.getElementById("sbt").disabled = true;
      }
   }
   // string .. length 라는 property 가 존재함.. 문자열 길이.

   function passCompare() {

      var flag = document.getElementById("pass").value == document
            .getElementById("rpass").value;
      if (flag) {
         flag2 = true;
         document.getElementById("cmpResult").innerHTML = "<span class='glyphicon glyphicon-ok-sign'></span>비밀번호가 일치합니다.";
         document.getElementById("cmpResult").style.color = "green";
      } else {
         flag2 = false;
         document.getElementById("cmpResult").style.color = "red";
         document.getElementById("cmpResult").innerHTML = "<span class='glyphicon glyphicon-exclamation-sign'></span>비밀번호가 일치하지 않습니다.";
      }
      sbtChange();
   }
   
   
   
   
   // 회원 탈퇴시 비밀번호와 비밀번호 재입력 확인
   var flag3 = true, flag4 = false;
   function DsbtChange() {
      if (flag3 && flag4) {
         document.getElementById("Dsbt").disabled = false;
      } else {
         document.getElementById("Dsbt").disabled = true;
      }
   }

   function DelpassCompare() {

      var flag5 = document.getElementById("delpass1").value == document.getElementById("delpass2").value;
      if (flag5) {
         flag4 = true;
         document.getElementById("cmpResult2").innerHTML = "비밀번호가 일치합니다.";
         document.getElementById("cmpResult2").style.color = "green";
      } else {
         flag4 = false;
         document.getElementById("cmpResult2").style.color = "red";
         document.getElementById("cmpResult2").innerHTML = "비밀번호가 일치하지 않습니다.";
      }
      DsbtChange();
   }
   
   


   // 공인 중개사 회원 탈퇴
   
   var fla3 = true, fla4 = false;
   function DsbtChange1() {
      if (fla3 && fla4) {
         document.getElementById("delbnt").disabled = false;
      } else {
         document.getElementById("delbnt").disabled = true;
      }
   }
   function DelpassCompare1() {

      var fla5 = document.getElementById("delpass3").value == document.getElementById("delpass4").value;
      if (fla5) {
         fla4 = true;
         document.getElementById("cmpResult1").innerHTML = "비밀번호가 일치합니다.";
         document.getElementById("cmpResult1").style.color = "green";
      } else {
         fla4 = false;
         document.getElementById("cmpResult1").style.color = "red";
         document.getElementById("cmpResult1").innerHTML = "비밀번호가 일치하지 않습니다.";
      }
      DsbtChange1();
   }
   
     
   
   
 
	function Del() {
		var flag7 = $("#delpass1").val();
		var xhr2 = new XMLHttpRequest();
		xhr2.open("get", "/mydelete?delpass=" + flag7, true);
		xhr2.send();
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4 && xhr2.status == 200) {
				var txt2 = xhr2.responseText;
				console.log(txt2);
				if (txt2 == 'NN') {
					window.alert("패스워드를 잘못 입력하셨습니다");
				} else {
					window.alert("회원탈퇴가 정상적으로 처리 되었습니다");
					location.href = "/";
				}
			}
		}
	}

	// 이메일 중복 여부 확인

	document.getElementById("Eemail").onblur = function() {
		var xhr1 = new XMLHttpRequest();
		// this .. 이 스크립트를 호출시킨 DOM 객체
		// document.getElementById("id")
		xhr1.open("get", "/EmailcheckAjax?Eemail=" + this.value, true);
		xhr1.send();
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				var txt1 = xhr1.responseText;
				console.log(txt1);
				if (txt1 == 'YYYYY') {
					document.getElementById("EchkResult").innerHTML = "이미 등록되어 있는 이메일 주소 입니다";
					document.getElementById("EchkResult").style.color = "red";
				} else {
					document.getElementById("EchkResult").innerHTML = "사용 가능한 이메일 주소 입니다";
					document.getElementById("EchkResult").style.color = "green";
				}
			}
		};
	};

	// mouseenter, mouseleave 이벤트처리
	$(".dropdown").mouseenter(function() {
		$(this).children().eq(1).css({
			"display" : "block",
			"cursor" : "pointer"
		});
	});

	$(".dropdown").mouseleave(function() {
		console.log($(this).children().eq(1));
		$(this).children().eq(1).css({
			"display" : "none",
			"cursor" : "pointer"
		});
	});
</script>

<script>


//메시지 삭제
$(".msgdel").click(function(){
		var msg = new XMLHttpRequest();
		msg.open("get", "/massagedel?msgdell="+$(this).val(), true);
		msg.send();
		msg.onreadystatechange = function() {
			if (msg.readyState == 4 && msg.status == 200) {
				var msg2 = msg.responseText;
				console.log(msg2);
				if (msg2 == 'DMY') {
					window.alert("메세지가 삭제 되었습니다");
					location.reload();
				} else {
					window.alert("메세지 삭제중 오류가 발생하였습니다");
					location.reload();
				}
			}
		}
	})
	
	// 답장보내기
	 $("#msgsendgo").click(function(){
		 var send = $("#msgsendmsg").val();
		 var sendemail = $("#sendemail").val();
		var msgsend = new XMLHttpRequest();
		msgsend.open("get", "/msgsendmsg?msgsendmsg="+send+"&sendemail="+sendemail, true);
		msgsend.send();
		msgsend.onreadystatechange = function() {
			if (msgsend.readyState == 4 && msgsend.status == 200) {
				var msg2 = msgsend.responseText;
				console.log(msg2);
				if (msg2 == 'SDMY') {
					window.alert("답장이 정상적으로 처리되었습니다");
					location.reload();
				} else {
					window.alert("답장을 보내는 중 오류가 발생하였습니다");
					location.reload();
				}
			}
		}
	})
	
	
	//  $(function(){
//   $('#delpass3').keyup(function(){
//    $('span[id=rst]').text('');
//   }); //#user_pass.keyup

//   $('#delpass4').keyup(function(){
//    if($('#delpass3').val()!=$('#delpass4').val()){
//       $("#delbnt").prop("disabled",true);
//     $('b[id=rst]').text('');
//     $('b[id=rst]').html(" 비밀번호가 일치하지 않습니다.");
//     $('b[id=rst]').css("color","red");
//    }else{
//       $("#delbnt").prop("disabled",false);
//     $('b[id=rst]').text('');
//     $('b[id=rst]').html("비밀번호가 일치합니다.");
//     $('b[id=rst]').css("color","green");
//    }
//   }); //#chpass.keyup
//  });

</script>