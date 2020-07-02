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
	<div class="idSearchMain">
		<div class="userId">
		<h1>회원님의 아이디는'${m.memberId }'입니다.</h1>
		</div>
		<a href="/memberInformation.do"><button id="returnBtn" class="btn btn-outline-dark">돌아가기</button></a>
	</div>
</section>
 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>