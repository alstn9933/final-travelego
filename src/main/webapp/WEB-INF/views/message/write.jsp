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
    <nav>
      <ul class="inbox_navi">
        <li><a href="/message/inbox.do">받은 쪽지</a></li>
        <li><a href="/message/outbox.do">보낸 쪽지</a></li>
        <li class="selected_tab">
          <a href="/message/write.do">쪽지 보내기</a>
        </li>
      </ul>
    </nav>
    <section>
      <form action="/message/send.do" method="POST">
        <div class="receiver_area form-group">
          <label for="inputReceiver">받는 사람</label>
          <span id="receiverAlert" style="display: none;"
            >회원이 존재하지 않습니다.</span
          >
          <c:if test="${not empty receiver }">
            <input
              type="text"
              name="messageReceiver"
              id="inputReceiver"
              class="form-control"
              value="${receiver}"
              readonly
            />
          </c:if>
          <c:if test="${empty receiver }">
            <input
              type="text"
              name="messageReceiver"
              id="inputReceiver"
              class="form-control"
              placeholder="쪽지를 보낼 상대방의 회원 ID를 입력하세요."
            />
          </c:if>
        </div>
        <div class="content_area form-group">
          <label for="inputContent">내용</label>
          <textarea
            name="messageContent"
            class="form-control"
            id="inputContent"
            rows="18"
            placeholder="쪽지를 보낼 상대방을 먼저 입력하세요."
            disabled
          ></textarea>
        </div>
        <div class="btn_area">
          <button type="reset" class="btn btn-outline-danger">취소</button>
          <button type="submit" class="btn btn-outline-primary">보내기</button>
        </div>
        <input
          type="hidden"
          name="messageSender"
          value="${sessionScope.member.memberId}"
        />
      </form>
    </section>
  </body>
  <script src="/src/js/jquery/jquery-3.5.1.js"></script>
  <script src="/src/js/bootstrap/popper.min.js"></script>
  <script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
  <script>
    chkReceiver();

    function chkReceiver() {
      if ($("#inputReceiver").val() != "") {
        $("#inputContent").attr("placeholder", "내용을 입력하세요");
        $("#inputContent").removeAttr("disabled");
        $("#inputContent").focus();
      }
    }

    $("#inputReceiver").focusout(function () {
      const receiver = $(this).val();

      if (receiver != "") {
        $.ajax({
          url: "/message/checkId.do",
          type: "POST",
          data: { receiver: receiver },
          success: function (data) {
            if (data == "0") {
              $("#inputReceiver").focus();
              $("#receiverAlert").show();
              $("#inputContent").attr(
                "placeholder",
                "쪽지를 보낼 상대방을 먼저 입력하세요."
              );
              $("#inputContent").val("");
              $("#inputContent").attr("disabled", true);
            } else {
              $("#receiverAlert").hide();
              $("#inputContent").attr("placeholder", "내용을 입력하세요");
              $("#inputContent").removeAttr("disabled");
            }
          },
          error: function () {},
        });
      }
    });

    $("button")
      .eq(0)
      .click(function () {
        $("#inputContent").attr("disabled", true);
      });
  </script>
</html>
