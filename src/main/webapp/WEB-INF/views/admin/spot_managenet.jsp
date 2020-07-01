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
<link rel="stylesheet" href="/src//main/web_default.css" />
<title>Admin</title>
<style></style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<section>
		<!DOCTYPE html>
		<html>

<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<style>
.admin_page {

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

#Contents {
	transition: margin-left 0.5s;
	padding: 16px;
	margin-left: 250px;
}

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
/*
 * 1.지역만 추가
 * 2.국가/지역 추가
 * --옵션 동적 동작--
 * 3.두개 다 직접 입력일때만 input 창 보이게 해야 함
 * 국가명 같으면 어칾? 아작스 부를때 국가명 같으면 도시명에 추가만 되게끔 
 */
//학년 선택 시 - 반 설정
 $(function () {
    
	 
	 $("#countrySelect").change(function(){
     	   var country = $(this).val();
     	   var city = $("#citySelect").val();
     	   if(country == "insertCountry" && city =="insertCity" ){
     	    // 입력폼1 보여주기
     	    $("#addRegion").show();
     	   $("#addCity").hide();
     	    }else if (country != "insertCountry" && city =="insertCity" ){
     	    // 입력폼2 보여주기
     	    
     	    $("#addCity").show();
     	   $("#addRegion").hide();
				$()
     	    }else{
     	     $("#addRegion").hide();
     	     $("#addCity").hide();
     	    }
        
        //됐네요 감사합니다
        //display:none 이랑 show가 완전히 반대되는 속성이 아닐거에여 그래서 일단 로드완료되면 두개 hide시켜준거에여 네네

  	});
	 $("#addRegion").hide();
	 $("#addCity").hide();
	 
	 $("#countrySelect").change(function(){ // 대분류가 변경되면
      var regionCountry = $(this).val();
	 alert(regionCountry);
      $.ajax({
          type : "POST",
      url: "/middleList.do",
          data :  {
             regionCountry : regionCountry // 해당 대분류 값을 넘겨 중분류 검색하기 위해
          },
          
       success : function(result){//성공하면 값 받기 리스트로 넘겨받기
               var resultMap  = result; 
               $('.citySelect').empty();
                   var List = result;// Maplist 는 자바에서 넘긴 List 이름값
                   
                  
                   console.log(List);
                   if ( List.length > 0 ) { // 리스트가 있을때
//                        addOption += "<option value='' title='선택'>선택</option>";
                      var addOption = "";
                      for ( var cd = 0 ; cd < List.length; cd++) {
                    	  
                             addOption += "<option value = '"+List[cd].regionCity +"'>"+List[cd].regionCity+"</option>"; // 값과 강원도는 알아서 해당 db 변수값으로 넣고
                             $(".citySelect").append(addOption);
                             console.log(addOption);
                       }
                      
                   } else {
                      addOption = "<option value='' title='선택'>선택</option>";
                   }
                    
                     
                     
               
                  
        },
        error  : function(data) {   
               alert("오류가 발생하였습니다.\n관리자에게 문ss의하세요.");
      }
   });  
     
 });
//        $("#countrySelect").change(function(){ // 대분류가 변경되면
//           var regionCountry = $(this).val();
//           $.ajax({
//               type : "POST",
//           datatype : "json",
//               data :  {
//                  regionCountry : regionCountry // 해당 대분류 값을 넘겨 중분류 검색하기 위해
//               },
//                url : //중분류 select url 넣고,
//            success : function(result){//성공하면 값 받기 리스트로 넘겨받기
//                    var resultMap  = JSON.parse(result); 
//                        var List = resultMap.Maplist;// Maplist 는 자바에서 넘긴 List 이름값
//                        var addOption = "";
                       
                       
//                        if ( Maplist.length > 0 ) { // 리스트가 있을때
//                            addOption += "<option value='' title='선택'>선택</option>";
                          
//                           for ( var cd = 0 ; cd < codeList.Maplist ; cd++) {
//                                  addOption += "<option value = '"+Maplist[cd].값 +"'>"+강원도?+"</option>"; // 값과 강원도는 알아서 해당 db 변수값으로 넣고    
//                            }
                          
//                        } else {
//                           addOption = "<option value='' title='선택'>선택</option>";
//                        }
                           
//                          $("#citySelect").html(addOption);
                         
                   
                      
//             },
//             error  : function(data) {   
//                    alert("오류가 발생하였습니다.\n관리자에게 문의하세요.");
//           }
//        });  
         
          
          
     //이게 온로드함수 끝나는 부분 맞아요?
      
});
</script>
<body>
	<div class="admin_page">
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/icon?family=Material+Icons" />

		<div id="mySidebar" class="admin_sidebar">
			<a href="memberManagement.do"><span class="admin_title"></span>회원
				관리</a></span><a href="spot_managenet.do"><span><span
					class="admin_title">여행지 관리</span><br></a> <a
				href="qnaAdmin.do" /><span class="admin_QA">회원문의사항</span><br>
			<a href="report_mamnagement.do" ><span class="admin_title">신고글
				관리</span></a>
		</div>
		<div id="Contents">
	
	<!-- 국가 추가 -->
         <select name="countrySelect" id="countrySelect" >
               <option value="con1" selected >--국가를 선택해주세요--</option>
                <c:forEach items="${rList}" var="con">
                <option value="${con.regionCountry }">${con.regionCountry}</option>
                </c:forEach>
            <option value="insertCountry" name="insertCountry">--국가 직접 입력--</option>
            
            
         </select>
         
         
         <!-- 도시 입력 -->
         <form name="city">
            <select name="citySelect" id="citySelect" class="citySelect" >
            	<option value="city" class="addCity" selected>--지역을 선택해주세요 --</option>
                <option value="insertCity" name="insertCity">--도시 직접 입력--</option>
              </select>
         </form>
      <br>
      <br>
      <br>
      <br>
      <!--  -->
	<form  enctype="multipart/form-data"  id="addRegion" style="display: none;">
	국가 : <input type="text" name="addCountry"><br>
	도시 : <input type="text" name="addCity"><br>
	이미지 점부 : <input type="file" name="file"><br>
	<input type="submit" value="등록">
	</form>
	<br>
	<br>
	<form  enctype="multipart/form-data"  id="addCity"  style="display: none;">
	국가 : <input type="text" name="addCountry" placeholder="${rlist.regionCountry }" readonly>
	도시 : <input type="text" name="addCity"><br>
	이미지 점부 : <input type="file" name="file"><br>
	<input type="submit" value="등록">
	</form>
	


		
			
</body>

		</html>

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
