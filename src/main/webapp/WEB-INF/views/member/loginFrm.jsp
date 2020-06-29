<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<!-- Bootstrap script -->
 <script src="/src/js/jquery/jquery-3.5.1.js"></script>
 <script src="/src/js/bootstrap/popper.min.js"></script>
 <script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
 <link rel="stylesheet" href="/src/css/member/login/login.css" />
 <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
    <!-- CSS here -->
    <link rel="stylesheet" href="/src/css/header/header.css" />
    <link rel="stylesheet" href="/src/css/footer/footer.css" />
    <link rel="stylesheet" href="/src/css/main/web_default.css" />
</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row"> 
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">환영합니다 ! <br> 로그인을 도와드릴게요!</h3>
              <form action="/loginMember.do" method="post">
                <div class="form-label-group">
                  <input type="text" id="memberId" name="memberId" class="form-control" placeholder="ID" required autofocus>
                </div>
                <div class="form-label-group">
                  <input type="password" id="memberPw" name="memberPw" class="form-control" placeholder="Password" required>                 
                </div>             
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Login</button>
                <div class="text-center">
              </form>
           <a href="/memberTerms.do"><input class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="button" value="회원가입"></a>
           <a class="small" href="/memberInformation.do">아이디/비밀번호 찾기</a></div>
                  </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</section>
 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>