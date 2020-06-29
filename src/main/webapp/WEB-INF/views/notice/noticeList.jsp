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
				<a href="/noticeInsertFrm.do">
				<input class="btn btn-outline-secondary" id="insertBtn"
					type="button" value="글쓰기"></a>
					<form action="" method="post">
				<input class="btn btn-outline-secondary" id="delBtn" type="button" value="체크게시물 삭제">
				</form>
				<table class="table table-hover">
					<tr>
						<th class="noticetitle">내용</th>
						<th class="regdate">등록일</th>
						<th class="readcount">조회수</th>
						<th class="delchkbox"></th>
					</tr>
					<c:forEach items="${list }" var="n">
						<tr>
							<td class="noticetitle"><a
								href="/noticeView.do?noticeNo=${n.noticeNo}"
								value="${n.noticeNo}">${n.noticeTitle}</a></td>
							<td class="regdate">${n.noticeDate}</td>
							<td class="readcount">${n.readCount }</td>
							<td class="delchkbox"><input name="checkbox" type="checkbox" value="${n.noticeNo }"></td>
						</tr>
					</c:forEach>
				</table>
				 <input type="hidden" name="reqPage" id="reqPage" value=1>
				<div class="pageNavi">${pageNavi}</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script >
	var checkedbox = $("input[name='checkbox']:checked").length;
	var messge="선택한 게시물을 삭제하시겠습니까?";
	$("#delBtn").click(function(){
		delcomfirm = window.confirm(messge);
		if(delcomfirm==true){
			for(i=0;i<checkedbox.length;i++){
				console.log("1");
				if(checkedbox[i].checked==true){
					var delbox = checkedbox[i];
					console.log("2");
					console.log(delbox);
				$("form").submit(function(){
					console.log("3");
					return delbox;
				})
				}
			}
		}
	});
</script>
</html>