<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="UTF-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 비 로그인시 알람 부트스트랩  -->
<script src="/src/js/jquery/jquery-3.5.1.js"></script>
<script src="/src/js/bootstrap/popper.min.js"></script>
<script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="/src/imgs/header/favicon.png" />
<!-- Place favicon.ico in the root directory -->
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
<!-- CSS here -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<title>Travelego</title>
<style>
.section-top>div {
	float: left;
}

.section-top {
	border-bottom: 1px solid gray;
	overflow: hidden;
}

.page-title {
	width: 100%;
	height: 100px;
	overflow: hidden;
}

.page-title>h1 {
	line-height: 100px;
	height: 100%;
	margin: 0;
	padding: 0;
	margin-left: 20px;
}

.mainImg {
	margin: 20px;
	width: 300px;
	height: 300px;
	border: 1px solid gray;
	border-radius: 10px;
	overflow: hidden;
	box-sizing: border-box;
}

.mainImg>label {
	width: 100%;
	height: 100%;
	font-size: 20px;
	text-align: center;
	line-height: 290px;
	overflow:hidden;
	margin:0;
}
#img-view{
	width:300px;
	height:300px;
	border-radius: 10px;
}

.itemInfo {
	margin: 30px;
}

.itemInfo>table th:first-child {
	width: 120px;
	height: 60px;
	font-size: 20px;
	line-height: 20px;
}

.itemInfo>table select {
	width: 200px;
	height: 30px;
}

.itemInfo>table input {
	width: 300px;
	height: 30px;
}

.section-content {
	width: 100%;
	overflow: hidden;
	margin-top: 20px;
	margin-bottom:20px;
}

.date, .cal {
	float: left;
	width: 260px;
	overflow:hidden;
}

.cal>input {
	width: 100%;
}

.date {
	line-height: 250px;
	text-align: center;
}

.time {
	margin-left: 20px;
	float: left;
	width: 600px;
	overflow:hidden;
}

.time>label>span {
	color: black;
	float: left;
	width: 90px;
	height: 50px;
	border: 1px solid gray;
	box-sizing: border-box;
	font-size: 20px;
	line-height: 50px;
	text-align: center;
}

.time>input:checked+label>span {
	background-color: #25e6b5;
}

.section-bottom {
	width: 100%;
	margin-left:40%;
	margin-top:20px;
	overflow: hidden;
}

#submit-btn {
	width: 100px;
	height: 50px;
	diplay: inline-block;
	margin:10px;
	background-color: #25e6b5;
	border: 0;
	border-radius: 5px;
}

