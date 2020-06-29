<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 아이콘 key -->
 <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
<!-- 부트 스트랩 -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<link rel="stylesheet" href="/src/css/member/memberjoin/memberjoin.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
		<div class="joincontent">
			<form action="/companymemberjoin.do" method="post">
				<label id="lId" for="memberId" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-6">
					<input type="text" class="form-control" name="memberId"
						id="memberId" data-rule-required="true"
						placeholder="생성할 아이디를 입력해주세요"> <br>
					<span id="sId"></span>
				</div>
				<br> <label id="lPw" for="memberPw"
					class="col-lg-2 control-label">패스워드</label>
				<div class="col-lg-6">
					<input type="password" class="form-control" id="memberPw"
						name="memberPw" data-rule-required="true" placeholder="패스워드">
					<br>
					<span id="sPw"></span>
				</div>
				<br> <label id="lPwRw" for="memberPwRe"
					class="col-lg-2 control-label">패스워드 확인</label>
				<div class="col-lg-6">
					<input type="password" class="form-control" id="memberPwRe"
						placeholder="패스워드 확인"> <br>
					<span id="sPwRe"></span>
				</div>
				<br> <label id="lName" for="memberName"
					class="col-lg-2 control-label">이름</label>
				<div class="col-lg-6	">
					<input type="text" class="form-control onlyHangul" id="memberName"
						name="memberName" placeholder="한글만 입력 가능합니다."> <br>
					<span id="sName"></span>
				</div>
				<br> <label id="lNickname" for="memberNickname"
					class="col-lg-2 control-label">닉네임</label>
				<div class="col-lg-6">
					<input type="text" class="form-control" id="memberNickname"
						name="memberNickname" placeholder="닉네임">
						 <br>
					<span id="sNickname"></span>
				</div>
				<label id="lAge" for="age" class="col-lg-2 control-label">나이</label>
					<div class="col-lg-6">
						<input type="text" class="form-control" id="age" name="age"
							placeholder="나이"><br>
						<span id="sAge"></span>
					</div>
				<br> <label id="lEmail" for="email" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-5">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="이메일">
					<button type="button" id="emailBtn" name="emailBtn"
						class="btn btn-primary">이메일 인증</button>
						 <br>
					<span id="sEmail"></span>
				</div>
				<br> <label  id="lEmailCode" for="emailCode" class="col-lg-2 control-label"">이메일
					인증코드</label>
				<div class="col-lg-5">
					<input type="text" class="form-control" id="emailCode"
						name="emailCode" placeholder="인증코드를 입력하세요.">
					<button type="button" id="emailCodeBtn" name="emailCodeBtn"
						class="btn btn-primary">인증코드 확인</button>
					<br><span id="mailMsg"></span>
				</div>
				<br> <label id="lPhone" for="phone" class="col-lg-2 control-label">휴대폰
					번호</label>
				<div class="col-lg-6">
					<input type="tel" class="form-control onlyNumber" id="phone"
						name="phone" placeholder="-를 제외하고 숫자만 입력하세요.">
						 <br>
					<span id="sPhone"></span>
				</div>
				<br> <label id="lLicense" for="license" class="col-lg-2 control-label">사업자
					번호</label>
				<div class="col-lg-6">
					<input type="text" class="form-control onlyNumber" id="license"
						name="license" placeholder="-를 제외하고 숫자10자리를 입력하세요.">
						 <br>
					<span id="sLicense"></span>
				</div>
				<br> <label id="lUrl" for="companyUrl" class="col-lg-2 control-label">회사
					URL</label>
				<div class="col-lg-6">
					<input type="text" class="form-control onlyNumber" id="companyUrl"
						name="companyUrl" placeholder="자사 홈페이지 주소를 입력해주세요.">
						 <br>
					<span id="sUrl"></span>
				</div>
				<br> <label for="gender" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-6">
					<select class="form-control" id="gender" name="gender">
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
				</div>
				<br>
				<div class="divBtn" id="divBtn">
					<button type="submit" class="btn btn-primary">회원가입</button>
					<button type="reset" class="btn btn-primary">초기화</button>
				</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</section>
