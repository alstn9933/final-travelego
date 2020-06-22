<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택</title>
<!-- 아이콘 주소값  -->
<script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
    <!-- 부트스트랩 -->
     <link rel="stylesheet" href="/src/css/header/header.css" />
    <link rel="stylesheet" href="/src/css/footer/footer.css" />
    <link rel="stylesheet" href="/src/css/main/web_default.css" />
     <link rel="stylesheet" href="/src/css/member/joinFrm/joinFrm.css" />
</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
	<div class="joincontent">
		<div class="mainfrm">
			<h1>회원가입</h1>
			<div class="memberlevel1">
			<i class="far fa-user-circle"></i><br>
			<h3>일반회원</h3>
			<a href="/memberjoinFrm.do"><input class="btn btn-primary" type="button" value="가입"></a>
			</div>
			<div class="memberlevel2">
			<i class="far fa-building"></i><br>
			<h3>법인회원</h3>
			<a href="/companyjoinFrm.do"><input  class="btn btn-primary"type="button" value="가입"></a>
			</div>
		</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>