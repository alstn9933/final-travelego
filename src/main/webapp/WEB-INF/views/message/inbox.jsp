<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
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
			<button type="button" class="btn btn-sm btn-danger dropdown-toggle"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				메시지 삭제</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" id="dropdownDeleteAll" href="javascript:void(0)">전체 삭제</a>
				<a class="dropdown-item" id="dropdownDeleteCheck" href="javascript:void(0)">선택 삭제</a>
				<a class="dropdown-item" id="dropdownDeleteRead" href="javascript:void(0)">읽은 쪽지만 삭제</a>
			</div>
		</div>
	</nav>
	<section>
		<div class="alert_area">
			<div>
				<a class="click_text" href="/message/viewUnreadMessage.do"><span>새 쪽지</span><span id="unreadCount"> ${unchkCount}통</span></a>
			</div>
			<div>
				<a class="click_text" href="/message/inbox.do"><span>전체 쪽지</span><span id="totalCount"> ${msgTotalCount}통</span></a>
			</div>
		</div>
		<!-- 쪽지 정렬 테이블 -->
		<table>
			<c:forEach items="${list }" var="msg">
				<c:if test="${msg.messageCheck == 0 }">
					<tr message_no="${msg.messageNo}">
						<td><i class="far fa-envelope"></i></td>
				</c:if>
				<c:if test="${msg.messageCheck != 0 }">
					<tr class="opened" message_no="${msg.messageNo}">
						<td><i class="far fa-envelope-open"></i></td>
				</c:if>
				<td><a href="/message/view.do?messageNo=${msg.messageNo}">${msg.messageContent }</a>
				</td>
				<td>
					<div>
						<a href="/message/write.do?receiver=${msg.messageSender}"
							id="sender" data-toggle="tooltip" data-placement="right"
							title="답장하기">${msg.messageSender }</a> <span>${msg.sendDate }</span>
					</div>
				</td>
				<td><i class="far fa-trash-alt deleteIcon"></i></td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
<script src="/src/js/jquery/jquery-3.5.1.js"></script>
<script src="/src/js/bootstrap/popper.min.js"></script>
<script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
<script>
	$(".deleteIcon").click(
			function(event) {
				event.stopPropagation();
				const messageNo = $(this).parent().parent().attr("message_no");
				const sender = $(this).parent().prev().children().children("a")
						.eq(0).html();
				const tr = $(this).parent().parent();
				if (confirm(sender + "님께서 보낸 쪽지를 삭제하시겠습니까?")) {
					$.ajax({
						url : "/message/asyncDelete.do",
						type : "post",
						data : {
							messageNo : messageNo
						},
						success : function(data) {
							if (data == "1") {
								alert("쪽지가 삭제되었습니다.");
								location.href = "/message/inbox.do";
							} else {
								alert("쪽지 삭제에 실패하였습니다.");
							}
						},
						error : function() {
							alert("쪽지 삭제에 실패하였습니다.");
						},
					});
				}
			});

	$("tr").click(function(event) {
		// $(this).children("td").eq(1).children("a");
		event.stopPropagation();
		const messageNo = $(this).attr("message_no");
		location.href = "/message/view.do?messageNo=" + messageNo;
	});
</script>
<script src="/src/js/message/deleteMessage.js"></script>
</html>
