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
    <link rel="stylesheet" href="/src/css/together/main.css" />
    <script src="/src/js/fontawesome/8bd2671777.js"></script>
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
            <div class="strech_area" style="display: none;">
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
                    <p>
                      contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent
                    </p>
                    <p>content</p>
                  </div>
                </div>
              </div>
              <div class="board_writer_area">
                <div class="board_date"><span>date</span></div>
                <div class="board_writer"><span>writer</span></div>
              </div>
            </div>
            <div class="strech_area" style="display: none;">
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
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    Duis aute irure dolor in reprehenderit in voluptate velit
                    esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                    occaecat cupidatat non proident, sunt in culpa qui officia
                    deserunt mollit anim id est laborum.
                  </div>
                </div>
              </div>
              <div class="board_writer_area">
                <div class="board_date"><span>date</span></div>
                <div class="board_writer"><span>writer</span></div>
                <div class="board_btn">
                  <button type="button" class="btn btn-sm btn-outline-primary">
                    수정
                  </button>
                  <button type="button" class="btn btn-sm btn-outline-danger">
                    삭제
                  </button>
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
                  <button class="btn btn-primary">작성</button>
                </form>
                <table class="table">
                  <tr class="comment_writer_area">
                    <th scope="row" class="comment_writer">작성자</th>
                    <td class="comment_date">2020.06.29.</td>
                  </tr>
                  <tr class="comment_content_area">
                    <td>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna
                      aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                      ullamco laboris nisi ut aliquip ex ea commodo consequat.
                      Duis aute irure dolor in reprehenderit in voluptate velit
                      esse cillum dolore eu fugiat nulla pariatur. Excepteur
                      sint occaecat cupidatat non proident, sunt in culpa qui
                      officia deserunt mollit anim id est laborum.
                    </td>
                  </tr>
                  <tr class="comment_writer_area">
                    <th scope="row" class="comment_writer">작성자</th>
                    <td class="comment_date">2020.06.29.</td>
                  </tr>
                  <tr class="comment_content_area">
                    <td>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna
                      aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                      ullamco laboris nisi ut aliquip ex ea commodo consequat.
                      Duis aute irure dolor in reprehenderit in voluptate velit
                      esse cillum dolore eu fugiat nulla pariatur. Excepteur
                      sint occaecat cupidatat non proident, sunt in culpa qui
                      officia deserunt mollit anim id est laborum.
                    </td>
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
      <div class="fold_area">
        <i class="fas fa-caret-right fold_icon"></i>
      </div>
      <aside style="display: none;">
        <div>
          <button
            type="button"
            class="btn btn-primary"
            id="writeBtn"
            data-toggle="modal"
            data-target="#staticBackdrop"
          >
            글쓰기
          </button>
          <div class="side_area">
            <div class="search_tab">
              <div class="selected_tab">
                <a href="javascript:void(0)">지역</a>
              </div>
              <div>
                <a href="javascript:void(0)">검색</a>
              </div>
            </div>
            <div class="region_area">
              <div class="input_area">
                <input
                  type="text"
                  class="form-control"
                  id="searchRegion"
                  placeholder="검색어"
                />
              </div>
              <div class="common_region">
                <ul>
                  <li>제주도</li>
                  <li>부산</li>
                </ul>
              </div>
              <div class="searched_region"></div>
            </div>
            <div class="search_area" style="display: none;">
              <div class="input_area">
                <form action="#">
                  <input
                    type="text"
                    class="form-control"
                    id="searchRegion"
                    placeholder="검색어"
                  />
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="streched">
          <i class="fas fa-caret-right fold_icon"></i>
        </div>
      </aside>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- Modal -->
    <!-- Modal -->
    <div
      class="modal fade"
      id="staticBackdrop"
      data-backdrop="static"
      data-keyboard="false"
      tabindex="-1"
      role="dialog"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">
              동행 구하기 - 새 글 쓰기
            </h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form action="/together/write.do" id="writeForm" method="POST">
            <div class="modal-body">
              <div class="form-group region_form">
                <input
                  type="hidden"
                  name="togetherWriter"
                  value="${sessionScope.member.memberId}"
                />
                <input type="hidden" name="regionNo" id="regionNo" />
                <label for="inputRegion" class="col-form-label">지역</label>
                <div>
                  <input
                    type="search"
                    class="form-control"
                    id="inputRegion"
                    placeholder="검색어를 입력하세요"
                    autocomplete="off"
                  />
                  <ul class="list-group shadow-sm">
                    <li class="list-group-item" id="selected_region">test1</li>
                    <li class="list-group-item">test2</li>
                    <li class="list-group-item">test3</li>
                    <li class="list-group-item">test4</li>
                    <li class="list-group-item">test5</li>
                  </ul>
                </div>
                <span id="regionAlert">
                  검색어를 입력 후 결과에서 선택하세요.
                </span>
              </div>
              <div class="form-group title_form">
                <label for="inputTitle" class="col-form-label">제목</label>
                <input
                  type="text"
                  name="togetherTitle"
                  class="form-control"
                  id="inputTitle"
                  placeholder="제목을 입력하세요"
                  maxlength="66"
                />
              </div>
              <div class="form-group content_form">
                <label for="inputContent" class="col-form-label">내용</label>
                <textarea
                  class="form-control"
                  name="togetherContent"
                  id="inputContent"
                  placeholder="내용을 입력하세요."
                  maxlength="333"
                ></textarea>
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
              >
                취소
              </button>
              <button type="button" id="submitBtn" class="btn btn-primary">
                작성 완료
              </button>
            </div>
          </form>
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
    <script src="/src/js/together/board.js"></script>
    <script src="/src/js/together/aside.js"></script>
    <script>
      $("#submitBtn").click(function () {
        $("#writeForm").submit();
      });

      $("#writeForm").submit(function (e) {
        const postData = $(this).serializeArray();
        const formUrl = $(this).attr("action");

        $.ajax({
          url: formUrl,
          type: "POST",
          data: postData,
          success: function (data) {
            if (data == "1") {
              cleanBoard();
              $("#staticBackdrop").modal("hide");
              alert("게시글을 등록하였습니다.");
            } else {
              alert("실패!");
            }
          },
          error: function () {
            alert("실패!");
          },
        });
        e.preventDefault();
      });

      function cleanBoard() {
        $("#inputRegion").val("");
        $("#inputTitle").val("");
        $("#inputContent").val("");
      }

      $("#inputRegion").keypress(function (event) {
        if (event.keyCode == 13) {
          event.preventDefault();
          return false;
        }
      });

      $("#inputRegion").keyup(function (event) {
        const key = event.key;
        const current = $("#selected_region");
        if (key.includes("Arrow")) {
          if (key.includes("Up")) {
            const next = current.prev();
            if (next.length != 0) {
              current.removeAttr("id");
              next.attr("id", "selected_region");
            }
          } else if (key.includes("Down")) {
            const next = current.next();
            if (next.length != 0) {
              current.removeAttr("id");
              next.attr("id", "selected_region");
            }
          }
        } else if (event.keyCode == 13) {
          $(this).val(current.html());
          $("#regionNo").val(current.attr("regionNo"));
          $(".list-group").children().remove();
          // setTimeout(function () {
          // }, 200);
        } else {
          const keyword = $(this).val();

          $.ajax({
            url: "/together/searchRegion.do",
            type: "post",
            data: { keyword: keyword },
            success: function (data) {
              const list = $(".list-group");
              list.children().remove();
              if (data.length != 0) {
                for (let i = 0; i < data.length; i++) {
                  const text = data[i].regionCountry + "-" + data[i].regionCity;
                  let li = document.createElement("li");
                  if (i == 0) {
                    li.id = "selected_region";
                  }
                  li.classList.add("list-group-item");
                  li.setAttribute("regionNo", data[i].regionNo);
                  li.innerHTML = text;
                  li.addEventListener("click", listClick);
                  li.addEventListener("mouseenter", listHover);
                  list.append(li);
                }
              } else {
                let li = document.createElement("li");
                li.classList.add("list-group-item");
                li.innerHTML = "조회 결과가 없습니다.";
                list.append(li);
              }
            },
            error: function () {
              alert("서버 연결에 실패하였습니다.");
            },
          });
        }
      });

      $("#inputRegion").on("search focusout", function (event) {
        $(".list-group").children().remove();
        event.preventDefault();
        return false;
      });

      function listClick() {
        $("#inputRegion").val($(this).html());
        $("#regionNo").val($(this).attr("regionNo"));
        $(".list-group").children().remove();
      }

      function listHover() {
        $("#selected_region").removeAttr("id");
        $(this).attr("id", "selected_region");
      }
    </script>
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