#submit-btn:hover {
	background-color: #25e6ff;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<section>
		<!-- 여기서부터 작성하시면 됨!!!!!!! -->
		<div class="page-title">
			<H1>상품수정</H1>
		</div>
		<form action="/modifyTour.do" method="post" enctype="multipart/form-data">
			<div class="section-top">
				<input type="hidden" name="memberId" value="${tv.memberId }">
				<input type="hidden" name="itemNo" value="${tv.itemNo }">
				<input type="hidden" name="filepath" value="${tv.filepath }">
				<div class="mainImg">
					<input id="file" type="file" name="file" onchange="loadImg(this);" hidden>
					<label for="file" id="thumnail"><img id="img-view" src="../../../upload/images/tour/thumnail/${tv.filepath }"></label>
				</div>
				<div class="itemInfo">
					<table>
						<tr>
							<th>나라</th>
							<td>
								<span>${tv.regionCountry }</span>
							</td>
						</tr>
						<tr>
							<th>도시</th>
							<td>
								<span>${tv.regionCity }</span>
							</td>
						</tr>
						<tr>
							<th>상품 이름</th>
							<td colspan="2"><input type="text" name="itemTitle" value="${tv.itemTitle }"></td>
						</tr>
						<tr>
							<th>1회 최대인원<h6>(1명이상)</h6></th>
							<td colspan="2"><input type="number" name="maxPerson"
								style="width: 100px; text-align:right;" min=0 value=${tv.maxPerson }>명</td>
						</tr>
						<tr>
							<th>상품 가격</th>
							<td colspan="2"><input type="number" name="itemPrice"
								style="text-align: right" min=0 value=${tv.itemPrice }>원</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="section-content">
				<div class="date">상품 기간&시간 설정</div>
				<div class="cal">
					<input readonly placeholder="시작날짜와 끝날짜를 선택해주세요" name="beginEnd"
						type="text" data-range="true" data-multiple-dates-separator="~"
						data-language="en" class="datepicker-here"/>
				</div>
				<div class="time">
					<p>해당 상품이 시작하는 시간들을 선택해주세요</p>
					<c:forEach var="i" begin="0" end="23" step="1">
						<input type="checkbox" name="tourTimes" value="${i }"
							id="time${i }" hidden>
						<label for="time${i }"><span>${i }:00시</span></label>
					</c:forEach>
				</div>
			</div>
			<div class="section-editor">
				<textarea name="itemContent" id="editor" rows="10" cols="80">${tv.itemContent }</textarea>
			</div>
			<div class="section-bottom">
				<input class="btn btn-primary btn-lg" type="submit" value="상품 수정">
				<input id="cancel" class="btn btn-danger btn-lg" type="reset" value="취소">
			</div>
		</form>
	</section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Modal -->
	<div class="modal fade custom_search_pop" id="exampleModalCenter"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="serch_form">
					<input type="text" placeholder="Search" />
					<button type="submit">search</button>
				</div>
			</div>
		</div>
	</div>
	<!-- JS here -->
	<script src="/src/js/header/vendor/modernizr-3.5.0.min.js"></script>
	<!-- <script src="/src/js/header/vendor/jquery-1.12.4.min.js"></script>
	<script src="/src/js/header/popper.min.js"></script> -->
	<script src="/src/js/header/owl.carousel.min.js"></script>
	<script src="/src/js/header/isotope.pkgd.min.js"></script>
	<script src="/src/js/header/ajax-form.js"></script>
	<script src="/src/js/header/waypoints.min.js"></script>
	<script src="/src/js/header/jquery.counterup.min.js"></script>
	<script src="/src/js/header/imagesloaded.pkgd.min.js"></script>
	<script src="/src/js/header/scrollIt.js"></script>
	<script src="/src/js/header/jquery.scrollUp.min.js"></script>
	<script src="/src/js/header/wow.min.js"></script>
	<!-- <script src="/src/js/header/nice-select.min.js"></script> -->
	<script src="/src/js/header/jquery.slicknav.min.js"></script>
	<script src="/src/js/header/jquery.magnific-popup.min.js"></script>
	<script src="/src/js/header/plugins.js"></script>
	<script src="/src/js/header/gijgo.min.js"></script>
	<script src="/src/js/header/slick.min.js"></script>

	<!--contact js-->
	<script src="/src/js/header/contact.js"></script>
	<script src="/src/js/header/jquery.ajaxchimp.min.js"></script>
	<script src="/src/js/header/jquery.form.js"></script>
	<script src="/src/js/header/jquery.validate.min.js"></script>
	<script src="/src/js/header/mail-script.js"></script>
	<script src="/src/js/header/main.js"></script>
	<script>
		function loadImg(f){
			if(f.files.length!=0 && f.files[0]!=0){
				var reader = new FileReader();
				reader.readAsDataURL(f.files[0]);
				reader.onload = function(e){
					$("#thumnail").html("<img id='img-view' src='"+e.target.result+"'>");
				}
			}else{
				$("#thumnail").html("대표 이미지를 등록해주세요");
			}
		};
		
		$(function() {
			$('[data-toggle="popover"]').popover();
		});

		$("#datepicker").datepicker({
			iconsLibrary : "fontawesome",
			icons : {
				rightIcon : "_$tag___________________________$tag__",
			},
		});
	</script>
	<script src="/src/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(function() {
			var beginDate = new Date();
			beginDate.setDate(beginDate.getDate()+1);
			var html;
			
			var tourBeginDate  = "${tv.beginDate}";
	        var tourEndDate = "${tv.endDate}";
	        var yyyy = tourBeginDate.substr(0, 4);
	        var mm = tourBeginDate.substr(5, 2);
	        var dd = tourBeginDate.substr(8, 2);
	        tourBeginDate = new Date(yyyy, mm - 1, dd);
	        yyyy = tourEndDate.substr(0, 4);
	        mm = tourEndDate.substr(5, 2);
	        dd = tourEndDate.substr(8, 2);
	        tourEndDate = new Date(yyyy, mm - 1, dd);
	        
	        var tourTimes = "${tv.tourTimes}";
	        var timeArray = tourTimes.split(",");
	        
	        for(var i=0; i<timeArray.length; i++){
	        	$("input[name=tourTimes]").each(function(index,item){
	        		if($(item).val()==timeArray[i]){
	        			$(item).prop("checked",true);
	        		}
	        	});
	        }
			
			$('input[name=beginEnd]').datepicker({
			    language: 'en',
			    minDate:beginDate
			});
			
			$('input[name=beginEnd]').data('datepicker').selectDate(tourBeginDate);
			$('input[name=beginEnd]').data('datepicker').selectDate(tourEndDate);
			
			CKEDITOR.replace("editor", {
				width : '100%',
				height : '1000px',
				filebrowserUploadUrl : "/uploadImage.do"
			});
			
			var content = $("#editor").html();
			console.log(content);
			//CKEDITOR.instances.editor.setData("<img id='img-view' src='../../../upload/images/tour/thumnail/${tv.filepath }'>");
			
			$("#regionCountry").change(function(){
				var regionCountry = $(this).val();
				if(regionCountry=="default"){
					$("#regionCity").html("<option value=0>도시 선택");
				}
				else{
					$.ajax({
						url : "/selectCityList.do",
						data: {regionCountry:regionCountry},
						type : "post",
						success : function(data){
							$("#regionCity").html("");
							html = "";
							html += "<option value=0>도시 선택";
							for(var i=0; i<data.length; i++){
								html += "<option value="+data[i].regionNo+">"+data[i].regionCity;
							}
							$("#regionCity").append(html);
						},error : function(){
							console.log("ajax 통신 실패");
						}
					});
				}
			});
			
			$("form").submit(function(){
				var expDate = /^[0-9]{4}\W{1}[0-9]{2}\W{1}[0-9]{2}~[0-9]{4}\W{1}[0-9]{2}\W{1}[0-9]{2}$/;
				var content = CKEDITOR.instances['editor'].getData();
				if($("#file").val()==""){
					if(!document.getElementById("img-view")){
						alert("대표 사진을 등록해주세요");
						$('html, body').animate({scrollTop : $("#file").offset().top}, 400);
						return false;
					}
				}
				if($("#regionCity").val()==0){
					alert("상품의 지역을 선택해주세요");
					$('html, body').animate({scrollTop : $("#file").offset().top}, 400);
					return false;
				}
				if($("input[name='itemTitle']").val()==""){
					alert("상품 이름을 입력해주세요");
					$('html, body').animate({scrollTop : $("#file").offset().top}, 400);
					return false;
				}
				if($("input[name='maxPerson']").val()==0){
					alert("해당 투어의 1회 최대 인원을 설정해주세요(1명 이상)");
					$('html, body').animate({scrollTop : $("#file").offset().top}, 400);
					return false;
				}
				if(!expDate.test($("input[name='beginEnd']").val())){
					alert("상품판매 기간을 설정해주세요");
					$('html, body').animate({scrollTop : $("input[name='itemTitle']").offset().top}, 400);
					return false;
				}
				var cnt=0;
				$("input[name=tourTimes]").each(function(index,item){
					if($(item).prop("checked")){
						cnt++;
					}
				});
				if(cnt==0){
					alert("투어 시작 시간들을 정해주세요");
					$('html, body').animate({scrollTop : $("input[name='itemTitle']").offset().top}, 400);
					return false;
				}
				if(content==""||CKEDITOR.instances['editor'].getData().length==0){
					alert("상품의 내용을 입력해주세요");
					$('html, body').animate({scrollTop : $("input[name='beginEnd']").offset().top}, 400);
					return false;
				}
				return true;
			});
			$("#cancel").click(function(){
				location.href="/comTourList.do";
			});
		});
	</script>
	<!-- datepicker -->
	<link href="/src/dist/css/datepicker.min.css" rel="stylesheet"
		type="text/css">
	<script src="/src/dist/js/datepicker.min.js"></script>
	<script src="/src/dist/js/i18n/datepicker.en.js"></script>
</body>
</html>
