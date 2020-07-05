<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- Bootstrap script -->
 <script src="/src/js/jquery/jquery-3.5.1.js"></script>
 <script src="/src/js/bootstrap/popper.min.js"></script>
 <script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
 <link rel="stylesheet" href="/src/css/member/information/memberInformation.css" />
 <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
    <!-- CSS here -->
    <link rel="stylesheet" href="/src/css/header/header.css" />
    <link rel="stylesheet" href="/src/css/footer/footer.css" />
    <link rel="stylesheet" href="/src/css/main/web_default.css" />
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
 <section>
 	<div class="maincontent">
 		<div class="idSearch">
 			<form id="idsearch" action="/idsearch.do" method="post">
 				<h2>아이디 찾기</h2>
 					이름  <input type="text"  class="form-control" id="memberName" name="memberName" placeholder="회원님의 성함을 입력해주세요."><br>
 					<span id="sName"></span><br>
 					이메일 <input type="text" class="form-control" id="emailId" name="email" placeholder="회원님의 이메일을 입력해주세요."><br>
 					<span id="sEmail"></span>
 					<div class="btnBox">
 					<input type="submit" id="idsearchBtn" class="btn btn-primary" value="아이디 찾기">
 					</div>
 			</form>
 			</div>
 			<hr>
 			<div class="pwSearch">
 				<form action="/passwordchange.do" method="post" id="Pwmodify">
 					<h2>비밀번호 재설정</h2>
 					<span>회원분들의 비밀번호를 안전하게 보호하기 위해 비밀번호를 재서 절 하실 수 있도록 도와드리고 있습니다.<br>
 					아이디와 이메일을 적으신 후 이메일 발송 시 비밀번호를 재설정할 수 있는 페이지를 보내고 있습니다.</span><br><br>
 					아이디  <input type="text"  class="form-control"  id="memberId" name="memberId" placeholder="회원님의 아이디을 입력해주세요."><br>
 					<span id="sId"></span><br>
 					이메일 <input type="text" class="form-control" id="emailPw" name="email" placeholder="회원님의 이메일을 입력해주세요."><br>
 					<span id="sEmailPw"></span>
 					<div class="btnBox">
 					<input type="submit" id="emailBtn" class="btn btn-primary" value="이메일 전송">
 					</div>
 				</form>
 			</div>
 		</div>	
 </section>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script >
var cnt1 =0;
var cnt2 =0;
var checkArr=[false,false];
$("#memberName").keyup(function() {
	regExp = /^[가-힣]{2,5}$/;
	if (regExp.test($("#memberName").val())) {
		$("#sName").html("");
		checkArr[0]=true;
	} else {
		$("#sName").html("이름규격에 맞춰주세요.<br>(한글 2글자 이상,5글자 이하)");
		$("#sName").css("color", "red");
		checkArr[0] = false;
	}
});
$("#emailId").keyup(function() {
	regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if ($("#emailId").val() == "") {
		checkArr[1] = false;
	} else {
		if (regExp.test($("#email").val())) {
			$("#lEmail").css("color", "green");
			$("#sEmail").html("");
			checkArr[1] = true;
		} else {
			$("#sEmail").html("정상적인 이메일이 아닙니다.");
			$("#sEmail").css("color", "red");
			checkArr[1] = false;

		}
	}
});
$("#idsearch").submit(function(){
		if(checkArr[0]==true && checkArr[1]=true){			
			return true;
		}else{
			alert("정보가 기입되지 않았습니다.");
			return false;
		}
	});
	
$("#memberId").keyup(function() {
	regExp = /^[a-zA-Z0-9]{5,15}/;
	if (regExp.test($("#memberId").val())) {
		$("#sId").html("");
		cnt2++;
	} else {
		$("#sId").html("이름규격에 맞춰주세요.<br>(한글 2글자 이상,5글자 이하)");
		$("#sId").css("color", "red");
		cnt2=0;
	}
});
$("#emailPw").keyup(function() {
	regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if ($("#emailPw").val() == "") {
		cnt2=0;
	} else {
		if (regExp.test($("#emailPw").val())) {
			$("#sEmailPw").html("");
			cnt2++;
		} else {
			$("#sEmailPw").html("정상적인 이메일이 아닙니다.");
			$("#sEmailPw").css("color", "red");
			cnt2=0;
		}
	}
});
$("#Pwmodify").submit(function(){
	if(cnt2<=1){
		alert("아이디 또는 이메일을 확인해주세요.");
		return false;
	}else{
		return true;
	}
});
</script>
</html>