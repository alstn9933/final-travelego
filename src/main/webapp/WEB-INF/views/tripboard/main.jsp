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
    <link rel="stylesheet" href="/src/css/tripboard/board.css" />
    <title>Travelego</title>
    <style></style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <section>
      <div class="board">
        <c:forEach items="${list }" var="b">
          <div
            class="content"
            data-container="body"
            data-toggle="popover"
            data-placement="bottom"
            data-content="${b.tripBoardTitle}"
            boardNum="${b.tripBoardNo}"
          >
            <a href="/tripboard/view.do?tripBoardNo=${b.tripBoardNo}">
              <c:if test="${not empty b.filepath}">
                <img src="${b.filepath}" alt="" />
              </c:if>
              <c:if test="${empty b.filepath}">
                <img src="/src/imgs/header/rogo2.png" alt="" />
              </c:if>
            </a>

            <i
              class="fas fa-ellipsis-v moreIcon"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              <div class="dropdown-menu">
                <a class="dropdown-item" href="javascript:void(0)">북마크</a>
                <a class="dropdown-item" href="javascript:void(0)"
                  >게시글 신고</a
                >
              </div>
            </i>
            <a href="/tripboard/view.do?tripBoardNo=${b.tripBoardNo}">
              <div>
                <span>${b.regionName}</span>
                <div>
                  <i class="far fa-thumbs-up"></i>
                  <span>${b.likeCount}</span>
                </div>
              </div>
            </a>
          </div>
        </c:forEach>
      </div>
      <nav class="page_nav" aria-label="Page navigation">
        ${pageNavi}
      </nav>
      <div class="form-group">
        <div></div>
        <form action="/tripboard/search.do" id="searchForm">
          <select class="form-control" name="searchOption" id="selectOption">
            <option value="1">지역</option>
            <option value="2">제목</option>
          </select>
          <input
            type="search"
            class="form-control"
            name="keyword"
            id="inputSearch"
            placeholder="검색어를 입력하세요"
            autocomplete="off"
          />
          <input type="hidden" name="reqPage" value="1" />
          <button class="btn btn-outline-primary" id="searchBtn">
            <i class="fas fa-search"></i>
          </button>
        </form>
        <c:if test="${sessionScope.member.memberLevel == 1}">
          <button class="btn btn-primary" id="writeBtn" type="button">
            글쓰기
          </button>
        </c:if>
        <c:if test="${sessionScope.member.memberLevel != 1}">
          <button
            class="btn btn-primary"
            id="writeBtn"
            type="button"
            style="visibility: hidden;"
          >
            글쓰기
          </button>
        </c:if>
      </div>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- JS here -->
    <script src="/src/js/header/vendor/modernizr-3.5.0.min.js"></script>
    <!-- <script src="/src/js/header/vendor/jquery-1.12.4.min.js"></script>
      <script src="/src/js/header/popper.min.js"></script>
    <script src="/src/js/header/owl.carousel.min.js"></script>
    <script src="/src/js/header/isotope.pkgd.min.js"></script>
    <script src="/src/js/header/ajax-form.js"></script>
    <script src="/src/js/header/waypoints.min.js"></script> -->
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
    <script src="/src/js/message/messageSend.js"></script>
    <script>
      // $(".content").on("click", viewContent);

      // function viewContent() {
      //   location.href =
      //     "/tripboard/view.do?tripBoardNo=" + $(this).attr("boardNum");
      // }
    </script>
    <c:if test="${sessionScope.member.memberLevel == 1}">
      <script>
        $("#writeBtn").click(function () {
          location.href = "/tripboard/writeFrm.do";
        });
      </script>
    </c:if>
    <script>
      $(function () {
        // $('[data-toggle="popover"]').popover();
        $(".content").mouseenter(function () {
          $(this).popover("show");
        });
        $(".content").mouseleave(function () {
          $(this).popover("hide");
        });
      });
    </script>
  </body>
</html>
