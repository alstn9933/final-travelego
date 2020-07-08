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
        #datePicker{
            float: left;
        }
        #tt{
            float: left;
            margin-left: 100px;
        }
        #regionValue{
            margin-left: 600px;
        }
        #makeBtn{
        	background-color: gray;
        }
        #dateList{
        	margin-top: 200px;
        	background-color: lightpink;
        	width: 1200px;
        	height: 1500px;
        }
        textarea{
        	width: 300px;
        	height: 50px;
        	resize: none;
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
      <c:if test="${not empty sessionScope.member }">
	      <div>
				<button type="button" name="popupBtn">지도팝업</button>
				<input type="text" name="receiveAddr"><br>
				
				
			</div>
				
	      	<input type="text" id="datePicker">
	      	<div id="tt">
	      		<input type="text" name="regionCity" placeholder="도시명/나라명"><br>
	      		<table border="1" id="regionTable">
	      			<tr>
	      				<th>사진</th><th>도시</th><th>나라</th>
	      			</tr>
	      			<c:forEach items="${regionList }" var="regionList">
						<tr>
							<td>${regionList.filename }</td><input type='hidden' value="${regionList.regionNo }">
							<td>${regionList.regionCity }</td>
							<td>${regionList.regionCountry }</td>
						</tr>
					</c:forEach>
	      		</table>
	      	</div>
	      </div>
	      <br><br><br>
	      <input type="text" name="cityValue"><br>
	      <input type="text" name="countryValue"><br>
	      <input type="text" name="regionNo"><br>
		  <button type="button" id="makeBtn">버튼</button><br>
		  <input type="text" name="tripNo"><br>
		  <input type="text" name="currValIs"><br>
	      <div id="dateList">
	      	
	      </div>
	  </c:if>
    </section>
	<script>
		$("button[name=popupBtn]").click(function(){
	    
	     var popUrl ="/mapPopup.do";
	     //var popUrl ="/mapPopup.jsp";
	     var popOption = "width=650px, height=550px, resizable=no, location=no, top=300px, left=300px;"
	        
	        window.open(popUrl,"타이틀들어갈제목 ",popOption);    
	    
	    });
		
		
	
		var dat1Copy="";
		var dat2="";
		var regionNo="";
		var cityValue="";
		var countryValue="";
		var datArr;
		
		$(document).on("click","#regionTable tr",function(){//동적으로 생성된 태그에 이벤트 적용
			//regionNo = $(this).children(input type=hidden).val();
			regionNo = $(this).children().eq(1).val();
			cityValue = $(this).children().eq(2).text();
			countryValue = $(this).children().eq(3).text();
			$("input[name=cityValue]").attr("value",cityValue);
			$("input[name=countryValue]").attr("value",countryValue);
			$("input[name=regionNo]").attr("value",regionNo);
			//console.log(dat1Copy+"ddd");
			if(dat1Copy!=""){
				//$("#makeBtn").attr("disabled",true);
				$("#makeBtn").css("background-color","blue");
				$("#makeBtn").attr("disabled",false);
			}else{
				$("#makeBtn").css("background-color","gray");
				$("#makeBtn").attr("disabled",true);
			}
		});
		
		/* $(document).on("change","#datePicker",function(){
			$("#dataList").children().remove();
			if(dat1Copy!=""){
				for(var i=0; i<datArr.length; i++){
					$("#dateList").append("<input type='text' name='datArr[]' value=''>");
					$("#dateList").children().last().attr("value",datArr[i]);
				}
			}
		}); */
		
		
		$(function(){
			$(document).on("click","button[name=addMemo]",function(){
				//console.log($(this).val());
				$(this).prev().before("<input type='hidden' name='memoContent'>")
				$(this).prev().before("<textarea></textarea>");
				$(this).prev().before("<button type='button' name='addBtn'>등록</button>");
				$(this).prev().before("<button type='button' name='cancelBtn'>취소</button><br>");
			});
			
			$(document).on("click","button[name=addBtn]",function(){
				$("input[name=memoContent]").attr("value",$("textarea").val());
				console.log("addBtn버튼클릭!!!!");
				var thisDate = $(this).next().next().next().val();
				var tripNo = $("input[name=currValIs]").val();
				var tripContent = $(this).prev().val();
				var form = {
						"tripNo":tripNo,
						"tripDate":thisDate,
						"tripContent":tripContent
				}
				$.ajax({
					url : "/addMemo.do",
					//data : {"tripContent":memoContent},
					data : form,
					success : function(){
						var html = "";
						html += "<div>"+tripContent+"</div><br>";
						
						console.log("addmemo아작스성공");
						$(this).prev().remove();
						$(this).prev().before(html);
						$(this).next().next().remove();
						$(this).next().remove();
						$(this).remove();
					},
					error : function(){
						console.log("addmemo아작스실패");
					}
				});
			});
			
			$(document).on("click","button[name=cancelBtn]",function(){
				$(this).prev().prev().prev().remove();
				$(this).prev().prev().remove();
				$(this).prev().remove();
				$(this).next().remove();
				$(this).remove();
			});
			
			$("#makeBtn").click(function(){
				var form = {
						"sendArr":datArr,
						"regionNo":regionNo
				}
				$.ajax({
					url : "/makeMytrip.do",
					type : "POST",
					data : form,
					traditional : true,
					success : function(data){
						var html = "";
						html += "<hr>";
						for(var i=0; i<datArr.length; i++){
							html += "<div><label>"+datArr[i].getMonth()+"월 "+datArr[i].getDate()+"일</label><br>";
							if(datArr[i].getMonth()<10){
								html += "<button type='button' name='addSpot' value='"+(datArr[i].getYear()-100)+"/0"+datArr[i].getMonth()+"/"+datArr[i].getDate()+"'>장소 추가</button>";
								html += "<button type='button' name='addMemo' value='"+(datArr[i].getYear()-100)+"/0"+datArr[i].getMonth()+"/"+datArr[i].getDate()+"'>메모추가</button><br><br>";
							}else{
								html += "<button type='button' name='addSpot' value='"+(datArr[i].getYear()-100)+"/"+datArr[i].getMonth()+"/"+datArr[i].getDate()+"'>장소 추가</button>";
								html += "<button type='button' name='addMemo' value='"+(datArr[i].getYear()-100)+"/"+datArr[i].getMonth()+"/"+datArr[i].getDate()+"'>메모추가</button></div><br><br>";
							}
							console.log(datArr[i].getYear()-100);
							
						}
						console.log(data[0].tripNo);
						$("input[name=currValIs]").attr("value",data[0].tripNo);
						
						$("#dateList").append(html);
						/* var datArrFormat;
						for(var i=0; i<datArr.length; i++){
							if(datArr[i].getMonth()<10){
								datArrFormat = datArr[i].getFullYear()+"/0"+datArr[i].getMonth()+"/"+datArr[i].getDate();
								$("button[name=addSpot]").attr("value",datArrFormat);
								$("button[name=addMemo]").attr("value",datArrFormat);
							}else{
								datArrFormat = datArr[i].getFullYear()+"/"+datArr[i].getMonth()+"/"+datArr[i].getDate();
								$("button[name=addSpot]").attr("value",datArrFormat);
								$("button[name=addMemo]").attr("value",datArrFormat);
							}
						} */
						console.log("아작스성공!!!!!!!!");
					},
					error : function(){
						console.log("ajax통신 실패222");
					}
				});
			});
			
			$("input[name=regionCity]").keyup(function(){
				var regionCity = $("input[name=regionCity]").val();
				$.ajax({
					url : "/searchRegion.do",
					type : "get",
					data : {regionCity:regionCity},
					success : function(data){
						var html = "";
						$("table>tbody").empty();
						html += "<tr><th>사진</th><th>도시</th><th>나라</th></tr>"
						if(data!="0"){
						for(var i=0; i<data.length; i++){
							html += "<tr><td>"+data[i].filename+"</td>";
							html += "<input type='hidden' value='"+data[i].regionNo+"'>";
							html += "<td>"+data[i].regionCity+"</td>";
							html += "<td>"+data[i].regionCountry+"</td></tr>";
						}
						$("table>tbody").append(html);
						}
					},
					error : function(){
						console.log("ajax통신 실패");
					}
				});
			});
			
			$("#makeBtn").click(function(){
				console.log("버튼클릭성공");
			});
			
		});
		
		
		
	
	
	
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
	        if(arr.length==1){
	        	dat1Copy = "";
	        }else if(arr.length==2){
	        	var arr1 = arr[0].split('-');
		        var arr2 = arr[1].split('-');
		        var dat1 = new Date(arr1[0],arr1[1],arr1[2]);
		        dat2 = new Date(arr2[0],arr2[1],arr2[2]);
		        
		        if(dat1>dat2){
		        	datSet = dat2;
		        	dat2 = dat1;
		        	dat1 = datSet; 
		        }
		        dat1.setDate(dat1.getDate()+3);
		        dat1.setDate(dat1.getDate()-3);
		        dat2.setDate(dat2.getDate()+3);
		        dat2.setDate(dat2.getDate()-3);
		        dat1Copy = new Date(dat1);
		        datArr = new Array();
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
		        
		        /* for(var i=0; i<datArr.length; i++){
		        	console.log(datArr[i]);
		        } */
		        if(dat1Copy!=""&&cityValue!=""){
					//$("#makeBtn").attr("disabled",true);
					$("#makeBtn").css("background-color","blue");
					$("#makeBtn").attr("disabled",false);
				}else{
					$("#makeBtn").css("background-color","gray");
					$("#makeBtn").attr("disabled",true);
				}
		        //$("input[name=dpValue1]").attr("value",cityValue);
		        //$("#dateList").append("<input type='text' name='aaa' value='aaaa'>");
		        
	        }else if(arr.length==3){
	        	  var arr1 = arr[0].split('-');
	              var arr2 = arr[1].split('-');
	              var arr3 = arr[2].split('-');
	              var dat1 = new Date(arr1[0],arr1[1],arr1[2]);
	              var dat2 = new Date(arr2[0],arr2[1],arr2[2]);
	              var dat3 = new Date(arr3[0],arr3[1],arr3[2]);
	              if(dat1>dat2){
	                 var datSet = dat2;
	                 dat2 = dat1;
	                 dat1 = datSet; 
	              }
	              if((dat3>dat1&&dat3<dat2)||dat2<dat3){
	                 $("#datePicker").datepicker().datepicker("setDate",arr[0],arr[2]);
	              }else if(dat1>dat3){
	            	  $("#datePicker").datepicker().datepicker("setDate",arr[2],arr[0]);
	              }
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
    <!-- <script src="/src/js/header/waypoints.min.js"></script> -->
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
