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

			$(".memberConfirm").click(function() {
				var con_test = confirm("가입을 승인하시겠습니까?");
				if (con_test == true) {
					$(this).hide();

					var mberId = $(this).attr("data-id");
					$.ajax({
						url : "/confirmUpdateMember.do",
						type : "get",
						data : {
							companyId : mberId
						},
						success : function(data) {
							location.reload();
						},

						error : function() {
							alert("시스템 오류로 인한 작업중단");
						}

					})
				}

				else {

					alert("취소하셨습니다.");
				}
			})
			$(".companyStop").click(function() {
				var companyStop = confirm("회원 활동이 정지 됩니다.\n 진행하시겠습니까?");
				if (companyStop == true) {
					var cId = $(this).attr("data-id");
					$.ajax({
						url : "/modifyMemberLevel.do", // 콤마 없었음
						type : "get",
						data : {
							memberId : cId

						},
						success : function(data) { // 오타
							if (data == "1") {
								location.reload();
							} else {
								alert("회원 정지 실패");
							}
						},

						error : function() {
							alert("시스템 오류로 인한 작업중단");
						}
					});

				} else {
					alert("취소하셨습니다.");
				}
				;
			});

			$(".memberStop").click(function() {
				var stopConfirm = confirm("회원 활동이 정지 됩니다.진행하시겠습니까?");
				if (stopConfirm == true) {
					var mId = $(this).attr("data-id");
					$.ajax({
						url : "/modifyMemberLevel.do",
						type : "get",
						data : {
							memberId : mId

						},
						success : function(data) { // 오타
							if (data == "1") {
								location.reload();

							} else {
								alert("회원 정지 실패");
							}
						},

						error : function() {
							alert("시스템 오류로 인한 작업중단");
						}
					});

				} else {
					alert("취소하셨습니다.")
				}
				;
			})
			$(".memberRestore").click(function() {
				var memberRestore = confirm("활동 회원 으로 전환됩니다.");
				if (memberRestore == true) {
					var mId = $(this).attr("data-id");
					$.ajax({
						url : "/modifyMemberLevel.do",
						type : "post",
						data : {
							memberId : mId

						},
						success : function(data) { // 오타
							if (data == "1") {
								location.reload();

							} else {
								alert("회원 상태 복귀 실패");
							}
						},

						error : function() {
							alert("시스템 오류로 인한 작업중단");
						}
					});

				} else {
					alert("취소하셨습니다.");
				}
			});

			$(".memberDelete").click(function() {
				var memberDelete = confirm("회원이 삭제 됩니다.\n 진행행하시겠습니까?");
				if (memberDelete == true) {
					var mId = $(this).attr("data-id");
					$.ajax({
						url : "/memberDelete.do",
						type : "post",
						data : {
							memberId : mId

						},
						success : function(data) { // 오타
							if (data == "1") {
								location.reload();

							} else {
								alert("회원 상태 복귀 실패");
							}
						},

						error : function() {
							alert("시스템 오류로 인한 작업중단");
						}
					})

				} else {
					alert("취소하셨습니다.")
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
컨텐츠 스타일 -->#member_container {
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
	margin-left: 150px;
}

#pageNavi {
	text-align: center;
	width: 1000px;
	margin: 0 auto;
}

#pageNavi>* {
	margin: 10px;
}

#mButton {
	cursor: pointer;
}

@media screen and (max-height: 450px) {
	.admin_sidebar {
		padding-top: 15px;
	}
	.admin_sidebar a {
		font-size: 18px;
	}
}

.memberDelete {
	width: 50px;
	height: 30px;
	background-color: white;
	border: 1px solid orangered;
	color: orangered;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	text-align: center;
	border-radius: 10px;
	cursor: pointer;
}

.memberDelete:hover {
	background-color: orangered;
	color: white;
}

.memberRestore {
	width: 50px;
	height: 30px;
	background-color: white;
	border: none;
	color: black;
	border: 1px solid #4B89DC;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	text-align: center;
	border-radius: 10px;
	cursor: pointer;
}

.memberRestore:hover {
	background-color: #4B89DC;
	color: white;
}

.memberStop {
	width: 50px;
	height: 30px;
	border: 1px solid #E6E671;
	background: white; color : black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	text-align: center;
	border-radius: 10px;
	cursor: pointer;
	color: black;
}

.memberStop:hover {
	background-color: #E6E671;
	color: white;
}

.companyStop {
	width: 50px;
	height: 30px;
	border: 1px solid #E6E671;
	background: white;
	color: black;
	text-align: center;
	display: inline-block;
	font-size: 15px;
	text-align: center;
	border-radius: 10px;
	cursor: pointer;
}

.companyStop:hover {
	background-color: #E6E671;
}
.memberConfirm{
	width: 100%;
	height: 30px;
	background-color:white;
	border: 1px solid orangered;
	text-align: center;
	display: inline-block;
	font-size: 15px;
	text-align: center;
	border-radius: 10px;
	cursor: pointer;
}
.memberConfirm:hover{
		background-color: #orangered;
}


@media screen and (max-width: 1000px) {
	#mySidebar {
		display: none;
	}
}
</style>
<!-- 게시글 스타일 -->

