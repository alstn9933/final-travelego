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
 			<form id="idsearchFrm" action="/idsearch.do">
 				<h2>아이디 찾기</h2>
 					이름  <input type="text"  class="form-control" id="memberId" name="memberName" placeholder="회원님의 성함을 입력해주세요."><br>
 					이메일 <input type="text" class="form-control" id="emailId" name="email" placeholder="회원님의 이메일을 입력해주세요."><br>
 					<div class="btnBox">
 					<input type="submit" id="idsearchBtn" class="btn btn-primary" value="아이디 찾기">
 					</div>
 			</form>
 			</div>
 			<hr>
 			<div class="pwSearch">
 				<form action="/passwordchange.do">
 					<h2>비밀번호 재설정</h2>
 					<span>회원분들의 비밀번호를 안전하게 보호하기 위해 비밀번호를 재서 절 하실 수 있도록 도와드리고 있습니다.<br>
 					아이디와 이메일을 적으신 후 이메일 발송 시 비밀번호를 재설정할 수 있는 페이지를 보내고 있습니다.
	 					</span><br>
 					아이디  <input type="text"  class="form-control" name="memberId" placeholder="회원님의 아이디을 입력해주세요."><br>
 					이메일 <input type="text" class="form-control" name="emailPw" placeholder="회원님의 이메일을 입력해주세요."><br>
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
var idArr =[false , false];
	$("#memberId").focusout(function(){
		if($("#memberId").val() == ""){
			alert("아이디를 기입해주세요.");
			idArr[0]=false;
		}else{
			idArr[0]=true;
			cnt1++;
		}
	});
	$("#emailId").focusout(function(){
		if($("#emailId").val() == ""){
			alert("이메일을 기입해주세오.");
			idArr[1]=false;
		}else{	
			idArr[1]=true;
			cnt1++;
		}
	});
$("#idsearchFrm").submit(function(){
		if(cnt1<=1){
			alert("정보가 기입되지 않았습니다.");
			return false;
		}else{
			return true;
		}
	});
</script>
</html>