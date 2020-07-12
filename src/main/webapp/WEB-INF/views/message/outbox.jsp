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
<link rel="stylesheet" href="/src/css/message/outbox.css" />
<meta charset="UTF-8" />
<title>쪽지함</title>
</head>
<body>
	<nav>
		<ul class="inbox_navi">
			<li><a href="/message/inbox.do">받은 쪽지</a></li>
			<li class="selected_tab"><a href="/message/outbox.do">보낸 쪽지</a></li>
			<li><a href="/message/write.do">쪽지 보내기</a></li>
		</ul>
		<div class="btn_area">
			<button type="button" class="btn btn-sm btn-danger delete-btns" id="deleteBtn" style="display: none;">삭제</button>
			<button type="button" class="btn btn-sm btn-primary delete-btns" id="cancelBtn" style="display: none;">취소</button>
			<button type="button" class="btn btn-sm btn-danger dropdown-toggle"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				메시지 삭제</button>
			<div class="dropdown-menu">
				<a id="dropdownDeleteAllSend" class="dropdown-item" href="javascript:void(0)">전체 삭제</a>
				<a id="dropdownDeleteCheck" class="dropdown-item" href="javascript:void(0)">선택 삭제</a>
				<a id="dropdownDeleteSendRead" class="dropdown-item" href="javascript:void(0)">상대방이 읽은 쪽지만 삭제</a>
			</div>
		</div>
	</nav>
	<section>
		<div class="alert_area">
			<div>
				<span>보낸 쪽지</span><span id="totalCount"> ${msgTotalCount}통</span>
			</div>
		</div>
		<!-- 쪽지 정렬 테이블 -->
		<form id="deleteForm" action="/message/deleteCheckMessage.do" method="POST">
		<table>
			<c:forEach items="${list }" var="msg">
				<c:if test="${msg.messageCheck == 0 }">
					<tr message_no="${msg.messageNo}">
						<td class="check_area" style="display: none;"><input type="checkbox" name="messageNo" id="checkNo" value="${msg.messageNo}"></td>
						<td class="envelope_icon_area"><i class="far fa-envelope"></i></td>
				</c:if>
				<c:if test="${msg.messageCheck != 0 }">
					<tr class="opened" message_no="${msg.messageNo}">
						<td class="check_area" style="display: none;"><input type="checkbox" name="messageNo" id="checkNo" value="${msg.messageNo}"></td>
						<td class="envelope_icon_area"><i class="far fa-envelope-open"></i></td>
				</c:if>
				<td class="msg_content_area"><a id="msgTitle"
					href="/message/viewSendMessage.do?messageNo=${msg.messageNo}">${msg.messageContent }</a>
				</td>
				<td class="msg_date_area">
					<div>
						<a href="/message/write.do?receiver=${msg.messageReceiver}"
							id="sender" data-toggle="tooltip" data-placement="right"
							title="메시지 보내기">${msg.messageReceiver }</a> <span>${msg.sendDate }</span>
					</div>
				</td>
				<td class="delete_icon_area"><i class="far fa-trash-alt deleteIcon"></i></td>
				</tr>
			</c:forEach>
		</table>
		</form>
	</section>
</body>
<script src="/src/js/jquery/jquery-3.5.1.js"></script>
<script src="/src/js/bootstrap/popper.min.js"></script>
<script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
<script>
</script>
<script>
	$(".deleteIcon")
			.click(
					function(event) {
						event.stopPropagation();
						const messageNo = $(this).parent().parent().attr(
								"message_no");
						const sender = $(this).parent().prev().children()
								.children("a").eq(0).html();
						if (confirm(sender
								+ "님에게 보낸 쪽지를 나의 쪽지함에서 삭제하시겠습니까? \r\n(상대방 쪽지함에는 영향을 주지 않습니다.)")) {
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

	function messageView(event){
		event.stopPropagation();
		const messageNo = $(this).attr("message_no");
		location.href = "/message/viewSendMessage.do?messageNo=" + messageNo;
	}
</script>
<script src="/src/js/message/deleteMessage.js"></script>
</html>
