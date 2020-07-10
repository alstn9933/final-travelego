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
<title>Q&A</title>
<style></style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<section>
		<!DOCTYPE html>
		<html>

<head>
<meta charset="UTF-8">
<title>문의글 답변하기</title>
</head>
<style>
.admin_page {
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
	margin-left: 350px;
	
}

@media screen and (max-height: 450px) {
	.admin_sidebar {
		padding-top: 15px;
	}
	.admin_sidebar a {
		font-size: 18px;
	}
}
#bot{
	margin-top:100px;
	margin-bottom:50px;
	margin-left:150px;
}


</style>


<body>
	<section>
		<script>
			$(function() {
				$("#updateAnswer").click(function() {
					var qnaNo = $("#qnaNo").attr("data-id");
					var qnaAnswer = $("#answer").val();
					$.ajax({
						type : "post",
						url : "/updateAnswer.do",
						data : {
							qnaNo : qnaNo,
							qnaAnswer : qnaAnswer
						},
						success : function(data) {
							if (data == "1") {
								alert("답변을 변경하셨습니다.");
								loaction.reload();
							} else {
								alert("답변변경 오류");
							}
						},
						error : function(data) {
							alert("시스템상 오류\n 시스템 관리자에게 문의 바랍니다.");
						}
					});
				});
			});
		</script>
		<div class="admin_page">
			<link rel="stylesheet"
				href="https://fonts.googleapis.com/icon?family=Material+Icons" />

			<div id="mySidebar" class="admin_sidebar">
				<a href="/memberManagement.do"><span class="admin_title"></span>회원
					관리</a></span><a href="spot_managenet.do"><span><span
						class="admin_title">여행지 관리</span><br></a> <a
					href="/adminQnaList.do" /><span class="admin_QA">회원문의사항</span><br>
				<a href="/reportList.do"><span class="admin_title">신고글 관리</span></a>
			</div>
			<div id="Contents">
				
				<form action="/question_answer.do" method="post">
					<div>
						글 번호     <input type="text" value="${q.qnaNo }" name="qnaNo" readonly
							id="qnaNo" data-id="${q.qnaNo}" style="margin-left:140px;">
					</div>
					<br>
					<div>
						문의 아이디  <input type="text" value="${q.qnaWriter }"
							name="qnaWriter" readonly style="margin-left:108px;">
					</div>
					<br>
					<div>
						문의 제목     <input type="text" value="${q.qnaTitle }" name="qnaTitle"
							readonly style="margin-left:125px;">
					</div>
					<br>
					<div>
						질문 날짜  <input type="text" value="${q.askDate }" name="askDate"
							readonly style="margin-left:125px;" >
					</div>
					<br>
					<div>
						질문내용 
						<textarea rows="5" cols="50" " style="resize:none;margin-left:130.4px;" readonly
							name="qnaContent" >${q.qnaContent }</textarea>
					</div>
					<br>

					<c:if test="${!empty q.qnaAnswer }">
						<div>
							답변 :
							<textarea rows="5" cols="50" style="resize: none;margin-left:154px;"
								name="qnaAnswer" value="${q.qnaAnswer}" id="answer"
								data-id="${q.qnaAnswer}" placeholder="${q.qnaAnswer}">${q.qnaAnswer} </textarea>
						</div>
						<br>
						<div id="bot">
						<input type="button" onclick="location.href='/adminQnaList.do'"
							value="이전">
						<input type="reset" vlaue="초기화" >
						<input type="button" id="updateAnswer" name="updateAnswer"
							value="수정">
							</div>
					</c:if>

					<c:if test="${empty q.qnaAnswer }">
						<div>
							답변 :
							<textarea rows="5" cols="50" style="resize: none;"
								name="qnaAnswer"> </textarea>
						</div>
						<br>
						<div id="bot" >
						<input type="button" onclick="location.href='/adminQnaList.do'"
							value="이전">
						<input type="reset" vlaue="초기화">
						<input type="submit" value="완료">
						</div>
					</c:if>




				</form>
			</div>
		</div>
		<!-- 지금보면 처음 값 다 가져가는데 아마 쿼리돌고오면서 값이 0 이되서 오는거보면 업뎃 안걸리는듯 쿼리문 문제인강 그럼?sql 에선 잘되는뎅-->
	</section>
</body>

		</html>


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
