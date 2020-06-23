<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="UTF-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 비 로그인시 알람 부트스트랩  -->
<script src="/src/js/jquery/jquery-3.5.1.js"></script>
<script src="/src/js/bootstrap/popper.min.js"></script>
<script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="/src/imgs/header/favicon.png" />
<!-- Place favicon.ico in the root directory -->
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
<!-- CSS here -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<title>회원관리</title>
<style></style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<!--컨텐츠 스크립트 -->
	<script>
		$(document).ready(function() {
			$("#keyword").keyup(function() {
				var k = $(this).val();
					$("#user-table > tbody > tr").hide();
		var temp = $("#user-table > tbody > tr > td:nth-child(5n+2):contains('"+ k + "')");
						$(temp).parent().show();
											})
			$("#memberConfirm").click(function(){
				var con_test = confirm("정지회원으로 전환됩니다. 진행하시겠습니까?");
				if(con_test == true){
						$(this).hide();
						$("#allowMember").show().css('padding-right','5px');
				}
				
				else if(con_test == false){
				 
				}	
			})								
											
											
						})


	</script>

	<section>
		<!DOCTYPE html>
		<html>

<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<style>
<!--
컨텐츠 스타일-->#member_container {
	width: 960px;
	margin: 0 auto;
}

#member_container #input-form {
	text-align: center;
}

#user-table {
	margin: 0 auto;
	text-align: center;
}

#input-form {
	margin-top: 10px;
	margin-bottom: 10px;
}

#user-table {
	border-collapse: collapse;
}

#user-table>thead>tr {
	background-color: #333;
	color: #fff;
}

#user-table>thead>tr>th {
	padding: 8px;
	width: 150px;
}

#user-table>tbody>tr>td {
	border-bottom: 1px solid gray;
	padding: 8px;
}

#member_type {
	padding-left: 2px;
	padding-right: 2px;
	padding-top: 1px;
	padding-bottom: 5px;
}

<!--
사이드바 메뉴 스타일-->.admin_page {
	font-family: "Lato", sans-serif;
}

.admin_sidebar {
	margin-top: 15%;
	height: 40%;
	width: 200px;
	position: fixed;
	top: 0;
	left: 0;
	background-color: white;
	padding-top: 60px;
}

.admin_sidebar a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
}

.admin_sidebar a:hover {
	color: #f1f1f1;
}

main .admin_sidebar {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

.material-icons, .admin_title {
	vertical-align: middle;
}

.material-icons {
	margin-right: 30px
}

#Contents {
	transition: margin-left 0.5s;
	padding: 16px;
	margin-left: 250px;
}

#pageNavi {
	text-align: center;
	width: 1000px;
	margin: 0 auto;
}

#pageNavi>* {
	margin: 10px;
}

@media screen and (max-height: 450px) {
	.admin_sidebar {
		padding-top: 15px;
	}
	.admin_sidebar a {
		font-size: 18px;
	}
}
</style>
<!-- 게시글 스타일 -->

