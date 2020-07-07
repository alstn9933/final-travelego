<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
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
    <link
      rel="shortcut icon"
      type="image/x-icon"
      href="/src/imgs/header/favicon.png"
    />
    <!-- Place favicon.ico in the root directory -->
    <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
    <!-- CSS here -->
    <link rel="stylesheet" href="/src/css/header/header.css" />
    <link rel="stylesheet" href="/src/css/footer/footer.css" />
    <link rel="stylesheet" href="/src/css/main/web_default.css" />
    <title>Travelego</title>
    <style>
	    .section-top{
	    	width:100%;
	    	height:100px;
	    	background-color:#25e6b5;
	    }
	    .section-top>h1{
	    	line-height:100px;
	    	text-align:center;
	    }
    	.infoSection{
    		width:800px;
    		overeflow:hidden;
    		margin: 0 auto;
    		border-right:2px solid #25e6b5;
    		border-left:2px solid #25e6b5;
    		padding:30px;
    	}
    	.infoTable tr>td{
    		height:50px;
    		font-size:30px;
    		line-height:50px;
    		border-bottom:1px solid lightgray;
    	}
    	.infoTable tr>td:first-child{
    		width:200px;
    		color:red;
    	}
    	.infoTable tr>td:last-child{
    		width:500px;
    	}
    	.infoTable a{
    		text-decoration: underline;
    		color:#25e6b5;
    	}
    	.section-bottom{
    		width:500px;
    		margin: 0 auto;
    		overflow:hidden;
    		margin-top:20px;
    	}
    	.section-bottom>a{
    		width:200px;
    		height:50px;
    		line-height:40px;
    		font-size:20px;
    		margin:20px;
    		box-sizing:border-box;
    	}
    </style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
    	<!-- 여기서부터 작성하시면 됨!!!!!!! -->
		<div class="section-top">
			<h1>---예약 완료---</h1>
		</div>
		<div class="infoSection">
			<table class="infoTable">
				<tr>
					<td>상품명</td>
					<td><a href="/tourView.do?itemNo=${info.itemNo }">${info.itemTitle }</a></td>
				</tr>
				<tr>
					<td>예약자</td>
					<td>${info.memberName }</td>
				</tr>
				<tr>
					<td>투어 날짜</td>
					<td>${info.tourDate }</td>
				</tr>
				<tr>
					<td>시작 시간</td>
					<td>${info.tourTime }시</td>
				</tr>
				<tr>
					<td>예약 인원</td>
					<td>${info.personCount }명</td>
				</tr>
				<tr>
					<td>결제 시간</td>
					<td>${info.payDate }</td>
				</tr>
				<tr>
					<td>결제 금액</td>
					<td>${info.totalPay }원</td>
				</tr>
			</table>
		</div>
		<div class="section-bottom">
			<a class="btn btn-outline-danger" href="/">HOME</a>
			<a class="btn btn-outline-danger" href="/myReservation.do">My Reservation</a>
		</div>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- Modal -->
    <div
      class="modal fade custom_search_pop"
      id="exampleModalCenter"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalCenterTitle"
      aria-hidden="true"
    >
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
      $(function () {
        $('[data-toggle="popover"]').popover();
        
        console.log(${info});
      });

      $("#datepicker").datepicker({
        iconsLibrary: "fontawesome",
        icons: {
          rightIcon: "_$tag___________________________$tag__",
        },
      });
    </script>
  </body>
</html>