</body>
<script>
	var mailCode = "";
	var regExp = "";
	var checkArr = [false,false,false,false,false,false,false,false,false,false,false,false];

	$("#memberId").keyup(function() {
		regExp = /^[a-zA-Z0-9]{5,15}/;
		if ($("#memberId").val() == "") {
			$("#sId").html("아이디를 입력해주세요.");
			$("#sId").css("color", "red");
			checkArr[0] = false;
		}
		if (regExp.test($("#memberId").val())) {
			//아이디 중복확인
			var memberId = $("#memberId").val();
			$.ajax({
				url : "/chkId.do",
				type : "post",
				data : {
					memberId : memberId
				},
				success : function(data) {
					if (data == '0') {
						$("#lId").css("color", "green");
						$("#sId").html("사용가능한 아이디 입니다.");
						$("#sId").css("color", "green");
						checkArr[0] = true;
					} else {
						$("#memberId").focus();
						$("#lId").css("color", "red");
						$("#sId").html("중복된 아이디 입니다. 다른 아이디를 이용해주세요.");
						$("#sId").css("color", "red");
						checkArr[0] = false;
					}
				},
				error : function() {
					console.log("아이디 중복체크 실페");
				}
			});

		} else {
			$("#sId").html("아이디 생성규격을 맞춰주세요<br>(대문자,소문자로 시작히여 15글자 이내)");
			$("#sId").css("color", "red");
			checkArr[0] = false;
		}
	});
	$("#memberPw")
			.keyup(
					function() {
						regExp = /^[a-zA-Z0-9]{4,15}$/;
						if ($("#memberPw").val() == "") {
							$("#sPw").html("비밀번호를 입력해주세요.");
							$("#sPw").css("color", "red");
							$("#lPW").css("color","red");
							checkArr[1] = false;
						} else {
							if (regExp.test($("#memberPw").val())) {
								$("#sPw").html("생성 가능한 비밀번호 입니다.");
								$("#lPW").css("color","green");
								$("#sPw").css("color", "green");
								checkArr[1] = true;
							} else {
								$("#sPw")
										.html(
												"비밀번호 규격을 맞춰주세요<br>(대문자,소문자를 시작으로  숫자포함  15글자 이내)");
								$("#sPw").css("color", "red");
								$("#lPW").css("color","red");
								$("#memberPw").focus();
								checkArr[1] = false;
							}
						}
					});
	$("#memberPwRe").keyup(function() {
		if ($("#memberPwRe").val() == "") {
			$("#sPwRe").html("비밀번호를 입력해주세요.");
			$("#sPwRe").css("color", "red");
			checkArr[2] = false;
		} else {
			if ($("#memberPw").val() == $("#memberPwRe").val()) {
				$("#sPwRe").html("비밀번호가 일치합니다.");
				$("#sPwRe").css("color", "green");
				$("#lPwRe").css("color", "green");
				checkArr[2] = true;
			} else {
				$("#memberPwRe").focus();
				$("#sPwRe").html("비밀번호가 일치하지 않습니다.");
				$("#sPwRe").css("color", "red");
				checkArr[2] = false;
			}
		}
	});
	$("#memberName").keyup(function() {
		regExp = /^[가-힣]{2,5}$/;
		if (regExp.test($("#memberName").val())) {
			$("lName").css("color", "green");
			$("#sName").html("");
			checkArr[3] = true;
		} else {
			$("#sName").focus();
			$("#sName").html("이름규격에 맞춰주세요.<br>(한글 2글자 이상,5글자 이하)");
			$("#sName").css("color", "red");
			checkArr[3] = false;
		}
	});
	$("#memberNickname").keyup(function() {
		regExp = /^[a-zA-Z가-힣0-9]{2,10}$/;
		if ($("#memberNickname").val() == "") {
			$("#sNickname").html("닉네임을 입력해주세요.");
			$("#sNickname").css("color", "red");
			checkArr[4] = false;
		} else {
			if (regExp.test($("#membeNickname").val())) {
				var memberNickname = $("#memberNickname").val();
				$.ajax({
					url : "/chkNickname.do",
					type : "post",
					data : {
						memberNickname : memberNickname
					},
					success : function(data) {
						if (data == '0') {
							$("#sNickname").html("생성가능한 닉네임입니다.");
							$("#sNickname").css("color", "green");
							checkArr[4] = true;
						} else {
							alert("중복된 닉네임 입니다. 다른 닉네임를 이용해주세요.");
							$("#memberId").focus();
							$("#lNickname").css("color", "red");
							checkArr[4] = false;
						}
					},
					error : function() {
						console.log("아이디 중복체크 실페");
					}
				});
			} else {
				$("#sNickname").html("생성불가능한 닉네임입니다.<br>닉네임을 다시 확인해주세요.");
				$("#sNickname").css("color", "red");
				checkArr[4] = false;
			}
		}
	});
	$("#age").keyup(function() {
		regExp = /^[0-9]{2}$/;
		if ($("#age").val() == "") {
			$("#sAge").html("나이를 입력해주세요.");
			$("#sAge").css("color", "red");
			checkArr[5] = false;
		} else {
			if (regExp.test($("#age").val())) {
				$("#lAge").css("color", "green");
				$("#sAge").html("");
				checkArr[5] = true;
			} else {
				$("#lAge").css("color", "red");
				$("#sAge").html("나이를  확인해주세요.");
				$("#sAge").css("color", "red");
				checkArr[5] = false;
			}

		}

	});
	$("#email").keyup(function() {
		regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if ($("#email").val() == "") {
			checkArr[6] = false;
		} else {
			if (regExp.test($("#email").val())) {
				$("#lEmail").css("color", "green");
				$("#sEmail").html("");
				checkArr[6] = true;
			} else {
				$("#sEmail").html("정상적인 이메일이 아닙니다.");
				$("#sEmail").css("color", "red");
				checkArr[6] = false;

			}
		}
	});
	$("#phone").keyup(function() {
		regExp = /^\d{3}\d{3,4}\d{4}$/;
		if($("#phone").val()==""){
			$("#lPhone").css("color", "red");
			$("#sPhone").html("핸드폰번호는 - 없이 11자리까지 가능합니다.");
			$("#sPhone").css("color", "red");
			checkArr[7] = false;
		}else{
		if (regExp.test($("#phone").val())) {
			$("#lPhone").css("color", "green");
			$("#sPhone").html("");
			checkArr[7] = true;
		} else {
			$("#phone").focus();
			$("#sPhone").html("핸드폰번호는 - 없이 11자리까지 가능합니다.");
			$("#sPhone").css("color", "red");
			checkArr[7] = false;
		}
		}
	});
	$("#license").keyup(function(){
		regExp =/^[1-9]{1}[0-9]{9}/;
		if($("#license").val()==""){
			$("#lLicense").css("color", "red");
			$("#sLicense").html("사업자번호는 - 없이 10자리까지 가능합니다.");
			$("#sLicense").css("color", "red");
			checkArr[10]=false;
		}else{
		if(regExp.test($("#license").val())){
			$("#lLicense").css("color", "green");
			$("#sLicense").html("");
			checkArr[10]=true;
		}else{
			$("#lLicense").css("color", "red");
			$("#sLicense").html("사업자번호 양식이 올바르지않습니다.");
			$("#sLicense").css("color", "red");
			checkArr[10]=false;
		}
		}
	});
	$("#companyUrl").keyup(function(){
		regExp=/(http(s)?:\/\/)([a-z0-9\w]+\.*)+[a-z0-9]{2,4}/gi;
		if($("#companyUrl").val()==""){
			$("#lUrl").css("color", "red");
			$("#sUrl").html("URL주소를 입력해주세요.");
			$("#sUrl").css("color", "red");
			checkArr[11] = false;
		}else{
		if(regExp.test($("#companyUrl").val())){
			$("#lUrl").css("color", "green");
			$("#sUrl").html("");
			checkArr[11]=true;
		}else{
			$("#lUrl").css("color", "red");
			$("#sUrl").html("URL양식이 올바르지 않습니다.");
			$("#sUrl").css("color", "red");
			checkArr[11] = false;
		}
		}
	});
	//자바로 메일 보내기
	$("#emailBtn").click(function() {
		if ($("#email").val() == "") {
			alert("이메일이 입력되지 않았습니다.");
			checkArr[8] = false;
		} else {
			var email = $("#email").val();
			$.ajax({
				url : "/chkEmail.do",
				type : "post",
				data : {
					email : email
				},
				success : function(data) {
					if (data == '0') {
						$.ajax({
							url : "/sendMail.do",
							type : "post",
							data : {
								email : email
							},
							success : function(data) {
								mailCode = data;
								alert("이메일을 송신했습니다.");
								checkArr[8] = true;
							},
							error : function() {
								console.log("이메일발송에러");
							}
						});

					} else {
						alert("중복된 이메일 입니다.");
						$("#email").focus();
						checkArr[8] = false;
					}
				},
				error : function() {
					console.log("아이디 중복체크 실페");
				}

			});
		}
	});
	$("#emailCodeBtn").click(function() {
		if ($("#emailCode").val() == mailCode) {
			$("#mailMsg").html('인증성공');
			$("#mailMsg").css('color', 'green');
			checkArr[9] = true;
		} else {
			$("#mailMsg").html('인증실패');
			$("#mailMsg").css('color', 'red');
			$("#emailCode").focus();
			checkArr[9] = false;
		}
	});
	var count = 0;

	$("form").submit(function() {
		for (i = 0; i < checkArr.length; i++) {
			if (checkArr[i] == true) {
				count++;
			}
		}
		console.log(count);
		console.log(checkArr[0]);
		console.log(checkArr[1]);
		console.log(checkArr[2]);
		console.log(checkArr[3]);
		console.log(checkArr[4]);
		console.log(checkArr[5]);
		console.log(checkArr[6]);
		console.log(checkArr[7]);
		console.log(checkArr[8]);
		console.log(checkArr[9]);
		console.log(checkArr[10]);
		console.log(checkArr[11]);
		
		if(count == 12){
			return true;	
		} else {
			alert("회원가입 절차에 맞게 작성해주세요.")
			count = 0;
			return false;
		}
		return false; 
	});
</script>
</html>