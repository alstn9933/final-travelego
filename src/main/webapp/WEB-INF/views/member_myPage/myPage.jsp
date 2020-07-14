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
    <title>마이페이지</title>
    <style>
    	a{
            text-decoration: none;
            float: left;
            color: black;
        }
        table{
            width: 80%;
            margin: 0 auto;
        }
        th{
            border-bottom: 2px solid lightgray;
            line-height: 50px;
            height: 50px;
            font-size: 20px;
            padding-top: 30px;
        }
        #user{
            font-size: 40px;
        }
    </style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <!-- 여기서부터 작성하시면 됨!!!!!!! -->
      <div style="width:80%; margin:0 auto;">
      <div style="font-size:30px; font-weight: bold; margin-bottom:20px;">${sessionScope.member.memberNickname }</div>
    <br>
    <div>
        <div>${sessionScope.member.memberNickname }</div>
    </div>
    </div>
    <table>
    	<c:if test="${sessionScope.member.memberLevel eq 1 }">
        <tr>
            <th><a href="/mytripFrm.do">&nbsp;&nbsp;내 일정</a></th>
        </tr>
        <tr>
            <th><a href="/boardList.do?board=0&reqPage=1">&nbsp;&nbsp;내가 쓴 게시글</a></th>
        </tr>
        <tr>
            <th><a href="/myReservation.do">&nbsp;&nbsp;내 예약</a></th>
        </tr>
        <tr>
            <th><a href="/bookmark.do?board=0&reqPage=1">&nbsp;&nbsp;북마크</a></th>
        </tr>
        <tr>
            <th><a href="/qna.do">&nbsp;&nbsp;1:1 문의</a></th>
        </tr>
        <tr>
            <th><a href="/qnaList.do?reqPage=1&qnaWriter=${sessionScope.member.memberId }">&nbsp;&nbsp;1:1 문의 내역</a></th>
        </tr>
        </c:if>
        <c:if test="${sessionScope.member.memberLevel eq 2 }">
        <tr>
            <th><a href="/comTourList.do">&nbsp;&nbsp;상품 관리</a></th>
        </tr>
        <tr>
            <th><a href="/comReserveList.do">&nbsp;&nbsp;예약 관리</a></th>
        </tr>
        </c:if>
        <tr>
            <th><a href="/membercheckFrm.do">&nbsp;&nbsp;정보 변경</a></th>
        </tr>
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
