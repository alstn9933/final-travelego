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
	    .section-title{
	    	border-bottom:1px solid black;
	    }
    	table{
    		width:100%;
            table-layout:fixed;
    	}
    	table td{
    		height:20px;
    		border:1px solid gray;
    		text-align:center;
    		box-sizing:border-box;
    		overflow:hidden;
            text-overflow: ellipsis;
            overflow: hidden;
    	}
    	#title{
    		width:100%;
    		height:5px;
    		
    	}
    	table tr>td:nth-child(1) {
			width:5%;
		}
		table tr>td:nth-child(2) {
			width:18%;
		}
		table tr>td:nth-child(3) {
			width:9%;
		}
		table tr>td:nth-child(4) {
			width:12%;
		}
		table tr>td:nth-child(5) {
			width:12%;
		}
		table tr>td:nth-child(6) {
			width:8%;
		}
		table tr>td:nth-child(7) {
			width:8%;
		}
		table tr>td:nth-child(8) {
			width:10%;
		}
		table tr>td:nth-child(9) {
			width:10%;
		}
		table tr>td:nth-child(10) {
			width:8%;
		}
		.section-top tr:first-child>td{
			border-bottom:none;
		}
		.section-top tr:last-child>td{
			border-top :none;
		}
		select[name=itemNo]{
			width:100%;
		}
		td>input{
			width:100%;
		}
    </style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <!-- 여기서부터 작성하시면 됨!!!!!!! -->
		<h1 class="section-title">Manage Reservation</h1>
		<table class="section-top">
			<tr>
				<td>NO</td>
				<td>상품명</td>
				<td>예약자</td>
				<td>예약자 번호</td>
				<td>예약날짜</td>
				<td>예약시간</td>
				<td>예약인원</td>
				<td>결제일</td>
				<td>결제금액</td>
				<td>상태</td>
			</tr>
			<tr>
				<td><button type="button" class="btn btn-info btn-sm">전체</button></td>
				<td>
					<select name="itemNo">
						<option value="0">전체보기</option>
						<c:forEach items="${tList }" var="t">
							<option value="${t.itemNo }">${t.itemTitle }</option>
						</c:forEach>
					</select>
				</td>
				<td><input type="text" name="memberName" placeholder="이름입력"></td>
				<td><input type="text" name="phone" placeholder="번호입력"></td>
				<td><input type="date" name="tourDate" placeholder="날짜선택"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>12312</td>
				<td><span id="title">asdfasdfaskjhasdfgasdfasdfasdfaasdfasdfasdfasdfasdfsdfasdfasdfghasdfasfsf</span></td>
				<td>김김김김김</td>
				<td>01022222222</td>
				<td>2020-05-05</td>
				<td>20시</td>
				<td>20명</td>
				<td>2020-12-12</td>
				<td>50000000원</td>
				<td>취소</td>
			</tr>
		</table>
		<table id="reserveList">
		</table>
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
    $(function () {
		$('[data-toggle="popover"]').popover();
		
		$("select[name=itemNo]").change(function(){
			changeList();
		});
		
		$("input[name=memberName]").keyup(function(){
			changeList();
		});
		
		$("input[name=phone]").keyup(function(){
			changeList();
		});
		
		$("input[name=tourDate]").change(function(){
			changeList();
		})
		
		changeList();
    });
    
    function changeList(){
    	var itemNo = $("select[name=itemNo]").val();
    	var memberName = $("input[name=memberName]").val();
    	var phone = $("input[name=phone]").val();
    	var tourDate = $("input[name=tourDate]").val();
    	var param = {itemNo:itemNo, memberName:memberName, phone:phone, tourDate:tourDate};
    	
    	$.ajax({
    		url:"/changeList.do",
    		data:param,
    		type:"post",
    		dataType:"json",
    		success:function(data){
    			console.log(data.length);
    		},
    		error:function(){
    			console.log("리스트 불러오기 실패");
    		}
    	});
    }

     $("#datepicker").datepicker({
	     iconsLibrary: "fontawesome",
	     icons: {
	       rightIcon: "_$tag___________________________$tag__",
	     },
     });
    </script>
  </body>
</html>
