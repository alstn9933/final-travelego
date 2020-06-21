<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="/src/css/bootstrap/bootstrap-4.5.0.css" />
    <link rel="stylesheet" href="/src/css/message/inbox.css" />
    <link rel="stylesheet" href="/src/css/message/inbox_table.css" />
    <link rel="stylesheet" href="/src/css/message/outbox.css" />
    <meta charset="UTF-8" />
    <title>쪽지함</title>
  </head>
  <body>
  <jsp:include page="/WEB-INF/views/message/inboxNav.jsp"></jsp:include>
    <section>
      <div class="alert_area">
        <div>
          <span>새 쪽지</span>
          <span id="unreadCount">0통</span>
        </div>
        <div>
          <span>전체 쪽지</span>
          <span id="totalCount">0통</span>
        </div>
      </div>
      <!-- 쪽지 정렬 테이블 -->
      <table>
        <tr>
          <td>ㅁ</td>
          <td>제목이 들어올것</td>
          <td>
            <div>
              <span>보낸이</span>
              <span>보낸 시간</span>
            </div>
          </td>
          <td>ㅁ</td>
        </tr>
        <tr>
          <td>ㅁ</td>
          <td>제목이 들어올것</td>
          <td>
            <div>
              <span>보낸이</span>
              <span>보낸 시간</span>
            </div>
          </td>
          <td>ㅁ</td>
        </tr>
        <tr>
          <td>ㅁ</td>
          <td>제목이 들어올것</td>
          <td>
            <div>
              <span>보낸이</span>
              <span>보낸 시간</span>
            </div>
          </td>
          <td>ㅁ</td>
        </tr>
        <tr>
          <td>ㅁ</td>
          <td>제목이 들어올것</td>
          <td>
            <div>
              <span>보낸이</span>
              <span>보낸 시간</span>
            </div>
          </td>
          <td>ㅁ</td>
        </tr>
      </table>
    </section>
  </body>
  <script src="/src/js/jquery/jquery-3.5.1.js"></script>
  <script src="/src/js/bootstrap/popper.min.js"></script>
  <script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
</html>
