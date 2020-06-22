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
      	<c:if test="${inbox == 1 }">
        <li class="selected_tab"><a href="/message/inbox.do">받은 쪽지</a></li>
        <li><a href="/message/outbox.do">보낸 쪽지</a></li>
        </c:if>        
      	<c:if test="${inbox == 0 }">
        <li><a href="/message/inbox.do">받은 쪽지</a></li>
        <li class="selected_tab"><a href="/message/outbox.do">보낸 쪽지</a></li>
        </c:if>
        <li><a href="/message/outbox.do">보낸 쪽지</a></li>
        <li><a href="/message/write.do">쪽지 보내기</a></li>
      </ul>
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
      <!-- 쪽지 상세 -->
    </section>
  </body>
  <script src="/src/js/jquery/jquery-3.5.1.js"></script>
  <script src="/src/js/bootstrap/popper.min.js"></script>
  <script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
</html>
