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
      section {
        overflow: hidden;
        width: 1200px;
        margin: 0 auto;
      }

      .section-top > div {
        float: left;
      }

      .section-top {
        border-bottom: 2px solid gray;
        overflow: hidden;
      }

      .itemInfo {
        width: 100%;
      }
      .itemInfo > table {
        width: 100%;
      }
      #itemTitle {
        width: 70%;
        font-size: 30px;
        border-bottom: 1px solid lightgray;
      }
      #itemPrice > td {
        height: 100px;
        font-size: 30px;
        line-height: 100px;
      }
      #itemPrice > td:last-child {
        font-size: 15px;
      }
      #itemPrice > td:last-child > table td {
        width: 50%;
        height: 40px;
        line-height: 40px;
      }
      #askmsg {
        text-decoration: underline;
        color: blue;
      }
      .content {
        width: 70%;
        float: left;
        overflow: hidden;
      }
      .itemContent {
        width: 100%;
        overflow: hidden;
      }
      .itemContent > img {
        width: 100%;
        height: auto;
      }
      .morebtn > button {
        width: 100%;
      }
      #close-btn {
        width: 100%;
      }
      .content-menu {
        width: 840px;
        height: 50px;
        overflow: hidden;
        border: 1px solid #25e6b5;
        border-radius: 5px;
        background:white;
      }
      .content-menu > ul > li {
        float: left;
        width: 200px;
        height: 50px;
        box-sizing: border-box;
        text-align: center;
        line-height: 50px;
        font-size: 20px;
      }
      .content-menu > ul > li:first-child {
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
      }
      .content-menu > ul > li:last-child {
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
      }
      .content-menu > ul > li:hover {
        cursor: pointer;
        background-color: #25e6b5;
        color: white;
      }
      .content-menu-click {
        background-color: #25e6b5;
        color: white;
      }
      .content-menu-fix1{
      	position: fixed;
      	top:150px;
      	z-index: 50;
      }
      .content-menu-fix2{
      	position: fixed;
      	top:110px;
      	z-index: 50;
      }
      .content-menu-fix3{
      	position: fixed;
      	top:140px;
      	z-index: 50;
      }
      .review-section {
        margin-top: 20px;
        width: 100%;
        overflow: hidden;
        margin-bottom:500px;
      }
      .review-section > h2 {
        text-align: center;
        line-height: 30px;
      }
      .review-content tr:first-child > td:nth-child(3) {
        text-align: center;
      }
      .review-content {
        width: 100%;
      }
      .review-content tr > td:first-child {
        width: 10%;
        text-align: center;
      }
      .review-content tr > td:nth-child(2) {
        width: 20%;
        text-align: center;
      }
      .review-content tr > td:nth-child(3) {
        width: 60%;
      }
      .review-content tr > td:nth-child(4) {
        width: 10%;
        text-align: center;
        font-size: 15px;
      }
      .review-content tr > td {
        border: 1px solid lightgray;
        padding: 10px;
      }
      .review-page {
        margin-top: 10px;
      }
      #rPaging:hover {
        cursor: pointer;
      }
      .review-page-con {
        width: 250px;
        overflow: hidden;
        margin: 0 auto;
      }
      .time {
        width: 100%;
      }
      select[name="tourTime"] {
        width: 100%;
        height: 30px;
      }
      input[name="personCount"] {
        width: 100px;
        height: 30px;
      }
      .reserveFrm {
        float: right;
        width: 260px;
        background-color: lightgray;
        border-left: 1px solid lightgray;
        position: relative;
        z-index: 1;
        overflow: hidden;
      }
      .plzlogin {
        width: 100%;
        height: 100%;
        background-color: black;
        opacity: 0.7;
        position: absolute;
        top: 0;
        left: 0;
        z-index: 3;
      }
      .plzlogin > h2 {
        color: white;
        text-align: center;
        opacity: 0.7;
      }
      .plzlogin > h2:first-child {
        margin-top: 150px;
      }
      .totalPay {
        margin-top: 30px;
        font-size: 25px;
      }
      .totalPay > input[name="totalPay"] {
        border: none;
        text-align: right;
        background-color: rgba(255, 255, 255, 0);
        width: 200px;
        font-size: 30px;
      }
      #itemPrice > td:last-child {
        border-top: 1px solid lightgray;
      }
      #confirm{
      	margin:20px;
      	margin-left:35%;
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
          <input type="hidden" id="beginDate" value="${tv.beginDate }" />
          <input type="hidden" id="endDate" value="${tv.endDate }" />
          <input type="hidden" id="maxPerson" value="${tv.maxPerson }" />
          <input type="hidden" id="tourTimes" value="${tv.tourTimes }" />
          <input type="hidden" id="price" value="${tv.itemPrice }" />
          <table>
            <tr>
              <td>${tv.regionCountry }/${tv.regionCity }</td>
            </tr>
            <tr>
              <td id="itemTitle" colspan="4">${tv.itemTitle }</td>
            </tr>
            <tr id="itemPrice">
              <td colspan="1">가격</td>
              <td colspan="3">${tv.itemPrice }원~</td>
              <td>
                <table>
                  <tr>
                    <td>담당</td>
                    <td>
                      <a id="askmsg" href="javascript:sendMessageById('${tv.memberId }')">${tv.memberName }</a>
                    </td>
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
	      <div class="content-menu con1">
		      <ul>
		        <li class="content-menu-click">상세내용</li>
		        <li>후기</li>
		      </ul>
	      </div>
        <div class="item-section">
          <div class="itemContent item-height">
            ${tv.itemContent }
          </div>
          <div class="morebtn">
            <button type="button" class="btn btn-outline-info openbtn">
              ▲
            </button>
          </div>
        </div>
        <div class="review-section">
          <h3>상품 후기</h3>
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
        <c:if test="${sessionScope.member.memberLevel ne 1}">
          <div class="plzlogin">
            <h2>개인회원</h2>
            <h2>로그인</h2>
            <h2>필요</h2>
          </div>
        </c:if>
        <c:if test="${sessionScope.member.memberLevel eq 1}">
          <c:if test="${tv.closeCheck!=0}">
            <div class="plzlogin">
              <h2>마감된</h2>
              <h2>상품입니다</h2>
            </div>
          </c:if>
        </c:if>
        <form action="/reserveTour.do" method="post">
          <input
            type="hidden"
            id="itemNo"
            name="itemNo"
            value="${tv.itemNo }"
          />
          <div class="date">
            <p>예약날짜</p>
            <input
              readonly
              name="tourDate"
              type="hidden"
              data-language="en"
              class="datepicker-here"
              style="display: hidden;"
            />
          </div>
          <div class="time">
            <p>예약시간</p>
            <select name="tourTime"></select>
          </div>
          <div class="person">
            <p>예약 인원</p>
            <input
              type="number"
              name="personCount"
              min="1"
              value="1"
              style="text-align: right;"
            />명
          </div>
          <div class="totalPay">
            <h3>총 결제 금액</h3>
            <input type="text" name="totalPay" readonly />원
          </div>
          <button class="btn btn-primary btn-sm" type="button" id="confirm">예약하기</button>
          <!-- <input type="submit" value="예약하기"> -->
        </form>
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
        var beginDate = $("#beginDate").val();
        var endDate = $("#endDate").val();
        var yyyy = beginDate.substr(0, 4);
        var mm = beginDate.substr(5, 2);
        var dd = beginDate.substr(8, 2);
        beginDate = new Date(yyyy, mm - 1, dd);
        if (beginDate <= new Date()) {
          beginDate = new Date();
          beginDate.setDate(beginDate.getDate() + 1);
        }
        yyyy = endDate.substr(0, 4);
        mm = endDate.substr(5, 2);
        dd = endDate.substr(8, 2);
        endDate = new Date(yyyy, mm - 1, dd);

        var btnval = "up";
        $('[data-toggle="popover"]').popover();

        $(".itemContent>img").removeAttr("style");

        $(".openbtn").click(function () {
          $(".itemContent").slideToggle();
          if (btnval == "down") {
            $(this).html("▲");
            btnval = "up";
          } else if (btnval == "up") {
            $(this).html("▼");
            btnval = "down";
          }
        });

        $(".content-menu>ul>li").click(function () {
        	var val = $(this).html();
          if (val == "상세내용") {
        	  var itemContentTop = $(".itemContent").offset().top;
              itemContentTop-=200;
            $("html, body").animate({ scrollTop: itemContentTop }, 400);
          } else if (val == "후기") {
        	  var reviewSectionTop = $(".review-section").offset().top;
          	  reviewSectionTop-=200;
          	$("html, body").animate({ scrollTop: reviewSectionTop },400);
          }
        });
        
        $(window).scroll(function () {
        	if($(document).scrollTop()>250){
        		if($(window).width() >1500){
           			$(".con1").removeClass("content-menu-fix1");
           			$(".con1").removeClass("content-menu-fix2");
           			if(!$(".con1").hasClass("content-menu-fix3")) {
               			$(".con1").addClass("content-menu-fix3");
               		}
            	}else{
            		if($(document).scrollTop()>400){
            			$(".con1").removeClass("content-menu-fix1");
            			$(".con1").removeClass("content-menu-fix3");
            			if(!$(".con1").hasClass("content-menu-fix2")) {
                			$(".con1").addClass("content-menu-fix2");
                		}
            		}else{
            			$(".con1").removeClass("content-menu-fix3");
            			$(".con1").removeClass("content-menu-fix2");
            			if(!$(".con1").hasClass("content-menu-fix1")) {
                			$(".con1").addClass("content-menu-fix1");
                		}
            		}
            	}
        		var reviewSectionTop = $(".review-section").offset().top;
        		$(".content").css("margin-top","50px");
        		if($(document).scrollTop()>=reviewSectionTop-220){
        			$(".con1").find("li").eq(0).removeClass("content-menu-click");
        			$(".con1").find("li").eq(1).addClass("content-menu-click");
        		}else{
        			$(".con1").find("li").eq(0).addClass("content-menu-click");
        			$(".con1").find("li").eq(1).removeClass("content-menu-click");
        		}
        	}else{
        		$(".content").css("margin-top","0");
        		$(".con1").removeClass("content-menu-fix1");
        		$(".con1").removeClass("content-menu-fix2");
        		$(".con1").removeClass("content-menu-fix3");
        	}
        });
        
        $(window).resize(function(){
        	$(window).scroll();
        });

        $("input[name=tourDate]").datepicker({
          language: "en",
          minDate: beginDate,
          maxDate: endDate,
        });

        $(".date").click(function () {
          var tourDate = $("input[name=tourDate]").val();
          var itemNo = $("#itemNo").val();
          var tourTimes = $("#tourTimes").val();
          var maxPerson = $("#maxPerson").val();
          if (tourDate == "" || tourDate == null) {
            $("select[name=tourTime]").html("");
          } else {
            var param = {
              tourDate: tourDate,
              itemNo: itemNo,
              tourTimes: tourTimes,
              maxPerson: maxPerson,
            };
            $.ajax({
              url: "/checkTourTimes.do",
              data: param,
              type: "post",
              dataType: "json",
              success: function (data) {
                var html = "";
                html += "<option value='false'>시간선택</option>";
                for (var i = 0; i < data.length; i++) {
                  if (data[i].personCount <= 0) {
                    html +=
                      "<option value=" +
                      data[i].tourTime +
                      " person=" +
                      data[i].personCount +
                      " disabled>";
                    html +=
                      data[i].tourTime +
                      "시 - [남은티켓" +
                      data[i].personCount +
                      "명]</option>";
                  } else {
                    html +=
                      "<option value=" +
                      data[i].tourTime +
                      " person=" +
                      data[i].personCount +
                      ">";
                    html +=
                      data[i].tourTime +
                      "시 - [남은티켓" +
                      data[i].personCount +
                      "명]</option>";
                  }
                }
                $("select[name=tourTime]").html(html);
              },
              error: function () {
                console.log("예약시간정보를 불러올 수 없음");
              },
            });
          }
        });

        $("select[name=tourTime]").change(function () {
          var maxperson;
          $("select[name=tourTime]>option").each(function (index, item) {
            if ($(item).prop("selected")) {
              if ($(item).attr("value") != "false") {
                maxperson = $(item).attr("person");
                $("input[name=personCount]").attr("max", maxperson);
                if ($("input[name=personCount]").val() > maxperson) {
                  $("input[name=personCount]").val(maxperson);
                }
              }
            }
          });
        });

        $("input[name=personCount]").change(function () {
          var count = $(this).val();
          var price = $("#price").val();
          $("input[name=totalPay]").val(count * price);
        });

        $("#confirm").click(function () {
          var itemNo = $("#itemNo").val();
          var tourDate = $("input[name=tourDate]").val();
          var tourTime = $("select[name=tourTime]").val();
          var personCount = $("input[name=personCount]").val();

          if (tourDate == "" || tourDate == null) {
            alert("예약 날짜를 선택해주세요");
            return false;
          }
          if (tourTime == "false") {
            alert("예약 시간을 선택해주세요");
            return false;
          }
          var pcheck = 0;
          $("select[name=tourTime]>option").each(function (index, item) {
            if ($(item).prop("selected")) {
              var pcnt = Number(personCount);
              var p = Number($(item).attr("person"));
              if (pcnt > p) {
                pcheck = 1;
              }
            }
          });
          if (pcheck == 1) {
            alert("예약 인원을 다시 선택해주세요");
            return false;
          }

          var result = 0;
          if (confirm("예약하시겠습니까")) {
            //예약테이블에서 조회
            //만족하면 미리 예약테이블에 넣는다 ajax이용
            var maxPerson = $("#maxPerson").val();
            var param = {
              itemNo: itemNo,
              tourDate: tourDate,
              tourTime: tourTime,
              personCount: personCount,
              maxPerson: maxPerson,
            };
            $.ajax({
              url: "/checkAndInsert.do",
              data: param,
              type: "post",
              dataType: "json",
              success: function (data) {
                if (data == -1) {
                  alert("예약실패 - 남은 자리가 예약인원보다 부족합니다");
                  result = 0;
                } else if (data == 0) {
                  alrt("예약실패 - 관리자에게 문의바람");
                  result = 0;
                } else {
                  console.log("예약가능");
                  pay(data);
                }
              },
              error: function () {
                console.log("오류");
                result = 0;
              },
            });
          } else {
            return false;
          }
        });

        $(".itemContent").show();

        moreReview(1);
        $("input[name=personCount]").change();
      });

      function pay(reserveNo) {
        var price = $("input[name=totalPay]").val();
        var d = new Date();
        var date =
          d.getFullYear() +
          "" +
          (d.getMonth() + 1) +
          "" +
          d.getDate() +
          "" +
          d.getHours() +
          "" +
          d.getMinutes() +
          "" +
          d.getSeconds();
        IMP.init("imp75978378");
        IMP.request_pay(
          {
            merchant_uid: $("#itemTitle").html() + date,
            name: "결제테스트",
            amount: 1000,
            buyer_email: "${sessionScope.member.email}",
            buyer_name: "${sessionScope.member.memberName}",
            buyer_tel: "${sessionScope.member.phone}",
          },
          function (rsp) {
            if (rsp.success) {
              //결제 성공했을때
              var msg = "결제가 완료되었습니다";
              var r1 = "고유 Id : " + rsp.imp_uid;
              var r2 = "상점 거래 아이디 : " + rsp.merchant_uid;
              var r3 = "결제 금액 : " + rsp.paid_amount;
              var r4 = "카드 승인 번호 : " + rsp.apply_num;
              modifyPay(reserveNo, price);
            } else {
              //결제 실패했을때
              //ajax이용해서 예약테이블에 정보 삭제
              cancelReserve(reserveNo);
              alert("결제취소");
            }
          }
        );
      }

      function modifyPay(reserveNo, totalPay) {
        $.ajax({
          url: "/modifyPay.do",
          data: { reserveNo: reserveNo, totalPay: totalPay },
          dataType: "json",
          type: "post",
          success: function (data) {
            if (data > 0) {
              console.log("결제정보수정성공");
            } else {
              console.log("결제정보수정실패");
            }
            location.href = "/reserveTour.do?reserveNo=" + reserveNo;
          },
          error: function () {
            console.log("에러");
          },
        });
      }

      function cancelReserve(reserveNo) {
        var result;
        $.ajax({
          url: "/cancelReserve.do",
          data: { reserveNo: reserveNo },
          type: "post",
          dateType: "json",
          success: function (data) {
            if (data == 0) {
              console.log("예약취소실패");
            } else {
              console.log("예약취소성공");
            }
          },
          error: function () {
            console.log("예약취소실패");
          },
        });
      }

      function moreReview(reqPage) {
        var itemNo = $("#itemNo").val();
        var param = { reqPage: reqPage, itemNo: itemNo };
        $.ajax({
          url: "/moreReview.do",
          data: param,
          type: "post",
          dataType: "json",
          success: function (data) {
            var reviewList = data.reviewList;
            var html = "";
            html +=
              "<tr><td>작성자</td><td>점수</td><td>내용</td><td>작성날짜</td></tr>";
            for (var i = 0; i < reviewList.length; i++) {
              html += "<tr><td>" + reviewList[i].memberNickname + "</td>";
              html += "<td>" + reviewList[i].reviewRate + "</td>";
              html += "<td>" + reviewList[i].reviewContent + "</td>";
              html += "<td>" + reviewList[i].reviewDate + "</td></tr>";
            }
            $(".review-content").html(html);
            $(".review-page-con").html(data.pageNavi);
          },
          error: function () {
            console.log("후기를 불러오지 못했습니다");
          },
        });
      }

      $("#datepicker").datepicker({
        iconsLibrary: "fontawesome",
        icons: {
          rightIcon: "_$tag___________________________$tag__",
        },
      });
    </script>
    <!-- datepicker -->
    <link
      href="/src/dist/css/datepicker.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <script src="/src/dist/js/datepicker.min.js"></script>
    <script src="/src/dist/js/i18n/datepicker.en.js"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  </body>
</html>
