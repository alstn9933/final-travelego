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
<script src="/src/js/spotCss/jquery.dd.min.js"></script>
<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="/src/imgs/header/favicon.png" />
<!-- Place favicon.ico in the root directory -->
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
<!-- CSS here -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<link rel="stylesheet" href="/src/js/spotCss/dd.css" />
<title>Admin</title>
<style></style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<section>
		<style>
<!--
이미지 업로드 css -->.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	/* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

/* imaged preview */
.filebox .upload-display {
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap {
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img {
	display: block;
	max-width: 150%;
	width: 100% \9;
	height: auto;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}

.admin_page {
	padding-top: 100px;
	padding-left: 100px;
	font-family: "Lato", sans-serif;
}

.admin_sidebar {
	margin-top: 15%;
	height: 40%;
	width: 200px;
	position: fixed;
	top: 0;
	left: 0;
	background-color: white;
	padding-top: 60px;
}

.admin_sidebar a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
}

.admin_sidebar a:hover {
	color: #f1f1f1;
}

main .admin_sidebar {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

.material-icons, .admin_title {
	vertical-align: middle;
}

.material-icons {
	margin-right: 30px
}

.dd .ddChild li img {
	width: 50px;
}

#Contents {
	padding: 16px;
	margin-left: 50px;
}

.dd .ddTitle .ddTitleText img {
	width: 50px;
}

@media screen and (max-height: 450px) {
	.admin_sidebar {
		padding-top: 15px;
	}
	.admin_sidebar a {
		font-size: 18px;
	}
}

#delRegion {
	width: 50px;
	height: 30px;
	margin-left: 100px;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	text-align: center;
	border-radius: 10px;
	cursor: pointer;
}

#addSubmit {
	width: 100px;
	height: 30px;
	margin-left: 100px;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	text-align: center;
	border-radius: 10px;
	cursor: pointer;
}
#citySel{
	margin-top:10px;
}
#Contents{
background-color: #E2E2E2;
width: 360px;
height: 400px;
}

@media screen and (max-width: 1000px) {
	#mySidebar {
		display: none;
	}
}

