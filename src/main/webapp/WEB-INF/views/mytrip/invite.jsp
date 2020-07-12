<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<input type="hidden" name="tripNo" value="${currValIs }">
	<input type="text" name="memberNickname"><br>
	<button type="button" name="okBtn">초대하기</button>
	<button type="button" name="cancelBtn">닫기</button>
	<script>
		$(document).on("click","button[name=okBtn]",function(){
			var tripNo = $("input[name=tripNo]").val();
			var memberNickname = $("input[name=memberNickname]").val();
			var form = {
					"tripNo":tripNo,
					"memberNickname":memberNickname
			}
			var result = "";
			$.ajax({
				url : "/invite.do",
				data : form,
				success : function(data){
					alert("초대장이 발송되었습니다");
				},
				error : function(data){
					result = data;
					if(result==0){
						alert("초대에 실패하였습니다");
					}else{
						alert("해당하는 회원이 존재하지 않습니다");
					}
				}
			});
			window.close();
		});
		
		$(document).on("click","button[name=cancelBtn]",function(){
			window.close();
		});
	</script>
</body>
</html>