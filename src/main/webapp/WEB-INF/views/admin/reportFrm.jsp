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
<title>신고하기</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<style>
table.table2 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.table2 tr {
	width: 10px;
	padding: 10px;
	font-weight: bold;
	font-size: 15px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table2 td {
	width: 100px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>
	
	<section>
		<form method="post" action="/insertReport.do" class="submit">
			<table style="padding-top: 50px" align=center width=1000; border=0
				;cellpadding=2>
				<tr style="text-align:center;">
					<h3>신고하기</h3>
				<tr>
				<tr>
					<td bgcolor=white>
						<table class="table2">
							<tr>
								<td>신고 게시판</td>
								
									
								<c:if test="${r.boardClass eq 1 }">
									<td>내 여행
										<input type="hidden" name="boardClass" size=20 
									value="1">
									</td>
								</c:if>
								<c:if test="${r.boardClass eq 2 }">
									<td>추천게시판
									<input type="hidden" name="boardClass" size=20 
									value="2">
									</td>
								</c:if>
								<c:if test="${r.boardClass eq 3 }">
									<td>동행구하기
									<input type="hidden" name="boardClass" size=20 
									value="3">
									</td>
								</c:if>
								<c:if test="${r.boardClass eq 4 }">
									<td>투어티켓
									<input type="hidden" name="boardClass" size=20 
									value="4">
									</td>
								</c:if>
								<c:if test="${r.boardClass eq 5 }">
									<td>일정 게시판
									<input type="hidden" name="boardClass" size=20 
									value="5">
									</td>
								</c:if>
									
									
									<!-- 네임값이 컨트롤러 메소드로 들어감 -->
									
							</tr>
							<tr>
								<td>피신고자</td>
								<td><input type=text name="reportedMember" size=20
									readonly value="${r.reportedMember }"> 
									<input type="hidden" name="reportWriter" value="${sessionScope.member.memberId }">
									<input type="hidden" name="boardNo" value="${r.boardNo }">
								</td>
							</tr>


							<tr>
								<td>신고 제목</td>
								<td><input type="text" name="reportCategory" size=60 class="reportTitle" onkeyup="chkword(this,17)" placeholder="제목을 입력하세요 17자 미만"></td>
							</tr>

							<tr>
								<td>사유</td>
								<td><textarea name="reportContent" cols=85 rows=15 class="reportContent" 
										placeholder="사유를 입력하세요 100자 이상~600자 미만" onkeyup="chkContent(this,620)"></textarea></td>
							</tr>


						</table>

						<center>
							<input type="submit" value="작성" style="width: 100px;">
						</center>
					</td>
				</tr>
			</table>
		</form>
<script>
	var checkArr = [ false, false];
		
		function chkword(obj, maxByte) {
			var strValue = obj.value;
			var strLen = strValue.length;
			var totalByte = 0;
			var len = 0;
			var oneChar = "";
			var str2 = "";
			for (var i = 0; i < strLen; i++) {
				oneChar = strValue.charAt(i);
				if (escape(oneChar).length > 4) {
					totalByte += 2;
				} else {
					totalByte++;
				} // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장 
				if (totalByte <= maxByte) {
					len = i + 1;
				}
			} // 넘어가는 글자는 자른다. 
			if (totalByte > maxByte) {
				alert(maxByte + "자를 초과 입력 할 수 없습니다.");
				str2 = strValue.substr(0, len);
				obj.value = str2;
				chkword(obj, 4000);
				
			}
		}
		$(".reportTitle").keyup(function(){
			if($("#reportTitle").val()==""){
				checkArr[0]=false;
				
			}else{
				checkArr[0]=true;
			}
		})
		$(".reportContent").keyup(function(){
			if($("#reportContent").val()==""){
			checkArr[1]=false
			}else{
				checkArr[1]=true;
			}
		})
		
		
		function chkContent(obj, maxByte) {
			var strValue = obj.value;
			var strLen = strValue.length;
			var totalByte = 0;
			var len = 0;
			var oneChar = "";
			var str2 = "";
			for (var i = 0; i < strLen; i++) {
				oneChar = strValue.charAt(i);
				if (escape(oneChar).length > 4) {
					totalByte += 2;
				} else {
					totalByte++;
				} // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장 
				if (totalByte <= maxByte) {
					len = i + 1;
				}
			} // 넘어가는 글자는 자른다. 
			if (totalByte > maxByte) {
				alert(maxByte + "자를 초과 입력 할 수 없습니다.");
				str2 = strValue.substr(0, len);
				obj.value = str2;
				chkword(obj, 4000);
			}
		}
		var count = 0;
		$("form").submit(function() {
			for (i = 0; i < checkArr.length; i++) {
				if (checkArr[i] == true) {
					count++;
				}
			}
			if (count < 1) {
				alert("양식에  작성해주세요.");
				count = 0;
				return false;
			} else if (count == 2) {
				return true;
			}

		});
		
		
	</script>

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