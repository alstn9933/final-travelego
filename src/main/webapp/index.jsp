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
<!-- 캐러셀 부트스트랩 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="/src/imgs/header/favicon.png" />
<!-- Place favicon.ico in the root directory -->
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
<!-- font style -->
<link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
<!-- CSS here -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<link rel="stylesheet" href="/src/css/main/index.css" />
<title>Travelego</title>
<style>
	.hotItem:hover{
		cursor: pointer;
		box-shadow: 3px 3px 5px lightgray;
	}
	.hotpickcher:hover{
		cursor: pointer;
		box-shadow: 3px 3px 5px lightgray;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<section>
		<div class="mainNoticetitle">
				<div class="div1"></div>
				<div class="div2"></div>
			</div>
		<div class="addDiv">
			
			<div class="container mt-3">
				<div id="myCarousel" class="carousel slide">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li class="item1 active"></li>
						<li class="item2"></li>
						<li class="item3"></li>
					</ul>

					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/src/imgs/main/addtest6.jpg"  width="100%" height="400px">
						</div>
						<div class="carousel-item">
							<img src="/src/imgs/main/addtest4.jpg"  width="100%" height="400px">
						</div>
						<div class="carousel-item">
							<img src="/src/imgs/main/addtest5.jpg"  width="100%" height="400px">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev"> <span
						class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next"> <span
						class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
		</div>
		
		<div class="main-content1">
			<p class="p1">Hot Pick Travel</p>
			<div  class="sub-content1"id="sub-content1">
			</div>
			<br><br>
			<div class="sub-content2"><a href="/recommendList.do">게시물 보러가기</a></div>
		</div>
		
		<br>
		<div class="main-content3">
			<p class="p1">Tour</p>
		<div class="sub-content5" id="sub-content5"></div>
		<div class="sub-content6"><a href="/tourList.do">투어 상품 보러가기</a></div>
		
		</div>
		<br>

</section>
<!-- 헤더 밑 공지사항 -->
<script>
	$(function(){
		$.ajax({
			url : "/mainNoticeBox.do",
			type : "json",
			success : function(data) {
				 html1 = "";
				 html2 ="";
				if(data !=null){
				for(i=0;i<data.length;i++){
				html1 = "<div class='noticetitlebox1'>[최신공지사항] "+data[i].noticeTitle+"</div>";
				html2 =data[i].strNoticeDate+"<a href='noticeView.do?noticeNo="+data[i].noticeNo+"'>[확인하기]</a>";
				$(".div1").html(html1);
				$(".div2").html(html2);
				}
				}else{
				$(".noticeBox").hide();	
				}
				
			}
		});
	});
</script>

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
	<!--  <script src="/src/js/header/waypoints.min.js"></script>-->
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
	//캐러셀
	$(document).ready(function(){
		  // Activate Carousel
		  $("#myCarousel").carousel();
		    
		  // Enable Carousel Indicators
		  $(".item1").click(function(){
		    $("#myCarousel").carousel(0);
		  });
		  $(".item2").click(function(){
		    $("#myCarousel").carousel(1);
		  });
		  $(".item3").click(function(){
		    $("#myCarousel").carousel(2);
		  });
		    
		  // Enable Carousel Controls
		  $(".carousel-control-prev").click(function(){
		    $("#myCarousel").carousel("prev");
		  });
		  $(".carousel-control-next").click(function(){
		    $("#myCarousel").carousel("next");
		  });
		});
	//추천게시판
	//현제 사진이 있는 게시판만 출력 , 출력 변경시 mapper 변경.
	$(function(){
		$.ajax({
			url : "/mainRecommendList.do",
			dataType:"json",
			success : function(data) {
				console.log(data);
				html = "";
				for(var i=0;i<data.length;i++){
					html += "<div class="+"hotpickcher"+" onclick='recommendView("+data[i].recNo+");'>";
					if(data[i].filepath == null){
						html += "<div class="+"imgsDiv"+"><img class="+"recommendimg"+" src="+"src/imgs/header/"+"rogo2.png"+"></img></div>";
					}else{
					html += "<div class="+"imgsDiv"+"><img class="+"recommendimg"+" src="+data[i].filepath+"></img></div>";						
					}
					html += "<a href="+"/recDetail.do?recNo="+data[i].recNo+"><div><div class='Stringdelete'>"+data[i].recTitle+"</div></div></a>";
					if(data[i].recWriter==null){
					html += "<div class='writerDiv'><span id='sid'>탈퇴회원</span><br><div class='readDiv'><i class='fas fa-book-reader'></i>"+data[i].readCount+"</div></div></div>";
					}else{						
					html += "<div class='writerDiv'><span id='sid'>"+data[i].recWriter+"</span><br><div class='readDiv'><i class='fas fa-book-reader'></i>"+data[i].readCount+"</div></div></div>";
					}
				}
				$("#sub-content1").append(html);
			},
			error : function(){
				console.log("추천게시판 출력에러");
			}
		});
	});
	
	function recommendView(recNo){
		location.href="/recDetail.do?reqPage=1&recNo="+recNo;
	}

	//trip 게시판
	$(function(){
		$.ajax({
			url : "/maintourList.do",
			dataType:"json",
			success : function(data) {
				html = "";	
				for(var i=0;i<data.length;i++){
					html += "<div class="+"hotItem"+" onclick='itemView("+data[i].itemNo+");'><div class="+"itemimgsDiv"+">";
					html += "<img class="+"tourimg"+" src="+"/upload/images/tour/thumnail/"+data[i].filepath+"></img></div>";
					html += "<div class='itemDate'><div class='itrmp3'>"+data[i].itemTitle+"</div></div>";
					html += "<div class='itemDate2'><span id='sitem'><i class='fas fa-won-sign'></i>"+data[i].itemPrice+"</span><br>";
					html += "<span id="+"itemscore"+"><i class='far fa-star'></i>"+data[i].score+"</span></div></div>";
			
				//"+data[i].beginDate+"~"+data[i].endDate+"
				}
				$("#sub-content5").append(html);
			},
			error : function(){
				console.log("투어티켓 게시판 출력에러");
			}
		});
	});
	
	function itemView(itemNo){
			location.href="/tourView.do?itemNo="+itemNo;
	};
	/*
		$(function() {
			$('[data-toggle="popover"]').popover();
		});

		$("#datepicker").datepicker({
			iconsLibrary : "fontawesome",
			icons : {
				rightIcon : "_$tag___________________________$tag__",
			},
		});
		*/
	</script>
</body>
</html>
