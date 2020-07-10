<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<link rel="stylesheet" href="/src/css/notice/noticeView/noticeView.css" />
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
			<div class="tablediv">
			<div class="btnbox">
			<a href="/noticemodify.do?noticeNo=${notice.noticeNo }"><input type="button" class="btn btn-outline-secondary" id="modiBtn" value="공지사항수정"></a>
			</div>
				<table class="Viewheader">
					<tr>
						<th class="noticetitle">제목</th>
						<td class="mainnoticetitle"><div><div><div  class="noticetitlediv">${notice.noticeTitle }</div></div></div></td>
						<th class="noticeDate">등록일</th>
						<td class="mainNoticeDate"> ${notice.noticeDate }</td>
						<th class="readcount">조회수</th>
						<td class="mainreadcount">${notice.readCount}</td>
					</tr>	
				</table>
				</div>
				<div class="noticeContent">${notice.noticeContent}</div>
			</div>
			<div class="listBtn">
				<a href="/noticeList.do?reqPage=1"><input id="nlBtn" class="btn btn-outline-secondary" type="button" value="돌아가기"></a>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>