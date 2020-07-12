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
            <c:if test="${not empty board.filepath}">
              <div class="img_container">
                <img id="mainImg" src="${board.filepath}" alt="" />
              </div>
            </c:if>
          </div>
          <div class="input_main_wrapper">
            <div class="writer_area">
              <span>작성자</span>
              <span>${board.tripBoardWriter}</span>
            </div>
            <div class="input_region_area">
              <span>여행 지역</span>
              <span>${board.regionName}</span>
            </div>
            <div class="trip_date_area">
              <span>여행 기간</span>
              <span>${board.tripDays}</span>
            </div>
            <div class="input_title_area">
              <span>제목</span>
              <span>${board.tripBoardTitle}</span>
            </div>
          </div>
          <div class="select_trip_wrapper">
            <span>여행 루트</span>
            <div class="route_container">
              <textarea
                class="form-control"
                name="tripRoute"
                id="textRoute"
                cols="30"
                rows="3"
                readonly
              >
${board.tripRoute}</textarea
              >
            </div>
          </div>
        </div>
        <div class="content_wrapper">${board.tripBoardContent}</div>
        <div class="button_wrapper">
          <div>
            <c:if test="${empty sessionScope.member.memberId}">
              <button
                type="button"
                class="btn btn-outline-primary"
                id="likeBtn"
                boardNum="${board.tripBoardNo}"
              >
                <i class="far fa-heart"></i>
                <span>${board.likeCount}</span>
                <span>좋아요</span>
              </button>
              <button
                type="button"
                class="btn btn-outline-warning"
                id="bookmarkBtn"
                boardNum="${board.tripBoardNo}"
              >
                <i class="far fa-bookmark"></i><span>북마크</span>
              </button>
            </c:if>
            <c:if test="${not empty sessionScope.member.memberId}">
              <c:if test="${not empty board.likedId}">
                <button
                  type="button"
                  class="btn btn-outline-primary"
                  id="unLikeBtn"
                  boardNum="${board.tripBoardNo}"
                >
                  <i class="fas fa-heart"></i>
                  <span>좋아요</span>
                  <span>${board.likeCount}</span>
                </button>
              </c:if>
              <c:if test="${empty board.likedId}">
                <button
                  type="button"
                  class="btn btn-outline-primary"
                  id="likeBtn"
                  boardNum="${board.tripBoardNo}"
                >
                  <i class="far fa-heart"></i>
                  <span>좋아요</span>
                  <span>${board.likeCount}</span>
                </button>
              </c:if>
              <c:if test="${not empty board.bookmarkNo}">
                <button
                  type="button"
                  class="btn btn-outline-warning"
                  id="unBookmarkBtn"
                  boardNum="${board.tripBoardNo}"
                >
                  <i class="fas fa-bookmark"></i><span>북마크</span>
                </button>
              </c:if>
              <c:if test="${empty board.bookmarkNo}">
                <button
                  type="button"
                  class="btn btn-outline-warning"
                  id="bookmarkBtn"
                  boardNum="${board.tripBoardNo}"
                >
                  <i class="far fa-bookmark"></i><span>북마크</span>
                </button>
              </c:if>
            </c:if>
            <button
              type="button"
              class="btn btn-outline-danger"
              id="reportBtn"
              boardNum="${board.tripBoardNo}"
            >
              <i class="fas fa-exclamation-circle"></i>
            </button>
          </div>
        </div>
        <div class="comment_wrapper">
          <div class="show_comment">
            <div>
              <i class="far fa-comment-dots"></i>
              <span>댓글</span>
              <span>(${board.commentCount})</span>
            </div>
            <div><i class="fas fa-angle-down"></i></div>
          </div>
          <div class="comments" style="display: none;">
            <form action="/tripboard/writeComment.do" class="comment_form">
              <textarea
                name="commentContent"
                class="form-control autosize"
                rows="1"
                maxlength="60"
              ></textarea>
              <button class="btn btn-primary writeCommentBtn">작성</button>
              <input type="hidden" name="commentLevel" value="0" />
              <input
                type="hidden"
                name="boardNo"
                value="${board.tripBoardNo}"
              />
            </form>
            <table class="table">
              <c:forEach items="${commentList}" var="comment">
                <c:if test="${comment.refComment == 0}">
                  <tr class="comment_writer_area">
                    <th scope="row" class="comment_writer">
                      ${comment.commentWriter }
                    </th>
                    <td class="comment_date">
                      <div>${comment.commentDate }</div>
                    </td>
                  </tr>
                  <tr class="comment_content_area">
                    <td>${comment.commentContent }</td>
                    <td class="comment_btn">
                      <div>
                        <c:if
                          test="${sessionScope.member.memberId == comment.commentWriter }"
                        >
                          <button
                            type="button"
                            class="btn btn-sm btn-outline-primary modCommentBtn"
                            commentNo="${comment.commentNo }"
                            boardNum="${comment.boardNo}"
                          >
                            수정
                          </button>
                          <button
                            type="button"
                            class="btn btn-sm btn-outline-danger delCommentBtn"
                            commentNo="${comment.commentNo }"
                            boardNum="${comment.boardNo}"
                          >
                            삭제
                          </button>
                        </c:if>
                      </div>
                      <div>
                        <c:if test="${not empty sessionScope.member.memberId }">
                          <button
                            type="button"
                            class="btn btn-sm btn-outline-info addComment"
                            commentNo="${comment.commentNo }"
                            boardNum="${comment.boardNo}"
                          >
                            답글 달기
                          </button>
                        </c:if>
                      </div>
                    </td>
                  </tr>
                </c:if>
                <c:forEach items="${commentList }" var="reply">
                  <c:if test="${comment.commentNo == reply.refComment }">
                    <tr class="comment_writer_area reply">
                      <th scope="row" class="comment_writer">
                        ${reply.commentWriter }
                      </th>
                      <td class="comment_date">
                        <div>${reply.commentDate }</div>
                      </td>
                    </tr>
                    <tr class="comment_content_area reply">
                      <td>${reply.commentContent }</td>
                      <td class="comment_btn">
                        <div>
                          <c:if
                            test="${sessionScope.member.memberId == comment.commentWriter }"
                          >
                            <button
                              type="button"
                              class="btn btn-sm btn-outline-primary modCommentBtn"
                              commentNo="${reply.commentNo }"
                              boardNum="${reply.boardNo}"
                            >
                              수정
                            </button>
                            <button
                              type="button"
                              class="btn btn-sm btn-outline-danger delCommentBtn"
                              commentNo="${reply.commentNo }"
                              boardNum="${reply.boardNo}"
                            >
                              삭제
                            </button>
                          </c:if>
                        </div>
                        <div></div>
                      </td>
                    </tr>
                  </c:if>
                </c:forEach>
              </c:forEach>
            </table>
          </div>
        </div>
        <div class="form_button_wrapper">
          <c:if
            test="${sessionScope.member.memberId == board.tripBoardWriter }"
          >
            <button
              type="button"
              class="btn btn-outline-danger"
              id="delBtn"
              boardNum="${board.tripBoardNo}"
            >
              삭제
            </button>
            <button
              type="button"
              class="btn btn-outline-primary"
              id="modBtn"
              boardNum="${board.tripBoardNo}"
            >
              수정
            </button>
          </c:if>
          <button type="button" class="btn btn-primary" id="goListBtn">
            목록으로
          </button>
        </div>
      </div>
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
    <script src="/src/ckeditor/ckeditor.js"></script>
    <script src="/src/js/tripboard/comment.js"></script>
    <c:if test="${not empty sessionScope.member.memberId}">
      <script src="/src/js/tripboard/like.js"></script>
      <script>
        $("#modBtn").click(function () {
          location.href =
            "/tripboard/modifyFrm.do?boardNum=" + $(this).attr("boardNum");
        });

        $("#delBtn").click(function () {
          if (confirm("게시글을 삭제하시겠습니까?")) {
            location.href =
              "/tripboard/delete.do?boardNum=" + $(this).attr("boardNum");
          }
        });
      </script>
    </c:if>
    <script>
      $("#goListBtn").click(function () {
        location.href = "/tripboard/main.do?reqPage=1";
      });
    </script>
    <c:if test="${empty sessionScope.member.memberId}">
      <script>
        $(".comment_form").on("submit", function () {
          alert("로그인이 필요한 기능입니다.");
          return false;
        });
        $(".autosize").on("click", function () {
          alert("로그인이 필요한 기능입니다.");
          $(this).focusout();
        });

        $("#bookmarkBtn").click(function () {
          alert("로그인이 필요한 기능입니다.");
        });

        $("#likeBtn").click(function () {
          alert("로그인이 필요한 기능입니다.");
        });

        $("#reportBtn").click(function () {
          alert("로그인이 필요한 기능입니다.");
        });
      </script>
    </c:if>
  </body>
</html>
