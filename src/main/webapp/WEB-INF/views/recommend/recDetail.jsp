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

 <!-- 수민 버튼 부트스트랩 -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  

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
    
	.amendtxt{
		display: none;
	}
	
	#second{
		display: none;
	}
    
    button{
    	width:60px;
    	height:30px;
    	text-shadow: 0.2px 0.2px white;
    	line-height: 20px;
    }
</style>
</head>
<script>
	$(function(){
		$("#second").hide();
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
		<div style="margin-left:10px; font-size:14px; color:gray; text-shadow: 0.2px 0.2px gray;">
					<c:if test="${rec.recCategory == 1 }">
                		&lt맛집&gt
                	</c:if>
					<c:if test="${rec.recCategory == 2 }">
                		&lt카페&gt
                	</c:if>
					<c:if test="${rec.recCategory == 3 }">
                		&lt숙소&gt
                	</c:if>
					<c:if test="${rec.recCategory == 4 }">
                		&lt관광지&gt
                	</c:if>
					<c:if test="${rec.recCategory == 5 }">
                		&lt액티비티&gt
                	</c:if>
				</div>
			<div class="title" style="width:90%;">
				<div style="font-size:30px;">${rec.recTitle}</div>
				<div id="detailInfo" style="width:100%;display:inline-block; float:left;">
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
			<div class="title" style="width:10%; height:45px; text-align:right;">
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
			
				<div style="float:right;">
					<c:if test="${sessionScope.member.memberId eq rec.recWriter }">
					<a href="/updateRecFrm.do?recNo=${rec.recNo }">수정</a>
					</c:if>
					<c:if test="${sessionScope.member.memberId eq 'admin' or sessionScope.member.memberId eq rec.recWriter }">
					<a href="javascript:/void(0)" onclick="deleteRec('${rec.recNo }');">삭제</a>
					</c:if>
				</div>
		</div>

		
		<div style="width:80%; margin:50px auto;">${rec.recContent}</div>
		<div style="width:80%; margin:50px auto; text-align: center;">
			<div><span><i class="fas fa-check"></i></span><span> 장소 </span><span>${rec.place }</span></div>
			<div><span><i class="fas fa-check"></i></span><span> 주소 </span><span>${rec.coords }</span></div>
		</div>
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
			<c:if test="${not empty sessionScope.member }">
			<span><i class="fas fa-exclamation-circle report" style="float:right; font-size: 40px; margin-right:20px;"></i></span>
			</c:if>
		</div>
		<hr>
		
		<!-- 댓글 -->
		<div id="review">
			댓글 <span>${cntCom}</span>
			<c:forEach items="${comments }" var="cmt">
			<c:if test="${cmt.commentLevel eq 1 }">
				<c:choose>
					<c:when
						test="${sessionScope.member.memberId eq cmt.commentWriter or sessionScope.member.memberId eq 'admin'}">
						<ul>
							<li>
								<div class="comment" style="background-color: #dcecfa; padding: 10px 20px;">
									<input type="hidden" value="${cmt.commentNo }">
									<input type="hidden" value="${cmt.commentLevel }">
									<div style="font-weight:450;">${cmt.commentWriter }</div>
									<div style="padding-left:20px; margin:5px;">${cmt.commentContent }</div>
									<textarea rows="5" cols="50" name="amendComment" class="amendtxt" style="resize:none;width:100%;">${cmt.commentContent }</textarea>
									<div style="color:gray; text-shadow: 0.1px 0.1px gray;">${cmt.commentDate }</div>
									<div>
									<c:if test="${sessionScope.member.memberId eq cmt.commentWriter}">
										<button class="repl btn btn-info" style="display: none;">답글</button>
										<button class="amend btn btn-info" onclick="amendComment(this,'${cmt.commentNo}','${rec.recNo }');">수정</button>
									</c:if>
										<button class="delete btn btn-info" onclick="deleteComment('${cmt.commentNo}', '${rec.recNo }');">삭제</button>
									</div>
								</div>
							</li>
						</ul>
					</c:when>
					<c:otherwise>
						<div class="comment" style="padding: 10px 20px;">
							<input type="hidden" value="${cmt.commentNo }">
							<input type="hidden" value="${cmt.commentLevel }">
							<div style="font-weight:450;">${cmt.commentWriter }</div>
							<div style="padding-left:20px;  margin:5px;">${cmt.commentContent }</div>
							<div style="color:gray; text-shadow: 0.1px 0.1px gray;">${cmt.commentDate }</div>
							<c:if test="${not empty sessionScope }">
							<div>
								<button class="repl btn btn-info" style="display: none;">답글</button>
							</div>
							</c:if>
						</div>
					</c:otherwise>
				</c:choose>
				</c:if>
				
				<%-- <c:forEach items="${comments }" var="cmtt">
				<c:if test="${cmt.commentLevel eq 2 and cmtt.refComment eq cmt.commentNo}">
				<c:choose>
					<c:when test="${sessionScope.member.memberId eq cmt.commentWriter or sessionScope.member.memberId eq 'admin'}">	
					<ul>
						<li>
							<div class="comment reple" style="background-color: #dcecfa">
									<input type="hidden" value="${cmtt.commentNo }">
									<input type="hidden" value="${cmtt.commentLevel }">
									<div>${cmtt.commentWriter }</div>
									<div>${cmtt.commentContent }</div>
									<textarea rows="5" cols="50" name="amendComment" class="amendtxt" style="resize:none;width:100%;">${cmt.commentContent }</textarea>
									<div>${cmtt.commentDate }</div>
									<div>
									<c:if test="${sessionScope.member.memberId eq cmt.commentWriter}">
										<button class="repl">답글</button>
										<button class="amend" onclick="amendComment(this,'${cmtt.commentNo}','${rec.recNo }');">수정</button>
									</c:if>
										<button class="delete" onclick="deleteComment('${cmtt.commentNo}', '${rec.recNo }');">삭제</button>
									</div>
								</div>
						</li>
					</ul>
					</c:when>
					<c:otherwise>
						<ul>
						<li>
						<div class="comment reple">
							<input type="hidden" value="${cmtt.commentNo }">
							<input type="hidden" value="${cmtt.commentLevel }">
							<div>${cmtt.commentWriter }</div>
							<div>${cmtt.commentContent }</div>
							<div>${cmtt.commentDate }</div>
							<div>
								<button class="repl">답글</button>
							</div>
						</div>
						</li>
						</ul>
					</c:otherwise>
					</c:choose>
					</c:if>
				</c:forEach> --%>
				
			</c:forEach>
			<div id="page" style="width:80%; margin:20px auto; text-align: center;">${pageNavi }</div>
		</div>
		<c:if test="${not empty sessionScope.member}">
		<div>
			<form action="/insertComment.do?commentLevel=1" method="post" id="first">
				<!-- <input type="hidden" name="commentLevel" value="1"> -->
				<input type="hidden" name="refComment" value="0">
				<input type="hidden" name="recNo" value="${rec.recNo }">
				<textarea rows="5" cols="50" name="commentContent" style="resize:none;width:100%;"></textarea>
				<div style="text-align: right; margin-bottom: 50px;"><button class="btn btn-info">등록</button></div>
			</form>
			
			<form action="/insertComment.do?commentLevel=2" method="post" id="second">
				<!-- <input type="hidden" name="commentLevel" value="2"> -->
				<input type="hidden" name="refComment" value="0">
				<input type="hidden" name="recNo" value="${rec.recNo }">
				<textarea rows="5" cols="50" name="commentContent" style="resize:none; width:100%;"></textarea>
				<div style="text-align: right;">
				<button class="btn btn-info">등록</button>
				</div>
			</form>
		</div>
		</c:if>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script>
		$(function(){
			$("img").removeAttr("style");
			$("img").css("width","100%");
		});
		
		function deleteRec(recNo){
			alert("정말 삭제하시겠습니까?");
			location.href="/deleteRec.do?recNo="+recNo;
		}
		
		$(".repl").click(function(){
			$("#first").hide();
			$("#second").show();
			var cmtWriter = $(this).parent().siblings("div").eq(0).html();
			console.log(cmtWriter);
			$("#second textarea").html("@"+cmtWriter+"\n");
		});
		
		function deleteComment(commentNo, recNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href="/deleteComment.do?recNo="+recNo+"&commentNo="+commentNo;
			}else{
				
			}
		};
		
		function amendComment(val, commentNo, recNo){
			$(val).parent().siblings("textarea").show();
			$(val).prev().hide();
			$(val).html("수정");
			$(val).next().html("취소");
			var content = $(val).parent().siblings("div").eq(1).html();
			$(val).parent().siblings("textarea").html(content);
			$(val).parent().siblings("div").eq(1).hide();
			
 			$(val).removeClass("amend");
			$(val).addClass("amendComplete");
			$(val).removeAttr("onclick");
			$(val).attr('onclick','amendComplete(this,"'+commentNo+'","'+recNo+'")');
			
 			$(val).next().removeClass("delete");
 			$(val).next().addClass("cancel");
 			$(val).next().removeAttr("onclick");
 			$(val).next().attr("onclick",'amendCancel(this,"'+commentNo+'","'+recNo+'")');
		};
		
		function amendCancel(val, commentNo, recNo){
			$(val).parent().siblings("textarea").hide();
			//$(val).prev().prev().show();
			$(val).prev().html("수정");
			$(val).html("삭제");
			//var content = $(val).parent().siblings("div").eq(1).html();
			$(val).parent().siblings("div").eq(1).show();
			
			$(val).prev().removeClass("amendComplete");
			$(val).prev().addClass("amend");
			$(val).prev().removeAttr("onclick");
			$(val).prev().attr('onclick','amendComment(this,"'+commentNo+'","'+recNo+'")');
			
 			$(val).removeClass("cancel");
 			$(val).addClass("delete");
 			$(val).removeAttr("onclick");
 			$(val).attr("onclick",'deleteComment("'+commentNo+'","'+recNo+'")');
		};
		
		function amendComplete(val, commentNo, recNo){
			var $form=$("<form action='/amendComment.do?commentNo="+commentNo+"&recNo="+recNo+"' method='post'></form>");
			//	$form.append($("<input type='text' name='commentNo' value='"+commentNo+"'>"));
			//	$form.append($("<input type='text' name='recNo' value='"+recNo+"'>"));
				$form.append($(val).parent().siblings("textarea"));
				
				$('body').append($form);
				
				$form.submit();		
		}
		
		$(".report").click(function(){
			var recNo = ${rec.recNo};
			location.href="/reportFrm.do?boardClass=2&boardNo="+recNo;
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
    
</body>
</html>
