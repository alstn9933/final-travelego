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
<title>신고글 관리</title>
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
<title>관리자 페이지</title>
</head>
<style>
#container {
	width: 960px;
	margin: 0 auto;
}

#container #input-form {
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
	margin-left: 250px;
}

#reportlPage {
	background-color: white;
	border: 0.5px;
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

.deletePage {
	width: 100px;
	height: 30px;
	background-color: #37cca6;
	border: none;
	color: #fff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	text-align: center;
	border-radius: 10px;
	cursor: pointer;
}

.deletePage:hover {
	background-color: orangered;
}

@media screen and (max-width: 1000px) {
	#mySidebar {
		display: none;
	}
}
</style>
<script>
	$(function() {
				$(".activeStop").click(function() {
					var activeStop = $(this).attr("data-id");
					var confirmOk = confirm("회원 활동이 정지 됩니다.진행하시겠습니까?");
					if (confirmOk == true) {
						$.ajax({
							url : "/modifyMemberLevel.do", // 콤마 없었음
							type : "get",
							data : {
								memberId : activeStop
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
						})

					} else {
						alert("취소하셨습니다.");
					}
				});
				$(".deletePage").click(
								function() {
									alert("게시글을 삭제합니다.");
									var removeCon = confirm("게시물을 삭제하시겠습니까~?\n 신고자와 신고글이 같은 다수일 경우 다중 삭제 됩니다.");
									if (removeCon == true) {
										var boardClass = $(this)
												.attr("data-id");
										var boardNo = $(this).parent().parent().find(".boardNo").attr("data-id");
										$.ajax({
											url : "/deletePage.do",
											type : "get",
											data : {
												boardClass : boardClass,
												boardNo : boardNo
											},
											success : function(data) { // 오타
												if (data == "2") {
													location.reload();

												} else {
													alert("다중삭제 되었습니다.");
													location.reload();
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

				$("#keyword").keyup(function() {
					var k = $(this).val();
					$("#user-table > tbody > tr").hide();
					var temp = $("#user-table > tbody > tr > td:nth-child(7):contains('"
											+ k + "')");

									$(temp).parent().show();
								})
								
			
				
								
			});
			<!-- -->
			function reportContent(obj) {
				var content = $(obj).prev(".reportContent").val();
				$(".modalcontent").html(content);
				var reportedMem = $(obj).parent().parent().find(".reportedMem").text();
				console.log(reportedMem);
				$(".modalReported").text(reportedMem);
			
			}
			
			function movePage(boardNo,boardClass){
				console.log(boardNo,boardClass)
				if(boardClass==2){
					location.href="/recDetail.do?reqPage=1&recNo="+boardNo
 				}if(boardClass==3){
					//동행-도형
					location.href="/together/singleView.do?boardNo="+boardNo
		}
		if(boardClass==5){
					location.href="/tripboard/view.do?tripBoardNo="+boardNo
				}
				
			}
</script>
<body>
	<div class="admin_page">
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/icon?family=Material+Icons" />

		<div id="mySidebar" class="admin_sidebar">
			<a href="/memberManagement.do?reqPage=1"><span
				class="admin_title"></span>회원 관리</a><a href="/spot_managenet.do"><span
				class="admin_title">여행지 관리</span><br></a> <a
				href="/adminQnaList.do"><span class="admin_QA">회원문의사항</span></a> <a
				href="/reportList.do"><span class="admin_title"
				style="color: black"> 신고글 관리</span></a>
		</div>



		<div id="container">
			<form role="form" method="get">
				<div name="reportContainer">
					<div class="search"
						style="padding-left: 575px; margin-bottom: 10px;">
						<span> <select name="searchType"
							style="width: 140px; height: 29px;">
								<option value="n"
									<c:out value="${searchRe.searchType == null ? 'selected' : ''}"/>>선택</option>
								<option value="id"
									<c:out value="${searchRe.searchType eq 'reportedMember' ? 'selected' : ''}"/>>신고받은
									아이디</option>
						</select> <input type="text" name="keyword" id="keywordInput"
							value="${searchRe.keyword}" />
							<button id="searchBtn" type="button">검색</button>
						</span>
					</div>
					<table id="user-table" class="reTable" style="font-size: 0.85rem;">
						<thead>
							<tr>
								<th>신고번호</th>
								<th>신고분류</th>
								<th>신고내용</th>
								<th>출처</th>
								<th>게시글 번호</th>
								<th>신고자</th>
								<!-- 신고자 -->
								<th>피신고자</th>
								<th>신고날짜</th>
								<th>게시글 삭제</th>
							</tr>
						</thead>


						<c:forEach items="${reList}" var="r">
							<tr>
								<td>${r.reportNo}</td>
								<td>${r.reportCategory}<br> <input type="button"
									style="color: red" value="상세페이지 이동" data-id="${r.reportNo }"
									id="reportlPage"
									onclick="movePage(${r.boardNo},${r.boardClass });">
								</td>
								<td><input class="reportContent" type="hidden"
									value="${r.reportContent }">
									<button type="button" onclick="reportContent(this);"
										id="${r.reportNo}" data-toggle="modal"
										data-target="#exampleModal"
										style="background-color: white; cursor: pointer; border: 0.2em; outline: 0.1;">상세보기</button></td>
								<!--  *BOARD_CLASS 1:MY_TRIP 2:RECOMMEND_BOARD 3:TOGETHER_BOARD 4:TOUR 5:TRIP_BOARD*/ 상세 주소 찾고, 넣기-->
								<c:if test="${r.boardClass eq 1 }">
									<td>내 여행</td>
								</c:if>
								<c:if test="${r.boardClass eq 2 }">
									<td>추천게시판</td>
								</c:if>
								<c:if test="${r.boardClass eq 3 }">
									<td>동행구하기</td>
								</c:if>
								<c:if test="${r.boardClass eq 4 }">
									<td>투어티켓</td>
								</c:if>
								<c:if test="${r.boardClass eq 5 }">
									<td>일정 게시판</td>
								</c:if>
								<td class="boardNo" data-id="${r.boardNo}">${r.boardNo }</td>
								<td>${r.reportWriter}</td>
								<c:forEach items="${mList }" var="m">
									<c:if test="${m.memberId eq r.reportedMember}">
										<c:if test="${m.memberLevel gt 0 }">
											<td class="reportedMem">${r.reportedMember}<br> <input
												type="button" name="memberStop" id="activeStop" value="정지"
												class="activeStop" data-id="${r.reportedMember}"></td>
										</c:if>
										<c:if test="${ m.memberLevel lt 0 }">
											<td class="reportedMem">${r.reportedMember }<br>
												<p style="color: red; font-size: 15x;">정지 회원</p>
											</td>
										</c:if>
									</c:if>
								</c:forEach>
								<td>${r.reportDate }</td>
								<c:if test="${r.boardClass eq r.boardNo }">
									<td><input type="button" name="delete" value="게시글 삭제"
										class="deletePage" data-id="${r.boardClass}"></td>
								</c:if>
								<c:if test="${r.boardClass ne r.boardNo }">
									<td><input type="button" name="delete" value="게시글 삭제"
										class="deletePage" data-id="${r.boardClass}"></td>
								</c:if>
							</tr>





						</c:forEach>
					</table>

					<br>
					<div name="rePage" style="text-align: center;">
						<c:if test="${pgm.prev}">
							<a href="reportList.do${pgm.makeSearch(pgm.startPage - 1)}">이전</a>
						</c:if>
						<c:forEach begin="${pgm.startPage}" end="${pgm.endPage}" var="idx">
							<a href="reportList.do${pgm.makeSearch(idx)}">${idx}</a>
						</c:forEach>

						<c:if test="${pgm.next && pgm.endPage > 0}">
							<a href="reportList.do${pgm.makeSearch(pgm.endPage + 1)}">다음</a>
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modalcontent"></div>
					<div class="modalReported"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
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
				<div class="modal-reported"></div>
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
