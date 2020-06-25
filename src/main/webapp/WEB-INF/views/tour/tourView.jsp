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
<title>Travelego</title>
<style>
section {
	overflow:hidden;
	width:1200px;
	margin:0 auto;
}

.section-top>div {
	float: left;
}

.section-top {
	border-bottom: 2px solid gray;
	overflow: hidden;
}

.itemInfo {
	width:100%;
}
.itemInfo>table{
	width:100%;
}
#itemTitle{
	width:70%;
	font-size:30px;
	border-bottom:1px solid lightgray;
}
#itemPrice>td{
	height:100px;
	font-size:30px;
	line-height:100px;
}
#itemPrice>td:last-child{
	font-size:15px;
}
#itemPrice>td:last-child>table td{
	width:50%;
	height:40px;
	line-height:40px;
}
#ask-msg{
	width:100px;
	height:40px;
	line-hieht:40px;
	margin-left:20px;
}
.content{
	width: 70%;
	float:left;
	overflow: hidden;
	margin-top: 20px;
}
.itemContent {
	width: 100%;
	overflow: hidden;
	background-color:#25e6b5;
}
.itemContent>img{
	width:100%;
	height:auto;
}
.morebtn>button{
	width:100%;
}
#close-btn{
	width:100%;
}
.reserveFrm{
	float:left;
	width:360px;
	height:500px;
	background-color:lightgray;
	border-left:1px solid lightgray;
}
.content-menu{
	width:100%;
	height:50px;
	overflow:hidden;
	border: 1px solid #25e6b5;
	border-radius:5px;
}
.content-menu>ul>li{
	float:left;
	width:200px;
	height:50px;
	box-sizing:border-box;
	text-align:center;
	line-height:50px;
	font-size:20px;
}
.content-menu>ul>li:first-child{
	border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}
