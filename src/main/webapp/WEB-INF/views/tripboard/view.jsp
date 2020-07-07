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
    <link rel="stylesheet" href="/src/css/tripboard/view.css" />
    <title>Travelego</title>
    <style></style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <section>
      <div>
        <div class="input_wrapper">
          <div class="img_upload_wrapper">
            <div class="img_container">
              <span>대표 이미지</span>
            </div>
          </div>
          <div class="input_main_wrapper">
            <div class="writer_area">
              <span>작성자</span>
              <span>작성자</span>
            </div>
            <div class="input_region_area">
              <span>여행 지역</span>
              <input type="search" name="" id="" class="form-control" />
            </div>
            <div class="trip_date_area">
              <span>여행 기간</span>
              <input type="text" name="" id="" class="form-control" />
            </div>
            <div class="input_title_area">
              <span>제목</span>
              <input type="text" name="" id="" class="form-control" />
            </div>
          </div>
          <div class="select_trip_wrapper">
            <span>여행 루트</span>
            <div class="route_container"></div>
          </div>
        </div>
        <div class="content_wrapper"></div>
        <div class="comment_wrapper">
          <div class="show_comment">
            <div>
              <i class="far fa-comment-dots"></i>
              <span>댓글</span>
              <span>(0)</span>
            </div>
            <div><i class="fas fa-angle-down"></i></div>
          </div>
          <div class="comments" style="display: none;">
            <form action="#" class="comment_form">
              <textarea
                name=""
                class="form-control"
                id="autosize"
                rows="1"
              ></textarea>
              <button class="btn btn-primary writeCommentBtn">작성</button>
            </form>
            <table class="table">
              <tr class="comment_writer_area">
                <th scope="row" class="comment_writer">작성자</th>
                <td class="comment_date">2020.06.29.</td>
              </tr>
              <tr class="comment_content_area">
                <td>
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                  do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                  Ut enim ad minim veniam, quis nostrud exercitation ullamco
                  laboris nisi ut aliquip ex ea commodo consequat. Duis aute
                  irure dolor in reprehenderit in voluptate velit esse cillum
                  dolore eu fugiat nulla pariatur. Excepteur sint occaecat
                  cupidatat non proident, sunt in culpa qui officia deserunt
                  mollit anim id est laborum.
                </td>
                <td class="comment_btn">
                  <button
                    type="button"
                    class="btn btn-sm btn-outline-primary modCommentBtn"
                  >
                    수정
                  </button>
                  <button
                    type="button"
                    class="btn btn-sm btn-outline-danger delCommentBtn"
                  >
                    삭제
                  </button>
                </td>
              </tr>
              <tr class="comment_writer_area">
                <th scope="row" class="comment_writer">작성자</th>
                <td class="comment_date">2020.06.29.</td>
              </tr>
              <tr class="comment_content_area">
                <td>
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                  do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                  Ut enim ad minim veniam, quis nostrud exercitation ullamco
                  laboris nisi ut aliquip ex ea commodo consequat. Duis aute
                  irure dolor in reprehenderit in voluptate velit esse cillum
                  dolore eu fugiat nulla pariatur. Excepteur sint occaecat
                  cupidatat non proident, sunt in culpa qui officia deserunt
                  mollit anim id est laborum.
                </td>
                <td class="comment_btn">
                  <button
                    type="button"
                    class="btn btn-sm btn-outline-primary modCommentBtn"
                  >
                    수정
                  </button>
                  <button
                    type="button"
                    class="btn btn-sm btn-outline-danger delCommentBtn"
                  >
                    삭제
                  </button>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <div class="form_button_wrapper">
          <button type="button" class="btn btn-outline-danger">삭제</button>
          <button type="button" class="btn btn-outline-primary">수정</button>
          <button type="button" class="btn btn-primary">목록으로</button>
        </div>
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
    <!-- <script src="/src/js/header/waypoints.min.js"></script> -->
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
    <script src="/src/ckeditor/ckeditor.js"></script>
    <script>
      $(".show_comment").click(function () {
        const icon = $(this).find(".fa-angle-down");

        if (icon.hasClass("icon_x_rotate")) {
          icon.removeClass("icon_x_rotate");
        } else {
          icon.addClass("icon_x_rotate");
        }

        $(this).next().slideToggle();
      });
    </script>
  </body>
</html>
