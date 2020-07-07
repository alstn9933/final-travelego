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
<script src="https://kit.fontawesome.com/240c78171f.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=80d7303a0a0952e6d0ad4b9188ef090b&libraries=services"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/19.1.1/classic/ckeditor.js"></script>

<!-- CSS here -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<title>Travelego</title>
<style>
.comment {
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
}
.ck.ck-reset_all{
        display: none;
    }
.ck-content{
        height: 100px;
    }
    #wrap{
    	display: inline-block;
    	box-sizing: border-box;
    }
    .title{
    	float: left;
    }
    #detailInfo>span{
    	margin-left: 20px;
    }
</style>
</head>
<script>
	$(function(){
		$(".insertBookmark").click(function(){
			var recNo = ${rec.recNo};
			$.ajax({
				url:"/insertBookmark.do",
				data : {recNo : recNo},
				type : "post",
				success : function(data){
					$(".insertBookmark").css("display","none");
					$(".deleteBookmark").css("display","inline-block");
					console.log("성공");
				},
				error:function(){
					alert("로그인 후 이용가능합니다.");
					console.log("실패");
				}
			});
		});
		
		$(".deleteBookmark").click(function(){
			var recNo = ${rec.recNo};
			$.ajax({
				url:"/deleteBookmark.do",
				data : {recNo : recNo},
				type : "post",
				success : function(){
					$(".deleteBookmark").css("display","none");
					$(".insertBookmark").css("display","inline-block");
					console.log("성공");
				},
				error:function(){
					alert("로그인 후 이용가능합니다.");
					console.log("실패");
				}
			});
		});
		
		$(".like").click(function(){
			var recNo = ${rec.recNo};
			$.ajax({
				url:"/insertLike.do",
				data : {recNo : recNo},
				type : "post",
				success : function(data){
					$(".like").css("display","none");
					$(".dislike").css("display","inline-block");
					$("#cnt").html("");
					$("#cnt").html(data);
					console.log("성공");
				},
				error:function(){
					alert("로그인 후 이용가능합니다.");
					console.log("실패");
				}
			});
		});
		
		$(".dislike").click(function(){
			var recNo = ${rec.recNo};
			$.ajax({
				url:"/deleteLike.do",
				data : {recNo : recNo},
				type : "post",
				success : function(data){
					$(".dislike").css("display","none");
					$(".like").css("display","inline-block");
					$("#cnt").html("");
					$("#cnt").html(data);
					console.log("성공");
				},
				error:function(){
					alert("로그인 후 이용가능합니다.");
					console.log("실패");
				}
			});
		});
		
		
	});
	
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<section>
		<!-- 여기서부터 작성하시면 됨!!!!!!! -->
		<div id="wrap" style="width:100%;">
		<div style="margin-left:10px; font-size:14px;">
					<c:if test="${rec.recCategory == 1 }">
                		맛집
                	</c:if>
					<c:if test="${rec.recCategory == 2 }">
                		카페
                	</c:if>
					<c:if test="${rec.recCategory == 3 }">
                		숙소
                	</c:if>
					<c:if test="${rec.recCategory == 4 }">
                		관광지
                	</c:if>
					<c:if test="${rec.recCategory == 5 }">
                		액티비티
                	</c:if>
				</div>
			<div class="title" style="width:90%;">
				
				<div style="font-size:30px;">${rec.recTitle}</div>
				<div id="detailInfo">
					<span>${rec.recWriter}</span>
					<span>${rec.recDate}</span>
					<span>
						<span>조회수 </span><span>${rec.readCount}</span>
					</span>
					<span>
						<span><i class="fas fa-heart"></i> </span><span id="cnt">${rec.cnt}</span>
					</span>
				</div>
			</div>
			<div class="title" style="width:10%;">
				<c:if test="${empty bookmark}">
				<span><i class="far fa-bookmark insertBookmark" style="font-size:28px;"></i></span>
				<span><i class="fas fa-bookmark deleteBookmark" style="display:none; font-size:28px;"></i></span>
				</c:if>
				<c:if test="${not empty bookmark }">
				<span><i class="far fa-bookmark insertBookmark" style="display:none; font-size:28px;"></i></span>
				<span><i class="fas fa-bookmark deleteBookmark" style="font-size:28px;"></i></span>
				</c:if>
<!-- 				<span><i class="fas fa-ellipsis-v" style="font-size:28px;"></i></span> -->
			</div>
		</div>

		<div >
			<img>
		</div>
		<div style="width:100%;">${rec.recContent}</div>
		<div id="map" style="width:60%;height:400px;margin:80px auto;"></div>
		<div style="height:40px;">
			<c:if test="${empty liked }">
			<span><i class="far fa-heart like" style="float:right; font-size: 40px;"></i></span>
			<span><i class="fas fa-heart dislike" style="display:none; float:right; font-size: 40px;"></i></span>
			</c:if>
			<c:if test="${not empty liked }">
			<span><i class="far fa-heart like" style="display:none; float:right; font-size: 40px;"></i></span>
			<span><i class="fas fa-heart dislike" style="float:right; font-size: 40px;"></i></span>
			</c:if>
		</div>
		<div id="review">
			댓글 <span>${cntCom}</span>
			<c:forEach items="${comments }" var="cmt">
				<c:choose>
					<c:when
						test="${sessionScope.member.memberId eq cmt.commentWriter }">
						<div class="comment" style="background-color: skyblue">
							<input type="hidden" value="${cmt.commentNo }">
							<div>${cmt.commentWriter }</div>
							<div>${cmt.commentContent }</div>
							<div>${cmt.commentDate }</div>
							<div>
								<button>답글</button><button onclick="amendComment('${cmt.commentNo}', '${rec.recNo }');">수정</button><button onclick="deleteComment('${cmt.commentNo}', '${rec.recNo }');">삭제</button>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="comment">
							<input type="hidden" value="${cmt.commentNo }">
							<div>${cmt.commentWriter }</div>
							<div>${cmt.commentContent }</div>
							<div>${cmt.commentDate }</div>
							<div>
								<button>답글</button>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<div id="page"></div>
		</div>
		<div>
			<form action="/insertComment.do" method="post">
				<input type="hidden" name="commentLevel" value="1">
				<input type="hidden" name="refComment" value="0">
				<input type="hidden" name="recNo" value="${rec.recNo }">
				<textarea rows="10" cols="50" name="commentContent" id="editor"></textarea>
				<button>등록</button>
			</form>
		</div>
	</section>

	<script>
		$(function(){
			$("img").removeAttr("style");
			$("img").css("width","100%");
		});
	</script>
	<script>
	$(function(){
		
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${rec.coords}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'${rec.place}'+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
}); 
	});
</script>
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
	<script src="/src/js/header/nice-select.min.js"></script>
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
      $(function () {
        $('[data-toggle="popover"]').popover();
      });

      $("#datepicker").datepicker({
        iconsLibrary: "fontawesome",
        icons: {
          rightIcon: "_$tag___________________________$tag__",
        },
      });
    </script>
    <script>
    function deleteComment(commentNo, recNo){
		location.href="/deleteComment.do?recNo="+recNo+"&commentNo="+commentNo;
	};
	
	function ammendComment(commentNo, recNo){
		
	}
    </script>
    <script>
            ClassicEditor
                    .create( document.querySelector( '#editor' ) )
                    .then( editor => {
                            console.log( editor );
                    } )
                    .catch( error => {
                            console.error( error );
                    } );
    </script>
</body>
</html>
