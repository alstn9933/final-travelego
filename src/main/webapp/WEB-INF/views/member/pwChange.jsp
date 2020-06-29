<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 부트 스트랩 -->
<script src="/src/js/jquery/jquery-3.5.1.js"></script>
<script src="/src/js/bootstrap/popper.min.js"></script>
<script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<!-- stylesheet -->
<link rel="stylesheet" href="/src/css/member/information/pwChange.css" />
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
		<div class="MainPWChange">
			<form action="/pwModify.do" method="post">
				<input type="hidden" name="memberId" value="${memberId }">
				<h6>변경할 비밀번호</h6>
				<input type="password" class="form-control" name="memberPw"
					id="memberPw" placeholder="변경하실 비밀번호를 입력해주세요.(대,소문자 /숫자를 포함한 4글자이상 15글자 이하)"><br> <span
					id="sPw"></span><br>
				<h6>변경할 비밀번호 확인</h6>
				<input type="password" class="form-control" name="memberPwRe"
					id="memberPwRe" placeholder="비밀번호 확인 부탁드립니다."> <span
					id="sPwRe"></span><br>
				<div class="modifyBtn">
					<button type="submit" id="submitBtn" class="btn btn-primary">수정하기</button>
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script>
	var cnt = 0;
	var checkArr = [false,false];
	$("#memberPw")
	.keyup(
			function(event) {
				regExp = /^[a-zA-Z0-9]{4,15}$/;
				if ($("#memberPw").val() == "") {
					$("#sPw").html("비밀번호를 입력해주세요.");
					$("#sPw").css("color", "red");
					checkArr[0]=false;
				} else {

					if (regExp.test($("#memberPw").val())) {
						$("#lPW").css("color","green");
						$("#sPw").html("생성 가능한 비밀번호 입니다.");
						$("#sPw").css("color", "green");
						console.log(cnt);
						checkArr[0]=true;
					} else {
						$("#sPw")
								.html(
										"비밀번호 규격을 맞춰주세요<br>(대문자,소문자를 시작으로  숫자포함  15글자 이내)");
						$("#sPw").css("color", "red");
						$("#memberPw").focus();
						checkArr[0]=false;
					}
				}
			});
$("#memberPwRe").keyup(function() {
if ($("#memberPwRe").val() == "") {
	$("#sPwRe").html("비밀번호를 입력해주세요.");
	$("#sPwRe").css("color", "red");
	checkArr[1]=false;
} else {
	if ($("#memberPw").val() == $("#memberPwRe").val()) {
		$("#sPwRe").html("비밀번호가 일치합니다.");
		$("#sPwRe").css("color", "green");
		checkArr[1]=true;
		console.log(cnt);
	} else {
		$("#memberPwRe").focus();
		$("#sPwRe").html("비밀번호가 일치하지 않습니다.");
		$("#sPwRe").css("color", "red");
		checkArr[1]=false;
	}
}
});
	$("form").submit(function() {
		
				if(checkArr[0]==true && checkArr[1]==true){
					return true;
				}else{
					alert("비밀번호 또는 비밀번화확인을 확인해주세요");
					return false;
		}
	});
</script>
</html>