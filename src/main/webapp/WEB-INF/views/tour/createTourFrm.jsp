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
    <script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
    <!-- CSS here -->
    <link rel="stylesheet" href="/src/css/header/header.css" />
    <link rel="stylesheet" href="/src/css/footer/footer.css" />
    <link rel="stylesheet" href="/src/css/main/web_default.css" />
    <title>Travelego</title>
    <style>
    section{
    	
    }
    .section-top>div{
    	float:left;
    }
    .section-top{
    	border-bottom:1px solid gray;
    	overflow:hidden;
    }
    .page-title{
    	width:100%;
    	height:100px;
    	overflow:hidden;
    }
    .page-title>h1{
    	line-height:100px;
    	height:100%;
    	margin:0;
    	padding:0;
    	margin-left:20px;
    }
   	.mainImg{
   		margin:20px;
   		width:300px;
   		height:300px;
   		border:1px solid gray;
   		border-radius:10px;
   		overflow:hidden;
   	}
   	.mainImg>label{
   		width:100%;
   		height:100%;
   		font-size:20px;
   		text-align:center;
   		line-height:300px;
   		margin:0;
   	}
   	.itemInfo{
   		margin:30px;
   	}
   	.itemInfo>table th:first-child{
   		width:200px;
   		height:60px;
   		font-size:20px;
   		line-height:20px;
  	}
  	.itemInfo>table select{
  		width:200px;
  		height:30px;
  	}
  	.itemInfo>table input{
  		width:300px;
  		height:30px;
  	}
  	.section-content{
  		width:100%;
  		overflow:hidden;
  		margin-top:20px;
  	}
  	.date,.cal{
  		float:left;
  		width:250px;
  		height:300px;
  	}
  	.cal>input{
  		width:100%;
  	}
  	.date{
  		line-height:250px;
  		text-align:center;
  	}
  	.time{
  		margin-left:20px;
  		float:left;
  		width:600px;
  		height:240px;
  	}
  	.time>label>span{
  		color:black;
  		float:left;
  		width:90px;
  		height:50px;
  		border: 1px solid gray;
  		box-sizing:border-box;
  		font-size:20px;
  		line-height:50px;
  		text-align:center;
  	}
    .time>input:checked+label>span{
        background-color:#25e6b5 ;
    }
    .section-bottom{
    	width:100%;
    	overflow:hidden;
    }
    #submit-btn{
    	width:100px;
    	height:50px;
    	diplay:inline-block;
    	margin:0 auto;
    	background-color:#25e6b5;
    	border:0;
    	border-radius:5px;
    }
    #submit-btn:hover{
    	background-color:#25e6ff;
    	cursor:pointer;
    }
    </style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <!-- 여기서부터 작성하시면 됨!!!!!!! -->
      <div class="page-title">
      	<H1>상품등록</H1>
      </div>
    <form action="/insertTourItem.do" method="post">
    	<input type="hidden" name="memberId" value="${memberId }">
	    <div class="section-top">
	    	<div class="mainImg">
	    		<input id="file" name="filepath" type="file" hidden>
	    		<label for="file">대표 이미지를 등록해주세요</label>
	    	</div>
	    	<div class="itemInfo">
		     	<table>
			      	<tr>
			      		<th>지역 선택</th>
			      		<td>
				      		<select id="regionCountry">
				      			<option value=0>나라 선택
				      			<option value="나라1">나라1
				      			<option value="나라2">나라2
				      		</select>
			      		</td>
			      		<td>
				      		<select name="regionNo">
				      			<option value=0>도시 선택
				      			<option value=1>도시1
				      			<option value=2>도시2
				      		</select>
			      		</td>
			      	</tr>
			      	<tr>
			      		<th>상품 이름</th>
			      		<td colspan="2"><input type="text" name="itemTitle"></td>
			      	</tr>
			      	<tr>
		     			<th>1회 최대인원</th>
		     			<td colspan="2"><input type="number" name="maxPerson" style="width:100px;" min=0 value=0></td>
			      	</tr>
			      	<tr>
			      		<th>상품 가격</th>
			      		<td colspan="2"><input type="number" name="itemPrice" style="text-align:right" min=0 value=0>원</td>
			      	</tr>
		     	</table>
	    	</div>
	    </div>
	    <div class="section-content">
	    	<div class="date">상품 기간&시간 설정</div>
	    	<div class="cal">
	    		<input readonly placeholder="시작날짜와 끝날짜를 선택해주세요" name="beginEnd" type="text" data-range="true" data-multiple-dates-separator="-" data-language="en" class="datepicker-here" style="display:hidden;"/>
	    	</div>
			<div class="time">
				<p>해당 상품이 시작하는 시간들을 선택해주세요</p>
				<c:forEach var="i" begin="0" end="23" step="1">
					<input type="checkbox" name="tourTimes" value="${i }" id="time${i }" hidden>
					<label for="time${i }"><span>${i }:00시</span></label>
				</c:forEach>
			</div>
	    </div>
	    <div class="section-editor">
	    	<script src="/src/ckeditor/ckeditor.js"></script>
	    	<script>
	    	$(function(){
	            CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
	                width:'100%',
	                height:'1000px',
	                filebrowserImageUploadUrl: '/community/imageUpload' //여기 경로로 파일을 전달하여 업로드 시킨다.
	            });
	            
	            CKEDITOR.on('dialogDefinition', function( ev ){
	                var dialogName = ev.data.name;
	                var dialogDefinition = ev.data.definition;
	             
	                switch (dialogName) {
	                    case 'image': //Image Properties dialog
	                        //dialogDefinition.removeContents('info');
	                        dialogDefinition.removeContents('Link');
	                        dialogDefinition.removeContents('advanced');
	                        break;
	                }
	            });
	        });
	   		</script>
	   		<textarea name="itemContent" id="ckeditor" rows="10" cols="80"></textarea>
	    </div>
	    <div class="section-bottom">
	   		<input type="submit" value="상품 등록" id="submit-btn">
	    </div>
    </form>
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
        <!-- datepicker -->
    <link href="/src/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
    <script src="/src/dist/js/datepicker.min.js"></script>
    <script src="/src/dist/js/i18n/datepicker.en.js"></script>
  </body>
</html>
