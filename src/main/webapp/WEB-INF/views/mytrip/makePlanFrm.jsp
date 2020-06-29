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
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
    <title>Travelego</title>
    <style>
        #tt{
            margin-top: 300px;
        }  
    </style>
  </head>
  <body>
  <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
    

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <!-- 여기서부터 작성하시면 됨!!!!!!! -->
      <div>
      	<h1>테스트111</h1>
      	<input type="text" id="datePicker">
      	<div id="tt"></div>
      </div>
    </section>
	<script>
		$('#datePicker').datepicker({
			format : "yyyy-mm-dd", // 달력에서 클릭시 표시할 값 형식
			language : "kr",
			todayHighlight : true,
			multidate : true,
			todayBtn : true
		});
		
	    $("#datePicker").on("change",function(){
	    	var dpValue = $(this).val();
	        
	        var arr = dpValue.split(',');
	        console.log(arr);
	        if(arr.length==1){
	        	$("#tt").html("");
	        }else if(arr.length==2){
	        	var arr1 = arr[0].split('-');
		        var arr2 = arr[1].split('-');
		        var dat1 = new Date(arr1[0],arr1[1],arr1[2]);
		        var dat2 = new Date(arr2[0],arr2[1],arr2[2]);
		        
		        if(dat1>dat2){
		        	var datSet = dat2;
		        	dat2 = dat1;
		        	dat1 = datSet; 
		        }
		        dat1.setDate(dat1.getDate()+3);
		        dat1.setDate(dat1.getDate()-3);
		        dat2.setDate(dat2.getDate()+3);
		        dat2.setDate(dat2.getDate()-3);
		        
		        var datArr = new Array();
		        while(true){
		        	var datPush = new Date(dat1);
		        	datArr.push(datPush);
		        	console.log(datArr);
		        	if((dat1.getMonth()==dat2.getMonth())&&(dat1.getDate()==dat2.getDate())){
		        		break;
		        	}
		        	dat1.setDate(dat1.getDate()+1);
		        	if(dat1.getMonth()!=dat2.getMonth()){
			        
			        	if(dat1.getMonth()!=2){
			        		
			        		if((dat1.getMonth()==4||dat1.getMonth()==6||dat1.getMonth()==9||dat1.getMonth()==11)&&dat1.getDate()==31){
			        			dat1.setDate(dat1.getDate()+1);//+1 한 날짜가 31일이고 해당 달은 31일이 없을 때 한번 더 +1일 해줌
			        		}else{
			        		}
			        	}else{
			        		//2월
			        		if(((dat1.getFullYear()%4==0&&dat1.getFullYear()%100!=0)||dat1.getFullYear()%400==0)&&dat1.getDate()==30){
			        			dat1.setDate(dat1.getDate()+2);//29일까지존재
			        		}else if((!(dat1.getFullYear()%4==0&&dat1.getFullYear()%100!=0)||dat1.getFullYear()%400==0)&&dat1.getDate()==29){
			        			dat1.setDate(dat1.getDate()+3);//28
			        		}
			        		
			        	}
			        }
		        	
		        }
		        
		        for(var i=0; i<datArr.length; i++){
		        	console.log(datArr[i]);
		        }
	        }else if(arr.length==3){
	        	$("#tt").html("");
	        }
	        	
	        
	    });
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
    <!-- <script src="/src/js/header/gijgo.min.js"></script> -->
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