<body>
	<div class="admin_page">
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/icon?family=Material+Icons" />

		<div id="mySidebar" class="admin_sidebar">
			<a href="memberManagement.do"><span class="admin_title"></span>회원
				관리</a></span><a href="local_management.do"><span><span
					class="admin_title">여행지 관리</span><br></a> <a
				href="QA_member_management.do" /><span class="admin_QA">회원문의사항</span><br>
			<a href="report_mamnagement.do" /><span class="admin_title">신고글
				관리</span></a>
		</div>
		<div id="member_container">

			<div id="input-form">
				<form name="search">
					<label> <input type="radio" name="search" value="id">아이디
					</label> <label> <input type="radio" name="search" value="stop">정지회원
					</label> <label> <input type="radio" name="search" value="nickname">닉네임/회사명
						조회
					</label> <label><input type="radio" name="search"
						value="disapproval">미승인 회원</label> <label><input
						type="radio" name="search" value="corporation">법인 회원</label>
					&nbsp; &nbsp; &nbsp; <input type="text" id="keyword" /> <input
						type="submit" name="submit" value="찾기">
				</form>
			</div>
			<div id="search_result">
				<table id="user-table">
					<thead>
						<tr>

							<th>회원 아이디</th>
							<th>닉네임/회사명</th>
							<th>이름</th>
							<th>이메일</th>
							<th>회원 레벨</th>
							<th>승인/미승인</th>
						</tr>
					</thead>

					<c:forEach items="${mList }" var="m">
						<c:if test="${m.memberLevel eq 1 }">
							<tr>
								<td>${m.memberId }</td>
								<td>${m.memberNickname }</td>
								<td>${m.memberName }</td>
								<td>${m.email }</td>
								<td>${m.memberLevel }</td>
								<td>해당 사항 없음</td>
							</tr>
							<!-- 회원관리 1:일반회원 2 :법인회원 3:관리자
				company 테이블에서  0 승인전, 1 승인 완료
			 -->
						</c:if>
					</c:forEach>

					<c:forEach items="${mList }" var="m">
						<c:if test="${m.memberLevel eq 2 }">
							<c:forEach items="${cList }" var="c">
								<c:if test="${m.memberId eq c.companyId }" >
									<tr>
										<td>${m.memberId }</td>
										<td>${m.memberNickname }</td>
										<td>${m.memberName }</td>
										<td>${m.email }</td>
										<td>${m.memberLevel }</td>
										
										<td id="allowMember" style="display:none;">승인 완료</td>
										<c:if test="${c.joinConfirm eq 1 }" >
										<form action="allowCorporationMember.do">
											<td><input type="button" name="allow" Id="memberConfirm"
												value="미승인 회원" ></td>
											</form>
										</c:if>
									</tr>

								</c:if>
							</c:forEach>

							<!-- 회원관리 1:일반회원 2 :법인회원 3:관리자
				company 테이블에서  0 승인전, 1 승인 완료
			 -->
						</c:if>
					</c:forEach>

				</table>
			</div>
		</div>
</body>

		</html>

	</section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Modal -->
	<div class="modal fade custom_search_pop" id="exampleModalCenter"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="serch_form">
					<input type="text" placeholder="Search" />
					<button type="submit">search</button>
				</div>
			</div>
		</div>
	</div>
	<!-- JS here -->
	<script src="/src/js/header/vendor/modernizr-3.5.0.min.js"></script>
	<!-- <script src="/src/js/header/vendor/jquery-1.12.4.min.js"></script>
	<script src="/src/js/header/popper.min.js"></script> -->
	<script src="/src/js/header/owl.carousel.min.js"></script>
	<script src="/src/js/header/isotope.pkgd.min.js"></script>
	<script src="/src/js/header/ajax-form.js"></script>
	<script src="/src/js/header/waypoints.min.js"></script>
	<script src="/src/js/header/jquery.counterup.min.js"></script>
	<script src="/src/js/header/imagesloaded.pkgd.min.js"></script>
	<script src="/src/js/header/scrollIt.js"></script>
	<script src="/src/js/header/jquery.scrollUp.min.js"></script>
	<script src="/src/js/header/wow.min.js"></script>
	<script src="/src/js/header/nice-select.min.js"></script>
	<script src="/src/js/header/jquery.slicknav.min.js"></script>
	<script src="/src/js/header/jquery.magnific-popup.min.js"></script>
	<script src="/src/js/header/plugins.js"></script>
	<script src="/src/js/header/gijgo.min.js"></script>
	<script src="/src/js/header/slick.min.js"></script>

	<!--contact js-->
	<script src="/src/js/header/contact.js"></script>
	<script src="/src/js/header/jquery.ajaxchimp.min.js"></script>
	<script src="/src/js/header/jquery.form.js"></script>
	<script src="/src/js/header/jquery.validate.min.js"></script>
	<script src="/src/js/header/mail-script.js"></script>
	<script src="/src/js/header/main.js"></script>
	<script>
		$(function() {
			$('[data-toggle="popover"]').popover();
		});

		$("#datepicker").datepicker({
			iconsLibrary : "fontawesome",
			icons : {
				rightIcon : "_$tag___________________________$tag__",
			},
		});
	</script>
</body>
</html>
