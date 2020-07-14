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
        <div class="notify_area" style="display: none;">
          <span>새 글이 있습니다. </span>
          <span id="newCount">+0</span>
        </div>
        <div class="content_area">
          <c:forEach items="${list}" var="board" varStatus="status" >
          	<c:if test="${!status.last }">
            <div
              class="content"
              rnum="${board.rnum}"
              boardnum="${board.togetherNo}"
            >
            </c:if>
            <c:if test="${status.last }">
            <div
              class="content"
              id = "lastContent"
              rnum="${board.rnum}"
              boardnum="${board.togetherNo}"
            >
            </c:if>
              <div>
                <div class="board_title_area">
                  <div class="board_title">
                    <a href="javascript:void(0)">${board.togetherTitle}</a>
                  </div>
                  <div class="board_content">
                    <div>${board.togetherContent}</div>
                  </div>
                </div>
                <div class="board_writer_area">
                  <div class="board_date">
                    <span>${board.togetherDate}</span>
                  </div>
                  <div class="board_writer">
                    <span>${board.togetherWriter}</span>
                  </div>
                  <c:if
                    test="${sessionScope.member.memberId == board.togetherWriter }"
                  >
                    <div class="board_btn">
                      <button
                        type="button"
                        class="btn btn-sm btn-outline-primary modBoard"
                        boardNo = "${board.togetherNo}"
                      >
                        수정
                      </button>
                      <button
                        type="button"
                        class="btn btn-sm btn-outline-danger delBoard"                        
                        boardNo = "${board.togetherNo}"
                      >
                        삭제
                      </button>
                    </div>
                  </c:if>
                </div>
              </div>
              <div class="action_area">
                <div class="show_comment">
                  <div>
                    <i class="far fa-comment-dots"></i>
                    <span>댓글</span>
                    <span id="commentCount">(0)</span>
                  </div>
                  <div><i class="fas fa-angle-down"></i></div>
                </div>
                <div class="comments" style="display: none;">
                  <form class="comment_form">
                    <textarea
                      name=""
                      class="form-control autosize"
                      rows="1"
                      maxlength="60"
                    ></textarea>
                    <button type="button" class="btn btn-primary writeCommentBtn" boardNo = "${board.togetherNo}">작성</button>
                  </form>
                  <table class="table">       
                  </table>
                </div>
              </div>
              <div class="stretch_area">
                <i class="fas fa-angle-down"></i>
              </div>
            </div>
          </c:forEach>
        </div>
        <div class="loading_area" style="display: none;">
          <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
          </div>
        </div>
      </div>
      <div class="fold_area">
        <i class="fas fa-caret-right fold_icon"></i>
      </div>
      <aside style="display: none;">
        <div>
          <c:if test="${not empty sessionScope.member && sessionScope.member.memberLevel==1}">
          <button
            type="button"
            class="btn btn-primary"
            id="writeBtn"
            data-toggle="modal"
            data-target="#staticBackdrop"
          >
            글쓰기
          </button>
        </c:if>
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
                  id="mainSearchRegion"
                  placeholder="검색어"
                />
              </div>
              <div class="common_region">
                <ul class="select_region">
                <c:forEach items="${regionList}" var="reg">
				        	<li regionNo="${reg.regionNo}">${reg.regionCountry }-${reg.regionCity }</li>
                </c:forEach>
                </ul>
              </div>
              <div class="searched_region"></div>
            </div>
            <div class="search_area" style="display: none;">
              <div class="input_area">
                <form id="mainSearch">
                  <input
                    type="search"
                    name="searchKeyword"
                    class="form-control"
                    id="searchRegion"
                    placeholder="제목+내용으로 검색"
                  />
                </form>
              </div>
            </div>
          </div>
          <button type="button" class="btn btn-primary" id="rollBackBtn">되돌리기</button>
        </div>
        <div class="streched">
          <i class="fas fa-caret-right fold_icon"></i>
        </div>
      </aside>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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
                <input type="hidden" name="" value="${sessionScope.member.memberNickname}" id="inputMemberNick">
                <input type="hidden" name="togetherNo" id="togetherNo" value="0">
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
                id="modalCancel"
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
    <script src="/src/js/together/comment.js"></script>
    <script src="/src/js/together/board.js"></script>
    <script src="/src/js/together/aside.js"></script>
    <script src="/src/js/together/write.js"></script>
    <script src="/src/js/together/boardScrollLoad.js"></script>
    <script src="/src/js/together/websocket.js"></script>
    <script>
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