.content-menu>ul>li:last-child{
	border-top-right-radius:5px;
	border-bottom-right-radius:5px;
}
.content-menu>ul>li:hover{
	cursor:pointer;
	background-color:#25e6b5;
	color:white;
}
.content-menu-click{
	background-color:#25e6b5;
	color:white;
}
.review-section{
	margin-top:20px;
	width:100%;
	overflow:hidden;
}
.review-section>h2{
	text-align:center;
	line-height:30px;
}
.review-content tr:first-child>td:nth-child(3){
    text-align: center;
}
.review-content{
	width:100%;
}
.review-content tr>td:first-child{
    width: 10%;
    text-align: center;
}
.review-content tr>td:nth-child(2){
    width:20%;
    text-align: center;
}
.review-content tr>td:nth-child(3){
    width:60%;
}
.review-content tr>td:nth-child(4){
    width:10%;
    text-align: center;
    font-size: 15px;
}
.review-content tr>td{
    border: 1px solid lightgray;
    padding:10px;
}
.review-page{
	margin-top:10px;
}
#rPaging{
	fonr-size:15px;
}
.curr{
	background-color:#25e6b5;
}
#rPaging:hover{
	cursor:pointer;
}
.review-page-con{
	width:250px;
	overflow:hidden;
	margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<section>
		<!-- 여기서부터 작성하시면 됨!!!!!!! -->
		<div class="section-top">
			<div class="itemInfo">
				<input type="hidden" id="beginDate" value="${tv.beginDate }">
				<input type="hidden" id="endDate" value="${tv.endDate }">
				<input type="hidden" id="itemNo" value="${tv.itemNo }">
				<input type="hidden" id="maxPerson" value="${tv.maxPerson }">
				<table>
					<tr>
						<td>${tv.regionCountry }/${tv.regionCity }</td>
					</tr>
					<tr>
						<td id="itemTitle" colspan="4">${tv.itemTitle }</td>
					</tr>
					<tr id="itemPrice">
						<td colspan="1">가격</td>
						<td colspan="3">1인 ${tv.itemPrice }원</td>
						<td>
							<table>
								<tr>
									<td>담당</td>
									<td><span>${tv.memberName }</span><button type="button" class="btn btn-outline-info" id="ask-msg">쪽지문의</button></td>
								</tr>
								<tr>
									<td>TEL</td>
									<td>${tv.phone }</td>
								</tr>
								<tr>
									<td>EMAIL</td>
									<td>${tv.email }</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="item-section">
				<div class="content-menu">
					<ul>
						<li class="content-menu-click">상세내용</li>
						<li>후기</li>
					</ul>
				</div>
				<div class="itemContent item-height">
					${tv.itemContent }
				</div>
				<div class="morebtn">
	       			<button type="button" class="btn btn-outline-info openbtn">▼</button>
	        	</div>
        	</div>
        	<div class="review-section">
        		<div class="content-menu">
					<ul>
						<li>상세내용</li>
						<li class="content-menu-click">후기</li>
					</ul>
				</div>
				<table class="review-content">
					<tr>
						<td>작성자</td>
						<td>점수</td>
						<td>내용</td>
						<td>작성날짜</td>
					</tr>
				</table>
				<div class="review-page">
					<div class="review-page-con"></div>
				</div>
        	</div>
		</div>
		<div class="reserveFrm">
			<form>
				<h2>예약하기</h2>
				<div class="date">
					<input readonly name="tourDate" type="hidden" data-language="en" class="datepicker-here" style="display:hidden;"/>
				</div>
				<div class="time">
					<select name="tourTime">
						<option value="선택">예약 시간 선택</option>
						<c:forEach items="${tarr }" var="t">
							<option value=${t }>${t }시[${tv.maxPerson}]</option>
						</c:forEach>
					</select>
				</div>
				<div class="person">
					<p>예약 인원</p>
					<input type="number" name="personCount" min="1" value="1" style="text-align:right;">명
				</div>
			</form>
		</div>
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
	<!-- <script src="/src/js/header/nice-select.min.js"></script> -->
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
			var beginDate = $("#beginDate").val();
			var endDate = $("#endDate").val();
			
			var yyyy = beginDate.substr(0,4);
		    var mm = beginDate.substr(5,2);
		    var dd = beginDate.substr(8,2);                        
			beginDate = new Date(yyyy, mm-1, dd);
			if(beginDate<=new Date()){
				beginDate = new Date();
				beginDate.setDate(beginDate.getDate()+1);
			}
			
			var yyyy = endDate.substr(0,4);
		    var mm = endDate.substr(5,2);
		    var dd = endDate.substr(8,2);
		    endDate = new Date(yyyy, mm-1, dd);
		    
			var btnval = "down";
			$('[data-toggle="popover"]').popover();
			
			$(".itemContent>img").removeAttr("style");
			
			$(".openbtn").click(function(){
				$(".itemContent").slideToggle();
				if(btnval=="down"){
					$(this).html("▲");
					btnval="up";
				}else if(btnval=="up"){
					$(this).html("▼");
					btnval="down";
				}
				
			});
			
			$(".content-menu>ul>li").click(function(){
				var val = $(this).html();
				if(val=='상세내용'){
					$('html, body').animate({scrollTop : $("body").offset().top}, 400);
				}else if(val=="후기"){
					$('html, body').animate({scrollTop : $(".review-section").offset().top}, 400);
				}
			});
			
			$('input[name=tourDate]').datepicker({
			    language: 'en',
			    minDate:beginDate,
			    maxDate:endDate
			})
			
			$(".date").click(function(){
				$("option").each(function(index,item){
					$(item).html(data[i].tourTime+"시["+$("#maxPerson").val()+"]");
				});
				var tourDate = $("input[name=tourDate]").val();
				var itemNo = $("#itemNo").val();
				var param = {tourDate:tourDate,itemNo:itemNo};
				$.ajax({
					url:"/checkTourTimes.do",
					data:param,
					type:"post",
					dataType:"json",
					success:function(data){
						for(var i=0; i<data.length; i++){
							$("option").each(function(index,item){
								if(data[i].tourTime==$(item).val()){
									var cur = $("#maxPerson").val()-data[i].personCount;
									$(item).html(data[i].tourTime+"시["+cur+"]");
								}
							});
						}
					},
					error:function(){
						console.log("예약시간정보를 불러올 수 없음");
					}
				});
			})
			
			$(".itemContent").hide();
			
			moreReview(1);
		});
		
		function moreReview(reqPage){
			var itemNo = $("#itemNo").val();
			var param = {reqPage:reqPage,itemNo:itemNo};
			$.ajax({
				url:"/moreReview.do",
				data:param,
				type:"post",
				dataType:"json",
				success:function(data){
					var reviewList = data.reviewList;
					var html = "";
					html+="<tr><td>작성자</td><td>점수</td><td>내용</td><td>작성날짜</td></tr>";
					for(var i=0; i<reviewList.length; i++){
						html+="<tr><td>"+reviewList[i].memberNickname+"</td>";
						html+="<td>"+reviewList[i].reviewRate+"</td>";
						html+="<td>"+reviewList[i].reviewContent+"</td>";
						html+="<td>"+reviewList[i].reviewDate+"</td></tr>";
					}
					$(".review-content").html(html);
					$(".review-page-con").html(data.pageNavi);
				},
				error:function(){
					console.log("후기를 불러오지 못했습니다");
				}
			});
		};

		$("#datepicker").datepicker({
			iconsLibrary : "fontawesome",
			icons : {
				rightIcon : "_$tag___________________________$tag__",
			},
		});
	</script>
	<!-- datepicker -->
	<link href="/src/dist/css/datepicker.min.css" rel="stylesheet"
		type="text/css">
	<script src="/src/dist/js/datepicker.min.js"></script>
	<script src="/src/dist/js/i18n/datepicker.en.js"></script>
</body>
</html>
