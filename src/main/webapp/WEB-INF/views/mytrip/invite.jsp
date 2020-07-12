<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script
      type="text/javascript"
      src="http://code.jquery.com/jquery-3.3.1.js"
    ></script>
  </head>
  <body>
    <form action="/invite.do?">
      <input type="text" name="tripNo" value="${currValIs }" /><br />
      <input type="text" name="memberNickname" /><br />
      <button type="button" name="okBtn">초대하기</button>
    </form>
    <button type="button" name="cancelBtn">닫기</button>
    <script>
      $(document).on("click", "button[name=okBtn]", function () {
        window.close();
      });

      $(document).on("click", "button[name=cancelBtn]", function () {
        window.close();
      });
    </script>
  </body>
</html>