<body>
	<div class="admin_page">
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/icon?family=Material+Icons" />
			<link rel="stylesheet"
				href="https://fonts.googleapis.com/icon?family=Material+Icons" />
			<div class="admin_page">
			<div id="mySidebar" class="admin_sidebar">
				<a href="/memberManagement.do?reqPage=1"><span
					class="admin_title" style="color: black">회원 관리</span></a><a href="/spot_managenet.do"><span
						class="admin_title" >여행지 관리</span><br></a> <a
					href="/adminQnaList.do" ><span class="admin_QA">회원문의사항</span></a>
				<a href="/reportList.do"><span class="admin_title">신고글 관리</span></a>
			</div>


		<div id="member_container">

			<form role="form" method="get">
				<div name="memberTable" >
					<div class="search"
						style="padding-left: 710px; margin-bottom: 10px;">

						<select name="searchType" style="width: 100px; height: 29px;">
							<option value="n"
								<c:out value="${searchM.searchType == null ? 'selected' : ''}"/>>선택</option>
							<option value="id"
								<c:out value="${searchM.searchType eq 'id' ? 'selected' : ''}"/>>아이디</option>
							<option value="nickname"
								<c:out value="${searchM.searchType eq 'nickname' ? 'selected' : ''}"/>>닉네임</option>
							<option value="name"
								<c:out value="${scri.searchType eq 'name' ? 'selected' : ''}"/>>이름</option>
						</select> <input type="text" name="keyword" id="keywordInput"
							value="${searchM.keyword}" />

						<button id="searchBtn" type="button">검색</button>

					</div>

					<table id="user-table" style="font-size: 0.85rem;">
						<thead>
							<tr>
								<th>회원 아이디</th>
								<th>닉네임/회사명</th>
								<th>이름</th>
								<th>이메일</th>
								<th>회원 상태</th>
								<th>승인/미승인</th>
							</tr>
						</thead>
						<!-- 일반회원 -->
						<c:forEach items="${mList}" var="m">
							<tr>
								<td><c:out value="${m.memberId }" /></td>
								<td>${m.memberNickname }</td>
								<td>${m.memberName }</td>
								<td>${m.email }</td>

								<c:if test="${m.memberLevel eq 1}">
									<td id="modifyMember">일반 회원 <br> <input type="button"
										id="mButton" name="memberStop" class="memberStop" value="정지"
										data-id="${m.memberId}">
									</td>
									<td>해당 사항 없음</td>
								</c:if>

								<c:if test="${m.memberLevel eq -1}">
									<td id="modifyMember">정지 회원 <br> <input type="button"
										id="mButton" name="memberRecycle" class="memberRestore"
										value="복구" data-id="${m.memberId}"> <input
										type="button" name="memberDelete" class="memberDelete"
										value="제명" data-id="${m.memberId}">
									</td>
									<td>해당 사항 없음</td>
								</c:if>

								<c:if test="${m.memberLevel eq 3}">
									<td id="modifyMember">관리자</td>
									<td>해당 사항 없음</td>
								</c:if>


								<c:if test="${m.memberLevel eq 2}">
									<td id="modifyMember">법인 회원 <br> <input type="button"
										id="mButton" name="companyStop" class="companyStop" value="정지"
										data-id="${m.memberId}"></td>


									<td><c:forEach items="${cList }" var="c">
											<c:if test="${m.memberId eq c.companyId }">
												<c:if test="${c.joinConfirm eq 1}">
											승인 완료 
										</c:if>
												<c:if test="${c.joinConfirm eq 0}">
													<input type="button" name="allow" class="memberConfirm"
														id="mButton" value="미승인 회원" data-id="${c.companyId}"
														style="color: red;">

												</c:if>
											</c:if>
										</c:forEach></td>
								</c:if>
								<c:if test="${m.memberLevel eq -2}">
									<td>법인회원<br> <input type="button"
										name="memberRecycle" class="memberRestore" value="복구"
										id="mButton" data-id="${m.memberId}"> <input
										type="button" name="memberDelete" class="memberDelete"
										value="제명" id="mButton" data-id="${m.memberId}"></td>
									<td><c:forEach items="${cList }" var="c">
											<c:if test="${m.memberId eq c.companyId }">
												<c:if test="${c.joinConfirm eq 1}">
											승인 완료
										</c:if>
												<c:if test="${c.joinConfirm eq 0}">
													<input type="button" name="allow" class="memberConfirm"
														value="미승인 회원" data-id="${c.companyId}" id="mButton"
														style="color: red;">
												</c:if>
											</c:if>
										</c:forEach></td>

								</c:if>




							</tr>
							<!-- 회원관리 1:일반회원 2 :법인회원 3:관리자
									company 테이블에서  0 승인전, 1 승인 완료
			 -->

						</c:forEach>
						<!-- 법인 회원   -->

					</table>
					<br>
					<div name="mPage" style="text-align: center;">
						<c:if test="${pgm.prev}">
							<a href="memberManagement.do${pgm.makeSearch(pgm.startPage - 1)}">이전</a>
						</c:if>
						<c:forEach begin="${pgm.startPage}" end="${pgm.endPage}" var="idx">
							<a href="memberManagement.do${pgm.makeSearch(idx)}">${idx}</a>
						</c:forEach>

						<c:if test="${pgm.next && pgm.endPage > 0}">
							<a href="memberManagement.do${pgm.makeSearch(pgm.endPage + 1)}">다음</a>
						</c:if>
					</div>

				</div>
			</form>
		</div>

	</div>

	<script>
		$(function() {
			$('#searchBtn').click(
					function() {
						self.location = "memberManagement.do"
								+ '${pgm.makeQuery(1)}' + "&searchType="
								+ $("select option:selected").val()
								+ "&keyword="
								+ encodeURIComponent($('#keywordInput').val());
					});
		});
	</script>
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
	<!-- 	<script src="/src/js/header/nice-select.min.js"></script> -->
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