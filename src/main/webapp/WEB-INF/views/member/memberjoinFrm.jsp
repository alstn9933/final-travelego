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
<!-- 아이콘 키값 -->
 <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
		<div class="joincontent">
		<div class="textdiv">
		<form action="/memberjoin.do" method="post">
			<label id="lId" for="memberId" class="col-lg-2 control-label">아이디</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" name="memberId" id="memberId"
					data-rule-required="true" placeholder="생성할 아이디를 입력해주세요"><button type="button" class="btn btn-primary" id="idchk" name="idchk">중복확인</button><br>
					<span id="sId"></span>
			</div><br>
			<label for="memberPw" class="col-lg-2 control-label">패스워드</label>
			<div class="col-lg-6">
				<input type="password" class="form-control" id="memberPw"
					name="memberPw" data-rule-required="true" placeholder="패스워드"><br>
					<span id="sPw"></span>
			</div><br>
			<label for="memberPwRe" class="col-lg-2 control-label">패스워드
				확인</label>
			<div class="col-lg-6">
				<input type="password" class="form-control" id="memberPwRe"
					placeholder="패스워드 확인"><br>
					<span id="sRePw"></span>
			</div><br>
			<label for="memberName" class="col-lg-2 control-label">이름</label>
			<div class="col-lg-6	">
				<input type="text" class="form-control onlyHangul" id="memberName"
					name="memberName" placeholder="한글만 입력 가능합니다."><br>
					<span id="sName"></span>
			</div><br>
			<label id="lNickname" for="memberNickname" class="col-lg-2 control-label">닉네임</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" id="memberNickname"
					name="memberNickname" placeholder="닉네임"><input type="button" class="btn btn-primary" id="Nicknamechk" name="Nicknamechk" value="닉네임확인 "><br>
					<span id="sNickname"></span>
			</div><br>
			<label for="age" class="col-lg-2 control-label">나이</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" id="age"
					name="age" placeholder="나이">
			</div><br>
			<label for="email" class="col-lg-2 control-label">이메일</label>
			<div class="col-lg-5">
				<input type="email" class="form-control" id="email" name="email" placeholder="이메일">
				<button type="button" id="emailBtn" name="emailBtn" class="btn btn-primary">이메일 인증</button><br>
			</div><br>
			<label for="emailCode" class="col-lg-2 control-label" ">이메일 인증코드</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" id="emailCode" name = "emailCode" placeholder="인증코드를 입력하세요."><button type="button" id="emailCodeBtn" name="emailCodeBtn" class="btn btn-primary" >인증코드 확인</button><br>
					<span id="mailMsg"></span>
			</div><br><br>
			<label for="phone" class="col-lg-2 control-label">휴대폰
				번호</label>
			<div class="col-lg-6">
				<input type="tel" class="form-control onlyNumber" id="phone"
					name="phone" placeholder="-를 제외하고 숫자만 입력하세요."><br>
					<span id="sPhone"></span>
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
var mailCode="";
var regExp = "";

