<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 아이콘 key -->
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
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
			<label for="email" class="col-lg-2 control-label">이메일</label>
			<div class="col-lg-6">
				<input type="email" class="form-control" id="email" name="email"
					placeholder="이메일">
			</div><br>
			<label for="phone" class="col-lg-2 control-label">휴대폰
				번호</label>
			<div class="col-lg-6">
				<input type="tel" class="form-control onlyNumber" id="phone"
					name="phone" placeholder="-를 제외하고 숫자만 입력하세요.">
			</div><br>
			
			<label for="license" class="col-lg-2 control-label">사업자 번호</label>
			<div class="col-lg-6">
				<input type="tel" class="form-control onlyNumber" id="license"
					name="license" placeholder="-를 제외하고 숫자만 입력하세요.">
			</div><br>
			<label for="companyUrl" class="col-lg-2 control-label">회사 URL</label>
			<div class="col-lg-6">
				<input type="tel" class="form-control onlyNumber" id="companyUrl"
					name="companyUrl" placeholder="자사 홈페이지 주소를 입력해주세요.">
			</div><br>
				
			<label for="gender" class="col-lg-2 control-label">성별</label>
			<div class="col-lg-6">
				<select class="form-control" id="gender" name="gender">
					<option value="M">남</option>
					<option value="F">여</option>
				</select>
			</div><br>
			<div class="divBtn" id="divBtn">
				<button type="submit" class="btn btn-primary">회원가입</button>
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>	
	</section>
</body>
</html>