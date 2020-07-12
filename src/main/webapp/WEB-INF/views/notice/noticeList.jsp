<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 비 로그인시 알람 부트스트랩  -->
<script src="/src/js/jquery/jquery-3.5.1.js"></script>
<script src="/src/js/bootstrap/popper.min.js"></script>
<script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- 아이콘 키값 -->
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
<!-- 스타일시트 -->
<link rel="stylesheet" href="/src/css/notice/noticeList/noticeList.css" />
<!-- CSS here -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
		<div class="mainNotice">
			<div class="maintitle">
				<h4>
					Travelego<br>공지사항
				</h4>
			</div>
			<div class="mainContent">
			<c:if test="${sessionScope.member.memberLevel==3 }">
				<a href="/noticeInsertFrm.do">
				<input class="btn btn-outline-secondary" id="insertBtn"
					type="button" value="글쓰기"></a>
				<form action="/noticeDelete.do" method="post">
				<input class="btn btn-outline-secondary" id="delBtn" type="button" value="체크게시물 삭제">
				</c:if>
				<table class="table table-hover">
					<tr>
						<th class="noticetitle">내용</th>
						<th class="regdate">등록일</th>
						<th class="readcount">조회수</th>
						<th class="delchkbox"></th>
					</tr>
					<c:forEach items="${list }" var="n">
						<tr>
							<td class="noticetitle"><div><div class="listTitle"><a
								href="/noticeView.do?noticeNo=${n.noticeNo}"
								value="${n.noticeNo}">${n.noticeTitle}</a></div></div></td>
							<td class="regdate">${n.noticeDate}</td>
							<td class="readcount">${n.readCount }</td>
							<c:if test="${sessionScope.member.memberLevel==3 }">
							<td class="delchkbox"><input name="noticeNo" type="checkbox" value="${n.noticeNo }"></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
				</form>
				 <input type="hidden" name="reqPage" id="reqPage" value=1>
				<div class="pageNavi">${pageNavi}</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script >
	var checkedbox = $("input[name='noticeNo']:checked"); //페이지 로딩되면서 한번 저장되고 이후에 변경되지 않으므로 전역변수 사용 불가능
	var messge="선택한 게시물을 삭제하시겠습니까?";
	$("#delBtn").click(function(){
		delcomfirm = window.confirm(messge);
		if(delcomfirm){
			if($("input[name='noticeNo']:checked").length == 0){
				alert("선택된 게시글이 없습니다");
			} else {
				$(".mainContent form").submit();
			}
		}
	});
</script>
</html>