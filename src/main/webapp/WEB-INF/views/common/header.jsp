<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header>
	<div class="header-area">
		<div id="sticky-header" class="main-header-area">
			<div class="container-fluid">
				<div class="header_bottom_border">
					<div class="row align-items-center">
						<div class="col-xl-2 col-lg-2">
							<div class="logo">
								<a href="index.jsp"><img
									src="/src/imgs/header/mainlogo2.png"
									style="width: 100%; height: 90px;" alt="" /> </a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6">
							<div class="main-menu d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a class="active" href="index.html">일정게시판</a></li>
										<li><a href="/recommendList.do">추천게시판</a></li>
										<li><a class="" href="/tourList.do">투어/티켓</a></li>
										<li><a href="/noticeList.do?reqPage=1">공지사항</a></li>
									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-4 col-lg-4 d-none d-lg-block">
							<div
								class="social_wrap d-flex align-items-center justify-content-end">
								<c:if test="${sessionScope.member.memberId == 'admin'}">
									<div class="col-xl-2 col-lg-6">
										<div class="main-menu  d-none d-lg-block">
											<nav>
												<ul id="navigation">
													<ul class="submenu">
														<li><a href="#"><i class="fas fa-tools"></i></i></a>
															<ul class="submenu">
																<li><a href="destination_details.html">관리자 페이지</a>
																</li>
															</ul></li>
													</ul>
												</ul>
											</nav>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty sessionScope.member }">
									<!-- 알림 아이콘 자리 -->
									<div class="alramIcon">
										<a id="bellBtn" href="javascript:void(0)" title="알람"> <i class="far fa-bell ringmybell"></i>
										<span id="alramCount"></span></a>
										<div class="alramListBox"></div>
									</div>
									<div class="col-xl-2 col-lg-6">
										<div class="main-menu  d-none d-lg-block">
											<nav>
												<ul id="navigation">
													<ul class="submenu">
														<li><a href="/myPage.do"><i
																class="far fa-user userIcon"></i></a>
															<ul class="submenu">
																<li><a href="/memberModifiedFrm.do">회원정보수정(일반)</a></li>
																<li><a href="/companyModifiedFrm.do">회원정보수정(법인)</a></li>
																<li><a href="/mypage.do">마이페이지</a></li>
																<li><a href="/mytripFrm.do">일정만들기</a></li>
																<li><a href="javascript:void(0)" id="openInbox">쪽지함</a></li>
															</ul></li>
													</ul>
												</ul>
											</nav>
										</div>
									</div>
									<a href="/logout.do"><i
										class="fas fa-sign-out-alt logoutIcon"></i></a>
								</c:if>

								<c:if test="${empty sessionScope.member }">
									<div class="emptyuser">
										<a href="#" title="회원정보가 없습니다!" data-toggle="popover"
											data-placement="bottom"><i class="far fa-user userIcon"></i></a>
									</div>
									<a href="/loginFrm.do"><i class="fas fa-power-off"></i></a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/src/js/message/openInbox.js"></script>
</header>
<c:if test="${not empty sessionScope.member }">
<script>
$(function(){	
var loginUserId = '${sessionScope.member.memberId}';
$.ajax({
			url : "/checkNotify.do",
			type : "post",
			data : {
				memberId : loginUserId
			},
			success : function(data) {
				if(data>0){
				$("#alramCount").html(data);
				}else{
				$("#alramCount").hide();	
				}
			},
			error : function() {
				console.log("알람 읽어오기 에러");
			}
		});
});
</script>
<script>
var loginUserId = '${sessionScope.member.memberId}';
 $("#bellBtn").click(function(){
	 $("#alramCount").html("");
	 $("#alramCount").hide();
	 $(".alramListBox").toggle(100);
	 $.ajax({
		 url : "/alramList.do",
		 type : "post",
		 data : {memberId:loginUserId},
		 success : function(data){
			 console.log("1차성공");
			 html = "";
			 console.log(data);
			 console.log(data.length)
			 for(i=0;i<data.length;i++){
			  html += "<div class='alramLine' val='" + data[i]['notifyNo'] + "'>"+data[i]["notifyContent"]+"</div>";
			 }
			  $(".alramListBox").append(html); 
				 console.log("2처시작")
				 $.ajax({
					 url : "/zeroCount.do",
					 type : "post",
					 data : {memberId : loginUserId},
					
					 success : function(){
						 console.log("2차성공");
						 console.log("전체읽음");
					 },
					 error : function(){
						 console.log("읽기싫패");
					 }
				 })
			 
		 },
		  error : function(){
			  consolo.log("리스트 읽어오기 실패");
		  }
	 })
 });

</script>
</c:if>