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
    <meta charset="UTF-8" />
    <title>쪽지함</title>
  </head>
  <body>
    <nav>
      <ul class="inbox_navi">
        <li class="selected_tab"><a href="/message/inbox.do">받은 쪽지</a></li>
        <li><a href="/message/outbox.do">보낸 쪽지</a></li>
        <li><a href="/message/write.do">쪽지 보내기</a></li>
      </ul>
      <div class="btn_area">
        <button
          type="button"
          class="btn btn-sm btn-danger dropdown-toggle"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          메시지 삭제
        </button>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">전체 삭제</a>
          <a class="dropdown-item" href="#">선택 삭제</a>
          <a class="dropdown-item" href="#">읽은 쪽지만 삭제</a>
        </div>
      </div>
    </nav>
    <section>
      <div class="alert_area">
        <div>
          <span>새 쪽지</span><span id="unreadCount"> ${unchkCount}통</span>
        </div>
        <div>
          <span>전체 쪽지</span><span id="totalCount"> ${msgTotalCount}통</span>
        </div>
      </div>
      <!-- 쪽지 정렬 테이블 -->
      <table>
        <c:forEach items="${list }" var="msg">
          <tr>
            <td>
              <c:if test="${msg.messageCheck == 0 }">
                <i class="far fa-envelope"></i>
              </c:if>
              <c:if test="${msg.messageCheck != 0 }">
                <i class="far fa-envelope-open"></i>
              </c:if>
            </td>
            <td>
              <a href="/message/view?messageNo=${msg.messageNo}"
                >${msg.messageContent }</a
              >
            </td>
            <td>
              <div>
                <span>${msg.messageSender }</span><span>${msg.sendDate }</span>
              </div>
            </td>
            <td><i class="far fa-trash-alt"></i></td>
          </tr>
        </c:forEach>
      </table>
    </section>
  </body>
  <script src="/src/js/jquery/jquery-3.5.1.js"></script>
  <script src="/src/js/bootstrap/popper.min.js"></script>
  <script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
</html>
