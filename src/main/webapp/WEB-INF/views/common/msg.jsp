<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
  	<c:if test="${not empty msg }">
    <script>
      alert("${msg}");
      location.href = "${loc}";
    </script>
    </c:if>    
  	<c:if test="${empty msg }">
    <script>
      location.href = "${loc}";
    </script>
    </c:if>
  </body>
</html>
