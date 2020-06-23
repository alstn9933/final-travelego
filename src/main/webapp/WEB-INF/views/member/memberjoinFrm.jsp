<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<link rel="stylesheet" href="/src/css/member/memberjoin/memberjoin.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
		<div class="joincontent">
		<div class="textdiv">
		<form action="/memberjoin.do" method="post">
			<label for="memberId" class="col-lg-2 control-label">아이디</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" name="memberId" id="memberId"
					data-rule-required="true" placeholder="생성할 아이디를 입력해주세요">
			</div><br>
			<label for="memberPw" class="col-lg-2 control-label">패스워드</label>
			<div class="col-lg-6">
				<input type="password" class="form-control" id="memberPw"
					name="memberPw" data-rule-required="true" placeholder="패스워드">
			</div><br>
			<label for="memberPwRe" class="col-lg-2 control-label">패스워드
				확인</label>
			<div class="col-lg-6">
				<input type="password" class="form-control" id="memberPwRe"
					placeholder="패스워드 확인">
			</div><br>
			<label for="memberName" class="col-lg-2 control-label">이름</label>
			<div class="col-lg-6	">
				<input type="text" class="form-control onlyHangul" id="memberName"
					name="memberName" placeholder="한글만 입력 가능합니다.">
			</div><br>
			<label for="memberNickname" class="col-lg-2 control-label">닉네임</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" id="memberNickname"
					name="memberNickname" placeholder="닉네임">
			</div><br>
			<label for="age" class="col-lg-2 control-label">나이</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" id="age"
					name="age" placeholder="나이">
			</div><br>
			<label for="email" class="col-lg-2 control-label">이메일</label>
			<div class="col-lg-6">
				<input type="email" class="form-control" id="email" name="email" placeholder="이메일">
				<button type="button" id="emailBtn" name="emailBtn" class="btn btn-primary">이메일 인증</button><br>
			</div><br>
			<label for="emailCode" class="col-lg-2 control-label" ">이메일 인증코드</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" id="emailCode" name = "emailCode" placeholder="인증코드를 입력하세요."><button type="button" id="emailCodeBtn" name="emailCodeBtn" class="btn btn-primary" >인증코드 확인</button><br>
					<span id="mailMsg"></span>
			</div><br>
			<label for="phone" class="col-lg-2 control-label">휴대폰
				번호</label>
			<div class="col-lg-6">
				<input type="tel" class="form-control onlyNumber" id="phone"
					name="phone" placeholder="-를 제외하고 숫자만 입력하세요.">
			</div><br>
			<label for="gender" class="col-lg-2 control-label">성별</label>
			<div class="col-lg-6">
				<select class="form-control" id="gender" name="gender">
					<option value="M">남</option>
					<option value="F">여</option>
				</select>
			</div><br>
			</div>
			<div class="divBtn" id="divBtn">
				<button type="submit" class="btn btn-primary">회원가입</button>
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
			</form>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script>
//자바로 메일 보내기
var mailCode="";
$("#emailBtn").click(function(){
	alert("이메일을 송신했습니다.");
	var email = $("#email").val();
	$.ajax({
		url : "/sendMail.do",
		type : "post",
		data : {email:email},
		success :function(data){
			mailCode=data;
			$("#emailCode").show();
			$("#emailCodeBtn").show();
		}
	})
});
$("#emailCodeBtn").click(function(){
	if($("#emailCode").val() == mailCode){
		$("#mailMsg").html('인증성공');
		$("#mailMsg").css('color','green');
	}else{
		$("#mailMsg").html('인증실패');
		$("#mailMsg").css('color','red');
		return false;
	}
})

</script>
</html>