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
.content{
	width: 70%;
	float:left;
	overflow: hidden;
	margin-top: 20px;
	border-right:1px solid black;
}
.itemContent {
	width: 100%;
	overflow: hidden;
}
.item-height{
	height:500px;
}
.itemContent>img{
	width:100%;
	height:auto;
}
#more-btn{
	width:100%;
}
.reserveFrm{
	width:30%;
	float:left;
	height:500px;
	barckgroud-color:gray;
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
									<td>${tv.memberName }</td>
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
			<div class="itemContent item-height">
				${tv.itemContent }
			</div>
			<div class="morebtn">
       			<button type="button" class="btn btn-outline-info" id="more-btn">전체보기</button>
        	</div>
        	<div class="review-section">
        		
        	</div>
		</div>
		<div class="reserveFrm">
			<form>
				
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
			$('[data-toggle="popover"]').popover();
			
			$(".itemContent>img").removeAttr("style");
			
			$("#more-btn").click(function(){
				$(".itemContent").removeClass("item-height");
			});
		});

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