</style>
		<script>
			$(function() {

				$("#citySel").on(
						"change",
						"#citySelect",
						function() {
							var countrySelect = $("#countrySelect").val();
							$("#regionCountry").val(countrySelect).attr(
									"readOnly", true);
							var city = $(this).val();
							if (countrySelect != "insertCountry"
									&& city != "insertCity") {
								$("#delRegion").show();
							} else {
								$("#delRegion").hide();
							}

						});
				$("#addRegion").hide();
				//     	$("#countrySelect").change(function(){
				//     	 var val = $(this).val();
				//     	 var val2 =   $("#countrySelect").val();

				//     	 if(val == "insert" && val2=="insertCountry"){
				//     		 $("#addRegion").show();
				//     		 $(".hid").show();
				//     		 $("#regionCountry").val("");
				//     		 $("#regionCountry").attr("readonly",false);
				//     		 $("#delRegion").hide();
				//     	 }else if(val == "insert"){
				//     		 $("#addRegion").show();
				//     		 $("#delRegion").hide();
				//     		 $("#regionCountry").val(val2);
				//     		 $("#regionCountry").attr("readonly",true);

				//     	 }else{
				//     		 $("#delRegion").show();
				//     		 $("#addRegion").hide();
				//     	 }
				//     	});

				//      $("#countrySelect").change(function () {
				//     	 $("#addRegion").hide();
				//     	 $("#delRegion").hide();
				// 	})   

				//    	 $("#addRegion").hide();
				$("#delRegion").hide();
				$("#delRegion").click(
						function() {
							var val = $(".citySelect").val();
							var val2 = $(".citySelect option:selected").attr(
									"data-id");
							if (val != "insert" && val != "") {
								$.ajax({
									type : "POST",
									url : "/deleteReg.do",
									data : {
										regionNo : val, // 해당 대분류 값을 넘겨 중분류 검색하기 위해
										filename : val2
									},

									success : function(result) {//성공하면 값 받기 리스트로 넘겨받기
										if (result == "2" || result=="1") {

											alert("삭제 성공");
											location.reload();
										} else {
											alert("삭제실패");
										}
									},
									error : function(data) {
										alert("시스템 오류 입니다.\n 관리자에게 문의 바랍니다.");
									}
								});
							}
						})

				$("#countrySelect")
						.change(
								function() { // 대분류가 변경되면
									$("#addRegion").hide();
									var regionCountry = $(
											"#countrySelect>option:selected")
											.val();
									console.log(regionCountry);
									$
											.ajax({
												type : "POST",
												url : "/middleList.do",
												data : {
													regionCountry : regionCountry
												},

												success : function(result) {
													var resultMap = result;
													console.log(result);
													$("#citySel").empty();
													var citySelect = $("<select name='citySelect' id='citySelect' class='citySelect' style='width: 300px;'>");
													var List = result;
													console.log(result);
													if (List.length > 0) {

														//                           addOption += "<option value='' title='선택'>선택</option>";
														var addOption = "";

														citySelect
																.append("<option value=''>----국가를 선택해주세요---</option>");
														for (var cd = 0; cd < List.length; cd++) {
															addOption = "";
															addOption += "<option data-id='"+List[cd].filename+"' data-image='/upload/images/region/"+List[cd].filename+"' value = '"
                                +List[cd].regionNo +"'>"
																	+ List[cd].regionCity
																	+ "</option>";
															// 값과 강원도는 알아서 해당 db 변수값으로 넣고
															console
																	.log(addOption);
															citySelect
																	.append(addOption);

														}
														citySelect
																.append("<option value='insertCity' id='insertCity' >----도시 직접 입력---</option>");
														$("#delRegion").hide();
													} else {
														addOption = "<option value='' title='선택'>--- 도시를 선택해주세요 ---</option>";

														citySelect
																.append("<option value='insert' >----도시 직접 입력---</option>");
														//                          regText.replace(/\s/gi, "");  
														$("#delRegion").show();
														$("#delRegion").hide();

													}
													$("#citySel").append(
															citySelect);
													$('.citySelect')
															.msDropDown();
													citySelect
															.parent()
															.next()
															.find("li")
															.click(
																	function() {
																		if ($(
																				this)
																				.children()
																				.eq(
																						0)
																				.html() == "----도시 직접 입력---") {
																			$(
																					"#addRegion")
																					.show();
																		} else {
																			$(
																					"#addRegion")
																					.hide();
																		}

																	});

												},
												error : function(data) {
												}
											});

								});

			});
			$("#insertCountry").click(function() {
				$("#addRegion").show();
			})
		</script>
		<script>
			$(document)
					.ready(
							function() {
								var fileTarget = $('.filebox .upload-hidden');

								fileTarget
										.on(
												'change',
												function() {
													if (window.FileReader) {
														// 파일명 추출
														var filename = $(this)[0].files[0].name;
													}

													else {
														// Old IE 파일명 추출
														var filename = $(this)
																.val().split(
																		'/')
																.pop().split(
																		'\\')
																.pop();
													}
													;

													$(this).siblings(
															'.upload-name')
															.val(filename);
												});

								//preview image 
								var imgTarget = $('.preview-image .upload-hidden');

								imgTarget
										.on(
												'change',
												function() {
													var parent = $(this)
															.parent();
													parent.children(
															'.upload-display')
															.remove();

													if (window.FileReader) {
														//image 파일만
														if (!$(this)[0].files[0].type
																.match(/image\//))
															return;

														var reader = new FileReader();
														reader.onload = function(
																e) {
															var src = e.target.result;
															parent
																	.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
														}
														reader
																.readAsDataURL($(this)[0].files[0]);
													}

													else {
														$(this)[0].select();
														$(this)[0].blur();
														var imgSrc = document.selection
																.createRange().text;
														parent
																.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

														var img = $(this)
																.siblings(
																		'.upload-display')
																.find('img');
														img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
																+ imgSrc
																+ "\")";
													}
												});
							});
		</script>
		<script>
			$(function() {
				$("#regionCountry").keyup(function() {
					var str = $(this).val();
					str = str.replace(/ /gi, "");
					$(this).val(str);
				});
				$("#regionCity").keyup(function() {
					var str = $(this).val();
					str = str.replace(/ /gi, "");
					$(this).val(str);
				});
			});
			function frmsubmit() {
				var file = $("#addFile").val();
				if (file == null || file == "") {
					alert("파일을 등록해주세요");
					return false;
				} else {
					return true;
				}

			}
		</script>

		<div class="admin_page">
			<link rel="stylesheet"
				href="https://fonts.googleapis.com/icon?family=Material+Icons" />

			<div id="mySidebar" class="admin_sidebar">
				<a href="/memberManagement.do?reqPage=1"><span
					class="admin_title" >회원 관리</span></a><a href="/spot_managenet.do"><span
						class="admin_title" style="color: black" >여행지 관리</span><br></a> <a
					href="/adminQnaList.do" ><span class="admin_QA">회원문의사항</span></a>
				<a href="/reportList.do"><span class="admin_title">신고글 관리</span></a>
			</div>
			<div id="Contents" style="float:right;">
				<!-- 국가 추가 -->
				<select name="countrySelect" id="countrySelect"
					style="width: 300px; height: 40px;">
					<option value="선택된국가가 없습니다" selected>--- 국가를 선택해주세요 ---</option>
					<c:forEach items="${rList}" var="con">
						<option value="${con.regionCountry }">${con.regionCountry}</option>
					</c:forEach>
					<option value="insertCountry" name="insertCountry"
						id="insertCountry">--국가 직접 입력--</option>

				</select>
				<!-- 도시 입력 -->
				<form name="city">
					<div id="citySel"></div>

				</form>
				<br>

				<form method="post" enctype="multipart/form-data" id="addRegion"
					style="display: none;" name="addRegion" action="/insertCity.do"
					onsubmit='return frmsubmit();'>
					<span class="hid"> 국가 : <input type="text"
						name="regionCountry" id="regionCountry" value="" onkeyup>
					</span> 
					<br>
					
					도시 : <input type="text" name="regionCity" id="regionCity"style="margin-top:10px;"><br>

					<div class="filebox bs3-primary preview-image">
						<input class="upload-name" value="파일선택" disabled="disabled"
							style="width: 160px;"> <label for="addFile"
							style="margin-top: 10px">업로드</label> <input type="file"
							name="file" id="addFile" class="upload-hidden"
							style="display: none;">
					</div>
					<br> <input type="submit" value="추가히기"
						style="margin-left: 100px; border:1px solid black" id="addSubmit">
				</form>
				<button id="delRegion" style="display: none;">삭제</button>
				<br> <br>
				
				</div>
				<br>
				<div>
				<pr>
				1.국가와 지역을 둘 다 추가 하는 기능이 있습니다.<br><br>
				2.지역만 추가 하시고 싶으 실 경우 국가 선택 후 지역 추가 하기 버튼을<br> &nbsp;&nbsp;눌러 
				   주시면 됩니다.<br><br>
				3.지역을 삭제 하시고 싶으시다면 국가 선택 후 삭제 하시고 싶은 지역 선택 후 <br> &nbsp;&nbsp;&nbsp;삭제 버튼을 눌러 주시면 됩니다.
				<pr>
				</div>
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
	<!--     <script src="/src/js/header/nice-select.min.js"></script> -->
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
</body>
</html>