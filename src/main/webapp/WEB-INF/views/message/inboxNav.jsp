<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<a class="dropdown-item" href="#">전체 삭제</a> <a class="dropdown-item"
				href="#">선택 삭제</a> <a class="dropdown-item" href="#">읽은 쪽지만 삭제</a>
		</div>
	</div>
</nav>