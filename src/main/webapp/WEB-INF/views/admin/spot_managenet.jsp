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
    <script src="/src/js/spotCss/jquery.dd.min.js"></script>
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
     <link rel="stylesheet" href="/src/js/spotCss/dd.css" />
    <title>Admin</title>
    <style></style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
    <style>
.admin_page {
padding-top : 500px;
	font-family: "Lato", sans-serif;
}

.admin_sidebar {
	margin-top:15%;
	height: 40%;
	width: 200px;
	position: fixed;
	top: 0;
	left: 0;
	background-color:white;
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
.dd .ddChild li img{
width: 50px;
}

#Contents {
	transition: margin-left 0.5s;
	padding: 16px;
	margin-left: 250px;
}
.dd .ddTitle .ddTitleText img
{
width: 50px;}
@media screen and (max-height: 450px) {
	.admin_sidebar {
		padding-top: 15px;
	}
	.admin_sidebar a {
		font-size: 18px;
	}
}
</style>
    <script>
    $(function () {
    	$(".citySelect").change(function(){
    	 var val = $(this).val();
    	 var val2 =   $("#countrySelect").val();
    	 
    	 if(val == "insert" && val2=="insertCountry"){
    		 $("#addRegion").show();
    		 $(".hid").show();
    		 $("#regionCountry").val("");
    		 $("#regionCountry").attr("readonly",false);
    		 $("#delRegion").hide();
    	 }else if(val == "insert"){
    		 $("#addRegion").show()
    		 $("#delRegion").hide();
    		 $("#regionCountry").val(val2);
    		 $("#regionCountry").attr("readonly",true);
    		 
    	 }else{
    		 $("#delRegion").show();
    		 $("#addRegion").hide();
    	 }
    	});
    	
     $("#countrySelect").change(function () {
    	 $("#addRegion").hide();
    	 $("#delRegion").hide();
	})   
   	 
   	 $("#addRegion").hide();
     
     $("#delRegion").click(function () {
		var val = $(".citySelect").val();
		var val2= $(".citySelect option:selected").attr("data-id");
		if(val !="insert" && val !=""){
			 $.ajax({
	             type : "POST",
	         url: "/deleteReg.do",
	             data :  {
	                regionNo : val, // 해당 대분류 값을 넘겨 중분류 검색하기 위해
	                filename : val2
	             },
	             
	          success : function(result){//성공하면 값 받기 리스트로 넘겨받기
	          if(result == "2"){
	        	  
				alert("삭제 성공");	    
				location.reload();
	          }else{
	        	  alert("살제실패");
	          }
	           },
	           error  : function(data) { 
	        	   alert("시스템 오류 입니다.\n 관리자에게 문의 바랍니다.");
	         }
	      }); 
		}
	})
   	 
   	 $("#countrySelect").change(function(){ // 대분류가 변경되면
   		$('.citySelect').empty();
   	  var regionCountry = $(this).val();
         $.ajax({
             type : "POST",
         url: "/middleList.do",
             data :  {
                regionCountry : regionCountry 
             },
             
          success : function(result){
                  var resultMap  = result; 
                  
                      var List = result;
                      console.log(result);
                      if ( List.length > 0 ) {
                    	  
//                           addOption += "<option value='' title='선택'>선택</option>";
                         var addOption = "";
                         $(".citySelect").append("<option value=''>----국가를 선택해주세요---</option>");
                         for ( var cd = 0 ; cd < List.length; cd++) {
                        		addOption = "";
                                addOption += "<option data-id='"+List[cd].filename+"' data-image='"+List[cd].filepath+"\\"+List[cd].filename+"' value = '"
                                +List[cd].regionNo +"'>"+List[cd].regionCity+"</option>"; 
                                // 값과 강원도는 알아서 해당 db 변수값으로 넣고
                                $(".citySelect").append(addOption);
                          }
                         
                         $(".citySelect").append("<option value='insert'>--2.도시직접입력--</option>");
                       
                        
                      } else {
                         addOption = "<option value='' title='선택'>--3.도시를 선택해주세요--</option>";
                         $(".citySelect").append(addOption);
                         $(".citySelect").append("<option value='insert'>--도시직접입력--</option>");
                        
                      }
                      $('.citySelect').msDropDown();
                      
           },
           error  : function(data) {   d
         }
      }); 
        
    });
         
   });
    
    
    </script>
    
    
     	<div class="admin_page">
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/icon?family=Material+Icons" />

		<div id="mySidebar" class="admin_sidebar">
			<a href="/memberManagement.do?reqPage=1"><span class="admin_title"></span>회원
				관리</a></span><a href="spot_managenet.do"><span><span
					class="admin_title">여행지 관리</span><br></a> <a
				href="qnaAdmin.do" /><span class="admin_QA">회원문의사항</span><br>
			<a href="reportList.do" ><span class="admin_title">신고글
				관리</span></a>
		</div>
		<div id="Contents">
	<!-- 국가 추가 -->
         <select name="countrySelect" id="countrySelect" style="width: 600px;" >
               <option value="선택된국가가 없습니다" selected >--국가를 선택해주세요--</option>
                <c:forEach items="${rList}" var="con">
                <option data-image='/src/imgs/member/city.jpg' value="${con.regionCountry }">${con.regionCountry}</option>
                </c:forEach>
            <option value="insertCountry" name="insertCountry">--국가 직접 입력--</option>
              
         </select>
         <!-- 도시 입력 -->
         <form name="city">
            <select name="citySelect" id="citySelect" class="citySelect" style="width: 600px;" >
            	
              </select>
         </form>
      <br>
      <!--  -->
	<form   method="post" enctype="multipart/form-data" id="addRegion" name="addRegion"  style="display: none;"action="/insertCity.do" >
<span class="hid">	국가 : <input type="text" name="regionCountry" id="regionCountry" value=""><br> </span>
	도시 : <input type="text" name="regionCity" id="regionCity"><br>
	이미지 점부 : <input type="file" name="file" id="addFile"><br>
	<input type="submit"  value="등록">
	</form>
	<button id="delRegion" style="display: none;">삭제</button>
	<br>
	<br>
     
     
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