$("#memberId").focusout(function(){
	regExp=/^[a-zA-Z0-9]{5,15}/;
	if($("#memberId").val() == ""){
		$("#sId").html("아이디를 입력해주세요.");
		$("#sId").css("color","red");
		return false;
	}
	if(regExp.test($("#memberId").val())){
		$("#sId").html("생성 가능한 아이디입니다.<br>중복확인 을 진행해주세요.");
		$("#sId").css("color","green");
		
	}else{
		$("#sId").html("아이디 생성규격을 맞춰주세요<br>(대문자,소문자로 시작히여 15글자 이내)");
		$("#sId").css("color","red");
		return false;
	}
});
//아이디 중복확인
$("#idchk").click(function(){
	var memberId = $("#memberId").val();
	$.ajax({
		url : "/chkId.do",
		type : "post",
		data :{memberId:memberId},
		success : function(data){
			if(data == '0'){
				alert("생성 가능한 아이디입니다.");
				$("#lId").css("color","green");
			}else{
				alert("중복된 아이디 입니다. 다른 아이디를 이용해주세요.");	
				$("#memberId").focus();
				$("#lId").css("color","red");
				return false;
			}
		},
		error : function(){
			console.log("아이디 중복체크 실페");
		}
	});
});
$("#memberPw").focusout(function(){
	regExp=/^[a-zA-Z][0-9]{4,15}/;
	if($("#memberPw").val() == ""){
		$("#sPw").html("비밀번호를 입력해주세요.");
		$("#sPw").css("color","red");
		return false;
	}
	if(regExp.test($("#memberPw").val())){
		$("#sPw").html("생성 가능한 비밀번호 입니다.");
		$("#sPw").css("color","green");
		
	}else{
		$("#sPw").html("비밀번호 규격을 맞춰주세요<br>(대문자,소문자를 시작으로  숫자포함  15글자 이내)");
		$("#sPw").css("color","red");
		$("#memberPw").focus();
		return false;
	}
	
});
$("#memberPwRe").focusout(function(){
	if($("#memberPwRe").val() == ""){
		$("#sPw").html("비밀번호를 입력해주세요.");
		$("#sPw").css("color","red");
		return false;
	}
	if($("#memberPw").val()==$("#memberPwRe").val()){
		$("#sRePw").html("비밀번호가 일치합니다.");
		$("#sRePw").css("color","green");
	}else{
		$("#memberPwRe").focus();
		$("#sRePw").html("비밀번호가 일치하지 않습니다.");
		$("#sRePw").css("color","red");	
		return false;
	}
});
$("#memberName").focusout(function(){
	regExp = /^[가-힣]{2,5}$/;
	if(regExp.test($("#memberName").val())){
	}else{
		$("#sName").focus();
		$("#sName").html("이름규격에 맞춰주세요.<br>(한글 2글자 이상,5글자 이하)");
		$("#sName").css("color","red");	
		return false;
	}
});
$("#memberNickname").focusout(function(){
	regExp =/^[a-zA-Z가-힣]{2,8}[0-9]{4}/;
	if(regExp.test($("#membeNickname").val())){
		$("#sNickname").html("생성가능한 닉네임입니다.<br>중복확인을 진행해주세요.");
		$("#sNickname").css("color","green");
	}else{
		$("#sNickname").html("생성불가능한 닉네임입니다.<br>닉네임을 다시 확인해주세요.");
		$("#sNickname").css("color","red");
		return false;
	}
});
$("#Nicknamechk").click(function(){
	var memberNickname = $("#memberNickname").val();
	$.ajax({
		url : "/chkNickname.do",
		type : "post",
		data :{memberNickname:memberNickname},
		success : function(data){
			if(data == '0'){
				alert("생성 가능한 닉네임입니다.");
				$("#lNickname").css("color","green");
			}else{
				alert("중복된 닉네임 입니다. 다른 닉네임를 이용해주세요.");	
				$("#memberId").focus();
				$("#lNickname").css("color","red");
				return false;
			}
		},
		error : function(){
			console.log("아이디 중복체크 실페");
		}
	});
});
$("#phone").focusout(function(){
	regExp =/^[0-9]{11}$/;
	if(regExp.test($("#hone").val())){
	}else{
		$("#sPhone").focus();
		$("#sPhone").html("핸드폰번호는 - 없이 11자리까지 가능합니다.");
		$("#sPhone").css("color","red");	
		return false;
	}
});
//자바로 메일 보내기
$("#emailBtn").click(function(){	
	var email = $("#email").val();
	$.ajax({
		url : "/sendMail.do",
		type : "post",
		data : {email:email},
		success :function(data){
			mailCode=data;
			alert("이메일을 송신했습니다.");
		},
		error : function(){
			console.log("이메일발송에러");
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
		$("#emailCode").focus();
		return false;
	}
});

</script>
</html>