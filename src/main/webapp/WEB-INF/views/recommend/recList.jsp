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
    </style>
  </head>
  <script>
  	$(function(){
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
  						$("#regionCity").append("<option value='"+data[i].regionNo+"'>"+data[i].regionCity+"</option>");
  					}
  				},
  				error:function(){
  					console.log("ajax 실패");
  				}
  			});
  		});
  		$("#writeFrm").click(function(){
  			location.href="/recWriteFrm.do";
  		})
  	});
  </script>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <div>
            <form action="/sort.do" type="post">
                여행지역
                <select id="regionCountry" name="regionCountry">
                    <option value="전체">전체</option>
                    <option value="국내" style="font-weight:bold">국내</option>
                    <optgroup label="해외">
                    	<c:forEach items="${country}" var="r">
                    		<option value="${r.regionCountry }">${r.regionCountry }</option>
                    	</c:forEach>
                    </optgroup>
                </select>
                <select id="regionCity" name="regionCity">
                    <option id="cityAll" value="전체">전체</option>
                </select>
                
                카테고리
                <select id="recCategory" name="recCategory">
                    <option value="0">전체</option>
                    <option value="1">맛집</option>
                    <option value="2">카페</option>
                    <option value="3">숙소</option>
                    <option value="4">관광지</option>
                    <option value="5">액티비티</option>
                </select>
                <br>
                <input type="text" id="search" name="search"> <button>검색</button>
            </form>
        </div>
        <div>
            <div>
                <span><a href="#">좋아요순</a></span>
                <span><a href="#">최신순</a></span>
                <span><a href="#">조회순</a></span>
            </div>
           
            <table>
                <tr>
                    <th width="5%"></th>
                    <th width="50%">제목</a></th>
                    <th width="10%">여행지</th>
                    <th width="10%">작성자</th>
                    <th width="15%">작성일</th>
                    <th width="10%">조회수</th>
                </tr>
                <c:forEach items="${recList}" var="list">
                <tr>
                    <th>${list.recNo }</th>
                    <th><a href="/recDetail.do?recNo=${list.recNo }">${list.recTitle }</a></th>
                    <th>${list.regionCity }</th>
                    <th>${list.recWriter}</th>
                    <th>${list.recDate }</th>
                    <th>${list.readCount }</th>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div id="page"></div>
      <%-- <c:if test="${not empty sessionScope.member }"> --%>
        <div><button id="writeFrm">글쓰기</button></div>
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
