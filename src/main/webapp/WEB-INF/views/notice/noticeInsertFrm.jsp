<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
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
<link rel="stylesheet" href="/src/css/notice/noticeInsertFrm/noticeInsertFrm.css" />
<!-- CSS here -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<!-- ck 에디터 사용 -->
<script src = "/src/ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<div class="mainWrite">
	<form action="/noticeInsert.do" method="get">
		<div class="writeHeader">
		<table class="titletable">
			<tr>
				<th class="tableTitle">제목</th>
				<td><input type="text" class="form-control" id="noticeTitle" name="noticeTitle" placeholder="제목란"></td>
			</tr>
		</table>
		</div>
		<hr>
		<div class="writeContent">
			<textarea rows="20" cols="50" id ="editor" name ="noticeContent"  style="resize: none;"></textarea>
		</div>
		<div class="Btnbox">
			<button type="submit" class="btn btn-primary">공지사항 게시</button>
			<button type="reset" class="btn btn-outline-primary">공지사항 초기화</button> 
		</div>
	</form>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
 <script>
                // Replace the <textarea id="editor1"> with a CKEditor 4
                // instance, using default configuration.
               CKEDITOR.replace("editor", {
            width : '100%',
            height : '600px',
            filebrowserUploadUrl : "/uploadImage.do"
         });
     </script>
</html>