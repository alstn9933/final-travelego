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
    <link rel="stylesheet" href="/src/css/message/send.css" />
    <meta charset="UTF-8" />
    <title>쪽지함</title>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/message/inboxNav.jsp"></jsp:include>
    <section>
      <form action="/message/send.do" method="POST">
        <div class="receiver_area form-group">
          <label for="inputReceiver">받는 사람</label>
          <span>회원이 존재하지 않습니다.</span>
          <input
            type="text"
            name="messageReceiver"
            id="inputReceiver"
            class="form-control"
          />
        </div>
        <div class="content_area form-group">
          <label for="inputContent">내용</label>
          <textarea
            name="messageContent"
            class="form-control"
            id="inputContent"
            rows="18"
            placeholder="메세지 내용을 입력하세요."
          ></textarea>
        </div>
        <div class="btn_area">
          <button type="button" class="btn btn-outline-danger">취소</button>
          <button type="submit" class="btn btn-outline-primary">보내기</button>
        </div>
        <input type="hidden" name="messageSender" value="${sessionScope.member.memberId}">
      </form>
    </section>
  </body>
</html>
