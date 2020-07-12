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
    <c:if test="${message.messageReceiver != sessionScope.member.memberId }">
      <link rel="stylesheet" href="/src/css/message/outbox.css" />
    </c:if>
    <link rel="stylesheet" href="/src/css/message/view.css" />
    <meta charset="UTF-8" />
    <title>쪽지함</title>
  </head>
  <body>
    <nav>
      <ul class="inbox_navi">
        <c:if
          test="${message.messageReceiver == sessionScope.member.memberId }"
        >
          <li class="selected_tab">
            <a href="/message/inbox.do">받은 쪽지</a>
          </li>
          <li><a href="/message/outbox.do">보낸 쪽지</a></li>
        </c:if>
        <c:if
          test="${message.messageReceiver != sessionScope.member.memberId }"
        >
          <li><a href="/message/inbox.do">받은 쪽지</a></li>
          <li class="selected_tab">
            <a href="/message/outbox.do">보낸 쪽지</a>
          </li>
        </c:if>
        <li><a href="/message/write.do">쪽지 보내기</a></li>
      </ul>
    </nav>
    <section>
      <div class="alert_area">
        <c:if test="${empty sendCount}">
          <div>
            <span>새 쪽지</span><span id="unreadCount"> ${unchkCount}통</span>
          </div>
          <div>
            <span>전체 쪽지</span
            ><span id="totalCount"> ${msgTotalCount}통</span>
          </div>
        </c:if>
        <c:if test="${not empty sendCount}">
          <div>
            <span>보낸 쪽지</span><span id="totalCount"> ${sendCount}통</span>
          </div>
        </c:if>
      </div>
      <!-- 쪽지 상세 -->
      <div class="content_area">${message.messageContent}</div>
      <div class="sender_area">
        <c:if test="${sessionScope.member.memberId != message.messageSender }">
          <div>
            <span id="messageTarget">from.</span>
            <span id="sender">${message.messageSender}</span>
          </div>
        </c:if>
        <c:if test="${sessionScope.member.memberId == message.messageSender }">
          <div>
            <span id="messageTarget">To.</span>
            <span id="sender">${message.messageReceiver}</span>
          </div>
        </c:if>
        <span id="send_date">${message.sendDate}</span>
      </div>
      <div class="btn_area">
        <div>
          <button id="toList" type="button" class="btn btn-primary">
            목록으로
          </button>
        </div>
        <div>
          <button type="button" class="btn btn-danger" id="deleteBtn">
            삭제
          </button>
          <button type="button" class="btn btn-primary" id="responseBtn">
            답장하기
          </button>
        </div>
      </div>
    </section>
  </body>
  <script src="/src/js/jquery/jquery-3.5.1.js"></script>
  <script src="/src/js/bootstrap/popper.min.js"></script>
  <script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
  <c:if test="${sessionScope.member.memberId != message.messageSender }">
    <script>
      $("#inviteAccept").click(function () {
        const tripNo = $(this).attr("tripNo");

        $.ajax({
          url: "/message/acceptInvite.do",
          type: "POST",
          data: { tripNo: tripNo },
          success: function (data) {
            if (data == "-1") {
              alert("이미 수락한 초대입니다.");
            } else if (data == "1") {
              if (
                confirm(
                  "초대가 수락되었습니다.\r\n일정만들기 페이지로 이동할까요?"
                )
              ) {
                opener.location.href = "/makePlanFrm.do?tripNoIs=" + tripNo;
                self.close();
              }
            }
          },
          error: function () {
            console.log("서버 접속에 실패했습니다.");
          },
        });
      });

      $("#inviteReject").click(function () {
        const tripNo = $(this).attr("tripNo");
        const receiverId = $(this).attr("receiver");
        if (confirm("초대 거절 메시지를 발송하시겠습니까?")) {
          $.ajax({
            url: "/message/rejectInvite.do",
            type: "POST",
            data: { receiverId: receiverId, tripNo: tripNo },
            success: function (data) {
              if (data == "1") {
                alert("거절 메시지를 발송하였습니다.");
              } else if (data == "-1") {
                alert("이미 수락한 초대입니다.");
              }
            },
            error: function () {
              console.log("메시지 발송에 실패");
            },
          });
        }
      });
    </script>
  </c:if>
  <c:if test="${sessionScope.member.memberId == message.messageSender }">
    <script>
      $("#inviteAccept").click(function () {
        alert("초대받은 사람에게만 허용된 기능입니다.");
      });

      $("#inviteReject").click(function () {
        alert("초대받은 사람에게만 허용된 기능입니다.");
      });
    </script>
  </c:if>
  <script>
    $("#responseBtn").click(function () {
      location.href = "/message/write.do?receiver=${message.messageReceiver}";
    });

    $("#deleteBtn").click(function () {
      if (confirm("쪽지를 삭제하시겠습니까?")) {
        location.href = "/message/delete.do?messageNo=${message.messageNo}";
      }
    });

    $("#toList").click(function () {
      const toGo = $("#messageTarget").html();
      if (toGo == "from.") {
        location.href = "/message/inbox.do";
      } else {
        location.href = "/message/outbox.do";
      }
    });
  </script>
</html>
