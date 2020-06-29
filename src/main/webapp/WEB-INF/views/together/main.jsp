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
    <!-- CSS here -->
    <link rel="stylesheet" href="/src/css/header/header.css" />
    <link rel="stylesheet" href="/src/css/footer/footer.css" />
    <link rel="stylesheet" href="/src/css/main/web_default.css" />
    <link rel="stylesheet" href="/src/css/together/main.css">
    <script
      src="/src/js/fontawesome/8bd2671777.js"
    ></script>
    <title>Travelego</title>
    <style></style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <section>
      <div class="board">
        <div class="notify_area">
          <span>새 글이 있습니다.</span>
          <span id="newCount">+2</span>
        </div>                
        <div class="content_area">
          <div class="content">
            <div>
              <div class="board_title_area">
                <div class="board_title">
                  <a href="#">title</a>
                </div>
                <div class="board_content">
                 <div>
                    <p>contentcontentcontentcontent</p>
                    <p>content</p>
                  </div>
                </div>
              </div>
              <div class="board_writer_area">
                <div class="board_date"><span>date</span></div>
                <div class="board_writer"><span>writer</span></div>
              </div>
            </div>
            <div class="strech_area">
              <i class="fas fa-angle-down"></i>
            </div>
          </div>
          <div class="content">
            <div>
              <div class="board_title_area">
                <div class="board_title">
                  <a href="#">title</a>
                </div>
                <div class="board_content">
                 <div>
                    <p>contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent</p>
                    <p>content</p>
                  </div>
                </div>
              </div>
              <div class="board_writer_area">
                <div class="board_date"><span>date</span></div>
                <div class="board_writer"><span>writer</span></div>
              </div>
            </div>
            <div class="strech_area">
              <i class="fas fa-angle-down"></i>
            </div>            
          </div>
          <div class="open_content">
            <div>
              <div class="board_title_area">
                <div class="board_title">
                  <a href="#">title</a>
                </div>
                <div class="board_content">
                 <div>
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                  </div>
                </div>
              </div>
              <div class="board_writer_area">
                <div class="board_date"><span>date</span></div>
                <div class="board_writer"><span>writer</span></div>
                <div class="board_btn">
                  <button type="button" class="btn btn-sm btn-outline-primary">수정</button>
                  <button type="button" class="btn btn-sm btn-outline-danger">삭제</button>
                </div>
              </div>
            </div>
            <div class="action_area">
              <div class="show_comment">
                <div>
                  <i class="far fa-comment-dots"></i>
                  <span>댓글</span>
                  <span>(0)</span>
                </div>
                <div><i class="fas fa-angle-down icon_x_rotate"></i></div>
              </div>
              <div class="input_comment">
                <form action="#" class="comment_form">
                  <textarea name="" class="form-control" id="autosize" rows="1"></textarea>
                  <button class="btn btn-primary">작성</button>
                </form>
              </div>
              <div class="comments">
                <table class="table">
                  <tr class="comment_writer_area">
                    <th scope="row" class="comment_writer">작성자</th>
                    <td class="comment_date">2020.06.29.</td>
                  </tr>
                  <tr class="comment_content_area">
                    <td>    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td>
                  </tr>
                  <tr class="comment_writer_area">
                    <th scope="row" class="comment_writer">작성자</th>
                    <td class="comment_date">2020.06.29.</td>
                  </tr>
                  <tr class="comment_content_area">
                    <td>    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td>
                  </tr>
                </table>
              </div>
            </div>            
            <div class="strech_area">
              <i class="fas fa-angle-down"></i>
            </div>
          </div>
        </div>
      </div>
      <div class="fold_area streched">
        <i class="fas fa-caret-right fold_icon"></i>
      </div>
      <aside>
        <button type="button" class="btn btn-primary" id="writeBtn">글쓰기</button>
        <div class="side_area">
          <div class="search_tab">
            <div class="selected_tab">
              <a href="#">지역</a>
            </div>
            <div>
              <a href="#">검색</a>
            </div>
          </div>
          <div class="region_area" style="display: none;">
            <div class="input_area">
              <input type="text" class="form-control" id="inputRegion" placeholder="검색어">
              <div class="common_region">
                <ul>
                  <li>제주도</li>
                  <li>부산</li>
                </ul>
              </div>
              <div class="searched_region"></div>
            </div>
          </div>
          <div class="search_area"></div>
        </div>
      </aside>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- Modal -->
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
  <script>
    $("#autosize").on("keydown keyup", function(){
      $(this).height(1).height( $(this).prop('scrollHeight')+12 );
    });
  </script>
</html>
