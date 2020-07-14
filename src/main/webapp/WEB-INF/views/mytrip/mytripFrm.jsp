<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
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
    <link
      rel="shortcut icon"
      type="image/x-icon"
      href="/src/imgs/header/favicon.png"
    />
    <!-- Place favicon.ico in the root directory -->
    <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
    <!-- CSS here -->
    <link rel="stylesheet" href="/src/css/header/header.css" />
    <link rel="stylesheet" href="/src/css/footer/footer.css" />
    <link rel="stylesheet" href="/src/css/main/web_default.css" />
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script>
		$(document).ready(function(){
			$(".bxslider").bxSlider({
				minSlides: 1,
				maxSlides: 3,
				slideWidth: 300,
				slideHeight: 600,
				slideMargin: 10,
				touchEnabled : (navigator.maxTouchPoints > 0)//bxslider오류로 a태그반영안돼서 추가
			});
		});
	</script>
    
    <title>Travelego</title>
    <style>
		.box1{
			width: 500px;
            height: 300px;
            border: 1px solid black;
            background-color:lightgray;
		}
        .newOne{
            width: 150px;
            height: 30px;
            border: 1px solid black;
            background-color: deepskyblue;
        }
        .listDiv{
        	width: 500px;
        	height: 500px;
        	background-color: lightpink;
        	margin-top: 10px;
        }
        .bxDiv{
        	/* box-shadow: 0;
        	border: 0px; */
        }
        .bxslider{
        	padding-left: 50px;
        	padding-right: 50px;
        }
        .bxslider li{
        	width: 300;
        	height: 400;
            margin: 0 auto;
        }
        .bxslider li div{
        	text-align:center;
			margin: 0 auto;
        	align-items:center; /* 위아래 기준 중앙정렬 */
			justify-content:center; /* 좌우 기준 중앙정렬 */
        }
        .imgDiv{
        	width: 200px;
        	height: 200px;
        }
        .bxslider li div:nth-child(1) img{
        	width: 100%;
        	height: 100%;
        	border-radius: 70%;
        	object-fit: cover;
        	
			margin: 0 auto;
        }
        .bxslider-inner {
			vertical-align: middle;
			display: inline-block;
		} 
		.bxslider li div:nth-child(2){
			margin: 0 auto;
			height: 50px;
			line-height: 50px;
		}
    </style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <!-- 여기서부터 작성하시면 됨!!!!!!! -->
      <div>
      	<div class="bxDiv">
		<ul class="bxslider bxslider-inner">
			<c:forEach items="${list }" var="list">
				<li>
					<div class="imgDiv">
						<input type="hidden" name="tripLink" value="${list.tripNo }">
						<input type="hidden" name="regionFilename" value="${list.filename }">
					</div>
					<div>${list.regionCountry } / ${list.regionCity }</div>
				</li>
					
				</c:forEach>
		</ul>
		</div>
		<button type="button" name="testBtn"></button>
		<div class="box1">
			<div class="newOne">
				<a href="<c:url value='/makePlanFrm.do?tripNoIs=0' />">새 일정 만들기</a>
			</div>
		</div>
		<div class="listDiv">
			<%-- <table border="1">
				
				<c:forEach items="${list }" var="list">
					
					<tr>
						<td>
							<form action="/makePlanFrm.do?tripNoIs=${list.tripNo }">
								<input type="hidden" name="tripNoIs" value="${list.tripNo }">
								<button type="submit">${list.tripNo }</button>
							</form>
						</td>
						<td>${list.memberId }</td>
					</tr>
					
				</c:forEach>
				
			</table> --%>
		</div>
      </div>
    </section>
	<script>
		$(document).ready(function(){
			mytripLink();
		});
	
		/* $(document).on("click","button[name=testBtn]",function(){
			/* var noArr = [];
			for(var i=0; i<$("input[name=tripLink]").length; i++){
				noArr.push($("input[name=tripLink]").eq(i).val());
			}
			console.log(noArr);
			
			$.ajax({
				url : "/loadImg.do",
				success : function(){
					
				},
				error : function(){
					console.log("loadImg아작스실패")
				}
			});
		}); */
		
		function mytripLink(){
			for(var i=0; i<$("input[name=tripLink]").length; i++){
				var tripLink = $("input[name=tripLink]")[i].value;
				var aHref = "<c:url value='/makePlanFrm.do?tripNoIs="+tripLink+"' />";
				var regionFilename = $("input[name=regionFilename]")[i].value;
				var img = "<img src='/upload/images/region/"+regionFilename+"'/>";
				//$("input[name=tripLink]").eq(i).prev().before(img);
				$("input[name=tripLink]").eq(i).before("<a href='"+aHref+"'>"+img+"</a>");
				//$("input[name=tripLink]").eq(i).before("<a href='/makePlanFrm.do?tripNoIs="+tripLink+"'>"+tripLink+"</a>");
				/* <a href="<c:url value='/makePlanFrm.do?tripNoIs=0' />">새 일정 만들기</a> */
			}
		}
	</script>
	

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- Modal -->
    <div
      class="modal fade custom_search_pop"
      id="exampleModalCenter"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalCenterTitle"
      aria-hidden="true"
    >
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