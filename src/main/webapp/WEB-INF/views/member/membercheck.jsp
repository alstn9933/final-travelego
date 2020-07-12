<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경 인증</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<link rel="stylesheet" href="/src/css/member/modiFied/modifymember.css" />
<!-- 아이콘 키값 -->
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<div class="mainContent-check">
	<h1>회원님의 비밀번호를 입력해주세요.</h1>
		<form action="/membercheck.do" method="post">
			비밀번호 입력 <input type="password" name="memberPw" id="memberPw" class="form-control"><br>
			<div class="btnBox">
			<button class="btn btn-primary" type="submit" id="okBtn">확인</button></div>
			<input type="hidden" name="memberId" value="${sessionScope.member.memberId }">
		</form>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script>
$(function(){
	$("#okBtn").click(function(){
		if($("#memberPw").val()==""){
			alert("비밀번호가 정확하지 않습니다.");
			return false;
		}else{
			return true;
		}
	});
})
</script>
</html>