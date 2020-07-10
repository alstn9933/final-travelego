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
    
    <!-- 셀렉트 부트스트랩 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
    <!-- 수민 버튼 부트스트랩 -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
    <!-- Place favicon.ico in the root directory -->
    <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://kit.fontawesome.com/240c78171f.js"
	crossorigin="anonymous"></script>
    <!-- CSS here -->
    <link rel="stylesheet" href="/src/css/header/header.css" />
    <link rel="stylesheet" href="/src/css/footer/footer.css" />
    <link rel="stylesheet" href="/src/css/main/web_default.css" />
    <title>Travelego</title>
    <style>
        table{
            width: 100%;
            border-spacing: 0px;
            border-left: none;
            border-right: none;
            border-top: none;
        }
        td{
            border-left: none;
            border-right: none;
            text-align: center;
        }
        .bold{
        	font-weight: bold;
        }
        .info>span{
        	margin-right:10px;
        	font-size: 14px;
        }
        button{
            width: 60px;
            height: 18px;
            line-height : 28px;
            border-radius: 0px;
            box-sizing: content-box;
        }
    </style>
  </head>
  <script>
  	$(function(){
  		var cnt=0;
  		$("#regionCountry").change(function(){
  			$("#regionCity").html("<option id='cityAll' value='전체'>전체</option>");
  			var country = $(this).val();
  			$.ajax({
  				url : "/selectCity.do",
  				data : {country : country},
  				type : "post",
  				dataType:"json",
  				success : function(data){
  					for(var i=0;i<data.length;i++){
  						$("#regionCity").append("<option value='"+data[i].regionCity+"'>"+data[i].regionCity+"</option>");
  					}
  					if($("#regionCountry").val() == "${regionCountry}" && cnt == 0){
  					$("select[name=regionCity]").val("${regionCity}").prop("selected",true);
  					}
  					cnt++;
  				},
  				error:function(){
  					console.log("ajax 실패");
  				}
  			});
  		});
  		$("#writeFrm").click(function(){
  			location.href="/recWriteFrm.do";
  		});
  		
  		$("select[name=regionCountry]").val("${regionCountry}").prop("selected",true);
  		$("select[name=regionCountry]").change();
  		
  		$("select[name=recCategory]").val("${recCategory}").prop("selected",true);
  	
  
  	});
  </script>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <div>
            <form action="/sort.do" type="post" style="padding-left:50px;">
            <input type="hidden" name="reqPage" value="1">
                여행지역
                <select id="regionCountry" name="regionCountry" class="custom-select custom-select-sm" style="width:150px; margin-right:20px;">
                    <option value="전체">전체</option>
                    <option value="국내" style="font-weight:bold">국내</option>
                    <optgroup label="해외">
                    	<c:forEach items="${country}" var="r">
                    		<option value="${r.regionCountry }">${r.regionCountry }</option>
                    	</c:forEach>
                    </optgroup>
                </select>
                <select id="regionCity" name="regionCity" class="custom-select custom-select-sm" style="width:150px; margin-right:20px;">
                    <option id="cityAll" value="전체">전체</option>
                </select>
                
                카테고리
                <select id="recCategory" name="recCategory" class="custom-select custom-select-sm" style="width:150px; margin-bottom:0px; margin-right:20px;">
                    <option value="0">전체</option>
                    <option value="1">맛집</option>
                    <option value="2">카페</option>
                    <option value="3">숙소</option>
                    <option value="4">관광지</option>
                    <option value="5">액티비티</option>
                </select>
                
                <input type="text" id="search" name="search"> <button class="board btn btn-info" style="padding:none;">검색</button>
                <div style="text-align:right; line-height: 30px;">
	            	<input type="radio" name="order" value="date" id="date">
	            	<label for="date">최신순</label>
	             	<input type="radio" name="order" value="readCount" id="readCount">
	                <label for="readCount">조회순</label>
	                <input type="radio" name="order" value="liked" id="liked">
	                <label for="liked">좋아요순</label>
            	</div>
            </form>
        </div>
        <div>
            
           <!-- 추천글 리스트를 이중 foreach를 이용해 3X3으로 정렬 -->
            <div class="boardList" style="overflow: hidden;">
            	<div>
            		<c:forEach items="${recList }" var="rec">
            		<div style="float:left; margin: 20px 50px;">
            			<a href="/recDetail.do?reqPage=1&recNo=${rec.recNo }"><img src="${rec.filepath }" style="width:300px; height:200px; overflow: hidden"></a>
            			<div class="info"><span>${rec.regionCity }</span><span>/</span>
            			<span>
            			<c:choose>
            				<c:when test="${rec.recCategory eq 1}">
            					맛집
            				</c:when>
            				<c:when test="${rec.recCategory eq 2}">
            					카페
            				</c:when>
            				<c:when test="${rec.recCategory eq 3}">
            					숙소
            				</c:when>
            				<c:when test="${rec.recCategory eq 4}">
            					관광지
            				</c:when>
            				<c:when test="${rec.recCategory eq 5}">
            					액티비티
            				</c:when>
            				<c:otherwise>
            					기타
            				</c:otherwise>
            			</c:choose>
            			</span>
            			</div>
            			<div><a href="/recDetail.do?reqPage=1&recNo=${rec.recNo }">${rec.recTitle }</a></div>
            			<div class="info"><span>${rec.recWriter}</span><span>${rec.recDate }</span><span style="margin-right:3px;"><i class="fas fa-heart"></i></span><span>${rec.cnt }</span><span style="margin-right:3px;">조회수</span><span>${rec.readCount }</span></div>
            		</div>
            		</c:forEach>
            	</div>
            </div>
        </div>
        <div id="page" style="width:80%; margin:50px auto; text-align: center;">${pageNavi }</div>
      <%-- <c:if test="${not empty sessionScope.member }"> --%>
        <div style="margin:20px 50px; text-align:right;"><button id="writeFrm" class="board btn btn-info" style="padding:none;">글쓰기</button></div>
        <%-- </c:if> --%>
    </section>

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
		$("input[value=${order}]").prop("checked", true);
		
		$("input[name=order]").click(function(){
			$("form").submit();
		});
    </script>
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
