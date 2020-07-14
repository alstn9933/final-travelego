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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- Modal 관련 링크 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<!-- 비 로그인시 알람 부트스트랩  -->
<script src="/src/js/jquery/jquery-3.5.1.js"></script>
<script src="/src/js/bootstrap/popper.min.js"></script>
<script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
<script src="/src/ckeditor/ckeditor.js"></script>

<!-- 셀렉트 부트스트랩 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- 수민 버튼 부트스트랩 -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  

<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=80d7303a0a0952e6d0ad4b9188ef090b&libraries=services"></script>

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
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	display: none;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 300px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

#cke_1_contents{
	height:1000px;
}
</style>
<script>
  	$(function(){
  		$("#regionCountry").change(function(){
  			$("#regionCity").html("");
  			$("#regionCity").show();
  			var country = $(this).val();
  			$.ajax({
  				url : "/selectCity.do",
  				data : {country : country},
  				type : "post",
  				dataType:"json",
  				success : function(data){
  					for(var i=0;i<data.length;i++){
  						$("#regionCity").append("<option value='"+data[i].regionNo+"'>"+data[i].regionCity+"</option>");
  					}
  				},
  				error:function(){
  					console.log("ajax 실패");
  				}
  			});
  		});
  	});
  </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<section>
			<div class="option">
				<div>
				<!-- form이 제출되면서 페이지가 바뀌지 않게 하기 위해 return false; -->
					<form onsubmit="searchPlaces(); return false; showMapList();">
						<input type="text" id="keyword" size="100" name="place"
							placeholder="추천하는 장소를 입력하세요" style="width:50%;" required>
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<div class="map_wrap">
				<div id="menu_wrap" class="bg_white">
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
				<div id="map"
					style="width: 74%; height: 100%; position: relative; overflow: hidden; float: right; display: none; visibility: hidden;"></div>
				<div id="realMap"
					style="width: 74%; height: 100%; position: relative; overflow: hidden; float: right;"></div>
			</div>
			<hr>
			<form id="complete" action="/recWrite.do" method="post">
			<input type="hidden" id="coords" name="coords">
			<input type="hidden" id="place" name="place">
			<input type="hidden" id="photo" name="photo">
			<div>
				여행지역
				<select id="regionCountry" name="regionCountry" class="custom-select custom-select-sm" style="width:150px;">
					<!-- <option value="국내" style="font-weight: bold">국내</option>
					<optgroup label="해외"> -->
					<option value="지역선택" id="selectR">지역선택(필수)</option>
						<c:forEach items="${country}" var="r">
							<option value="${r.regionCountry }">${r.regionCountry }</option>
						</c:forEach>
					<!-- </optgroup> -->
				</select>
				<select id="regionCity" name="regionNo" class="custom-select custom-select-sm" style="width:150px; display:none;">
				
				</select>
				카테고리
				<select id="recCategory" name="recCategory" class="custom-select custom-select-sm" style="width:150px;">
					<option value="1">맛집</option>
					<option value="2">카페</option>
					<option value="3">숙소</option>
					<option value="4">관광지</option>
					<option value="5">액티비티</option>
				</select>
			</div>
			<hr>
				<input	type="text" id="recTitle" name="recTitle" placeholder="제목을 입력해주세요" style="width:100%;" required><br>
				<hr>
				<div id="cont">
					<textarea rows="10" cols="50" name="recContent" id="editor" required></textarea>
				</div>
				<br>
				<div style="text-align:center; margin:40px auto;">
				<button class="board btn btn-info">등록</button>
				</div>
			</form>
			<script>
				// 마커를 담을 배열입니다
				var markers = [];
				var spotName;
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();

				// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					zIndex : 1
				});

				// 키워드로 장소를 검색합니다
				//searchPlaces();

				/* function showMapList(){
					$(".map_wrap").css("display","block");
				}; */
				
				// 키워드 검색을 요청하는 함수입니다
				function searchPlaces() {
					if($("#keyword").val() == ""){
						alert("검색어를 입력하세요");
					}else{
					$(".map_wrap").css("display","block");
					var keyword = document.getElementById('keyword').value;

					if (!keyword.replace(/^\s+|\s+$/g, '')) {
 				//		alert('키워드를 입력해주세요!');
						return false;
					}

					// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
					ps.keywordSearch(keyword, placesSearchCB);
					$("#keyword").val("");
					}
				};

				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {

						// 정상적으로 검색이 완료됐으면
						// 검색 목록과 마커를 표출합니다
						displayPlaces(data);

						// 페이지 번호를 표출합니다
						displayPagination(pagination);

					} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

						alert('검색 결과가 존재하지 않습니다.');
						return;

					} else if (status === kakao.maps.services.Status.ERROR) {

						alert('검색 결과 중 오류가 발생했습니다.');
						return;

					}
				}

				// 검색 결과 목록과 마커를 표출하는 함수입니다
				function displayPlaces(places) {

					var listEl = document.getElementById('placesList'), menuEl = document
							.getElementById('menu_wrap'), fragment = document
							.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

					// 검색 결과 목록에 추가된 항목들을 제거합니다
					removeAllChildNods(listEl);

					// 지도에 표시되고 있는 마커를 제거합니다
					removeMarker();

					for (var i = 0; i < places.length; i++) {

						// 마커를 생성하고 지도에 표시합니다
						var placePosition = new kakao.maps.LatLng(places[i].y,
								places[i].x), marker = addMarker(placePosition,
								i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						bounds.extend(placePosition);

						// 마커와 검색결과 항목에 mouseover 했을때
						// 해당 장소에 인포윈도우에 장소명을 표시합니다
						// mouseout 했을 때는 인포윈도우를 닫습니다
						(function(marker, title) {
							kakao.maps.event.addListener(marker, 'mouseover',
									function() {
										displayInfowindow(marker, title);
									});

							kakao.maps.event.addListener(marker, 'mouseout',
									function() {
										infowindow.close();
									});

							itemEl.onmouseover = function() {
								displayInfowindow(marker, title);
							};

							itemEl.onmouseout = function() {
								infowindow.close();
							};
						})(marker, places[i].place_name);

						fragment.appendChild(itemEl);
					}

					// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
					listEl.appendChild(fragment);
					menuEl.scrollTop = 0;

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					map.setBounds(bounds);
				}
				
				var geocoder1 = new kakao.maps.services.Geocoder();
				var callback = function(result, status) {
					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {

						var coords1 = new kakao.maps.LatLng(
								result[0].y, result[0].x);

// 						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
 						map.setCenter(coords1);
						
						var mapContainer1 = document.getElementById('realMap'), // 지도를 표시할 div 
						mapOption1 = {
							center : new kakao.maps.LatLng(result[0].y, result[0].x), // 지도의 중심좌표
							level : 2
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map1 = new kakao.maps.Map(mapContainer1, mapOption1);
						
						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker1 = new kakao.maps.Marker({
							map : map1,
							position : coords1
						});

						// 인포윈도우로 장소에 대한 설명을 표시합니다
						var infowindow1 = new kakao.maps.InfoWindow(
								{
									content : '<div style="width:150px;text-align:center;padding:6px 0;">'+spotName+'</div>'
								});
						infowindow1.open(map1, marker1);
					}
				}
				
				// 검색결과 항목을 Element로 반환하는 함수입니다
				function getListItem(index, places) {
					
					var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
							+ (index + 1)
							+ '"></span>'
							+ '<div class="info">'
							+ '   <h5>' + places.place_name + '</h5>';

					if (places.road_address_name) {
						itemStr += '    <span>' + places.road_address_name
								+ '</span>' + '   <span class="jibun gray">'
								+ places.address_name + '</span>';
					} else {
						itemStr += '    <span>' + places.address_name
								+ '</span>';
					}

					itemStr += '  <span class="tel">' + places.phone
							+ '</span>' + '</div>';
					
					el.innerHTML = itemStr;
					el.className = 'item';
					$(el).click(function() {
						$(this).siblings().css("display","none");
						$("#pagination").css("display","none");
						var selected = $(this).find("span").eq(1).html();
						spotName = $(this).find("h5").html();
						var arr = [selected, spotName];
						geocoder1.addressSearch(selected, callback);
						$("#keyword").val(spotName);
						$("#place").val(spotName);
						$("#coords").val(selected);
						console.log($("#coords").val());
						console.log($("#place").val());
					});
					return el;
				}

				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				function addMarker(position, idx, title) {
					var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
					imgOptions = {
						spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
						spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						offset : new kakao.maps.Point(13, 37)
					// 마커 좌표에 일치시킬 이미지 내에서의 좌표
					}, markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize, imgOptions), marker = new kakao.maps.Marker(
							{
								position : position, // 마커의 위치
								image : markerImage
							});

					marker.setMap(map); // 지도 위에 마커를 표출합니다
					markers.push(marker); // 배열에 생성된 마커를 추가합니다

					return marker;
				}

				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(null);
					}
					markers = [];
				}

				// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
				function displayPagination(pagination) {
					var paginationEl = document.getElementById('pagination'), fragment = document
							.createDocumentFragment(), i;

					// 기존에 추가된 페이지번호를 삭제합니다
					while (paginationEl.hasChildNodes()) {
						paginationEl.removeChild(paginationEl.lastChild);
					}

					for (i = 1; i <= pagination.last; i++) {
						var el = document.createElement('a');
						el.href = "#";
						el.innerHTML = i;

						if (i === pagination.current) {
							el.className = 'on';
						} else {
							el.onclick = (function(i) {
								return function() {
									pagination.gotoPage(i);
								}
							})(i);
						}

						fragment.appendChild(el);
					}
					paginationEl.appendChild(fragment);
				}

				// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
				// 인포윈도우에 장소명을 표시합니다
				function displayInfowindow(marker, title) {
					var content = '<div style="padding:5px;z-index:1;">'
							+ title + '</div>';

					infowindow.setContent(content);
					infowindow.open(map, marker);
				}

				// 검색결과 목록의 자식 Element를 제거하는 함수입니다
				function removeAllChildNods(el) {
					while (el.hasChildNodes()) {
						el.removeChild(el.lastChild);
					}
				};
			</script>
		</section>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		<script>
			CKEDITOR.replace('editor', {
				filebrowserUploadUrl : '/uploadEditorImage.do',
				height:1000
			});
		</script>
		
		<script>
			var mainPhoto;
			$("#complete").submit(function(){
				/* if($("#keyword").val()==""){
					alert("추천하는 장소를 입력하세요");
					return false;
				}
				if($("#recTitle").val()==""){
					alert("제목을 입력하세요");
					return false;
				}
				if($("#editor").val()==""){
					alert("본문을 입력하세요");
					return false;
				} */
				checkPhoto = $("#cont").find("iframe").contents().find("img").eq(0);
				mainPhoto = $("#cont").find("iframe").contents().find("img").eq(0).attr("src");
				console.log(checkPhoto);
				if(checkPhoto.length == 0){
					alert("사진을 첨부하세요");
					return false;
				}else{
					//mainPhoto = $("#cont").find("iframe").contents().find("img").eq(0).attr("src");
					$("#photo").val(mainPhoto);
					console.log($("#cont").find("iframe").contents().find("img").eq(0).attr("src"));
					return true;
				}
			});
			
		
		</script>
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
		<!-- 		<script src="/src/js/header/nice-select.min.js"></script> -->
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
