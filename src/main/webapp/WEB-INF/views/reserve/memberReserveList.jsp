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
	    .pagetitle{
	    	border-bottom:1px solid black;
	    }
	    .reserve-list{
	   		width:70%;
	   		margin:0 auto;
	   		overflow:hidden;
	    }
	    .status-info{
	    	width:100%;
	    	padding:20px;
	    	overflow:hidden;
	    }
	    .status-info>label{
	    	display:inline-block;
	    	float:right;
	    	margin-left:10px;
	    }
	    .status-info>label>input{
	    	display:none;
	    }
	    .status-info>label>input:checked+span{
	    	background-color:#25e6b5;
	    }
	    .status-info>label>span{
	    	border: 1px solid black;
	    	background-color:white;
	    	font-size:15px;
	    	color:black;
	    }
	    .morebtn{
	    	width:100%;
	    }
	    .reserve-info{
	    	width:100%-40px;
	    	height:160px;
	    	border: 2px solid brown;
	    	border-radius:10px;
	    	box-sizing:border-box;
	    	overflow:hidden;
	    	margin:20px;
	    }
	    .reserve-info>table{
	    	width:100%;
	    }
		.reserve-info>table td{
			border-bottom:1px solid black;
			height:40px;
			padding-left:10px;
		}
		.reserve-info>table td:first-child{
			border-right:1px solid black;
			width:200px;
		}
		.reserve-info>table td>span{
			line-height:20px;
			font-size:20px;
		}
		.reserve-info>table td>span:first-child{
			background-color:#25e6b5;
		}
		.reserve-info>table td>span:last-child{
			font-weight:bold;
		}
		.stsbtn{
			width:100px;
			height:30px;
			line-height:10px;
		}
		#itemTitle{
			color:blue;
		}
		.modal-title{
			width:65%;
			text-overflow: ellipsis;
		}
		.starRev{
			width:35%;
		}
		.starR1{
		    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
		    background-size: auto 100%;
		    width: 15px;
		    height: 30px;
		    float:left;
		    text-indent: -9999px;
		    cursor: pointer;
		}
		.starR2{
		    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		    background-size: auto 100%;
		    width: 15px;
		    height: 30px;
		    float:left;
		    text-indent: -9999px;
		    cursor: pointer;
		}
		.starR1.on{background-position:0 0;}
		.starR2.on{background-position:-15px 0;}
    </style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <!-- 여기서부터 작성하시면 됨!!!!!!! -->
      	<div class="mypage-navi">
      		
      	</div>
      	<div class="page-content">
	      	<div class="pagetitle">
	      		<h1>My Reservation</h1>
	     	</div>
	     	<div class="status-info">
	     		<label for="cancel"><input id="cancel" type="radio" name="status" value="cancel"><span class="btn btn-primary">취소</span></label>
	     		<label for="ing"><input id="ing" type="radio" name="status" value="ing"><span class="btn btn-primary">예약</span></label>
				<label for="all"><input id="all" type="radio" name="status" value="all"><span class="btn btn-primary">전체</span></label>
			</div>
			<div class="reserve-list">
			</div>
			<button class="btn btn-primary morebtn" id="morebtn" totalCount=0 currentCount=0 value="">▼</button>
		</div>
		
		<div class="modal modal-center fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" data-backdrop="static">
 			<div class="modal-dialog modal-center" role="document">
    			<div class="modal-content">
     				<div class="modal-header">
       					<h4 class="modal-title" id="myModalLabel"></h4>
       					<div class="starRev">
							<span class="starR1 on star1">별1_왼쪽</span>
							<span class="starR2">별1_오른쪽</span>
							<span class="starR1">별2_왼쪽</span>
							<span class="starR2">별2_오른쪽</span>
							<span class="starR1">별3_왼쪽</span>
							<span class="starR2">별3_오른쪽</span>
							<span class="starR1">별4_왼쪽</span>
							<span class="starR2">별4_오른쪽</span>
							<span class="starR1">별5_왼쪽</span>
							<span class="starR2">별5_오른쪽</span>
						</div>
     				</div>
     				<div class="modal-body">
     					<input type="hidden" id="modal-itemNo">
     					<input type="hidden" id="modal-reserveNo">
       					<textarea id="reviewContent" style="width:100%;" rows="10" placeholder="내용을 입력해주세요"></textarea>
     				</div>
     				<div class="modal-footer">
     					<button type="button" class="btn btn-primary" id="review-submit">등록</button>
       					<button type="button" class="btn btn-danger" data-dismiss="modal" id="closeModal">닫기</button>
     				</div>
    			</div>
  			</div>
  		</div>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   
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
	      
	      $("input[name=status]").click(function(){
	      	var status = $(this).val();
	      	stsChange(status);
	      });
	      
	      $("#morebtn").click(function(){
				var status;
				$("input[name=status]").each(function(index,item){
					if($(item).prop("checked")==true){
						status = $(item).val();
					}
				});
				moreReserve($(this).val(),status);
			});
	      
	      $("#all").prop("checked",true);
	      
	      $('.starRev span').click(function(){
	    	  $(this).parent().children('span').removeClass('on');
	    	  $(this).addClass('on').prevAll('span').addClass('on');
	    	});
	      
	      $("#closeModal").click(function(){
	    	  $(".star1").parent().children('span').removeClass('on');
	    	  $(".star1").addClass('on').prevAll('span').addClass('on');
	    	  $("#reviewContent").val("");
	      });
	      
	      $("#review-submit").click(function(){
	    	  var status;
				$("input[name=status]").each(function(index,item){
					if($(item).prop("checked")==true){
						status = $(item).val();
					}
				});
	    	 var reviewContent =  $("#reviewContent").val();
	    	 if(reviewContent==null||reviewContent==""){
	    		 alert("내용을 입력해주세요");
	    	 }else{
	    		 var itemNo = $("#modal-itemNo").val();
		    	 var reserveNo = $("#modal-reserveNo").val();
		    	 var reviewRate=0;
		    	 $(".starRev>span").each(function(index,item){
		    		 if($(item).hasClass("on")==true){
		    			 reviewRate+=1;
		    		 }
		    	 });
		    	 var param = {reviewContent:reviewContent,itemNo:itemNo,reserveNo:reserveNo,reviewRate:reviewRate};
	    		 $.ajax({
		    		 url:"/writeReview.do",
		    		 data:param,
		    		 type:"post",
		    		 dataType:"json",
		    		 success:function(data){
		    			 if(data==1){
	    				 	$("#reviewModal").modal("hide");
							$(".star1").parent().children('span').removeClass('on');
							$(".star1").addClass('on').prevAll('span').addClass('on');
							$("#reviewContent").val("");
			    			alert("후기작성완료");
			    			stsChange(status);
		    			 }else{
		    				 alert("후기작성실패");
		    			 }
		    		 },
		    		 error:function(){
		    			 console.log("후기작성오류");
		    		 }
		    	 });
	    	 }
	      });
	      
	      stsChange("all");
	    });
	    
	    function reviewModal(reserveNo){
	    	var id = "#reserve"+reserveNo;
	    	var title = $(id).children().children().children().find("#itemTitle").html();
	    	var itemNo = $(id).children().children().children().find("#itemTitle").attr("value");
	    	$("#reviewModal").modal("show");
	    	$("#reviewModal").find("h4").html(title);
	    	$("#reviewModal").find("#modal-reserveNo").val(reserveNo);
	    	$("#reviewModal").find("#modal-itemNo").val(itemNo);
	    }
	    
	    function moreReserve(start,status){
	    	var param = {start:start,status:status};
	    	$.ajax({
	    		url:"/moreReserve.do",
	    		data:param,
	    		type:"post",
	    		dataType:"json",
	    		success:function(data){
	    			var html="";
	    			for(var i=0; i<data.length; i++){
	    				var td = data[i].tourDate;
	    				var tourDate = new Date(td).getTime();
	    				html+="<div class='reserve-info' id='reserve"+data[i].reserveNo+"'>"+
							"<table>"+
								"<tr>"+
									"<td rowspan='3' colspan='4'>"+
										"<span>상품명</span>"+
										"<span><a id='itemTitle' value="+data[i].itemNo+" href='/tourView.do?itemNo="+data[i].itemNo+"'>"+data[i].itemTitle+"</a></span>"+
									"</td>"+
									"<td colspan='2'>"+
										"<span>예약자</span>"+
										"<span id='memberId'>"+data[i].memberId+"</span>"+
									"</td>"+
								"</tr>"+
								"<tr>"+
									"<td colspan='2'>"+
										"<span>예약인원</span>"+
										"<span id='personCount'>"+data[i].personCount+"명</span>"+
									"</td>"+
								"</tr>"+
								"<tr>"+
									"<td colspan='2'>"+
										"<span>예약날짜</span>"+
										"<span id='reserveDate'>"+data[i].tourDate+"일 "+data[i].tourTime+"시</span>"+
									"</td>"+
								"</tr>"+
								"<tr>"+
									"<td colspan='2'>"+
										"<span>결제금액</span>"+
										"<span id='totalPay'>"+data[i].totalPay+"원</span>"+
									"</td>"+
									"<td colspan='3'>"+
										"<span>결제시간</span>"+
										"<span id='payDate'>"+data[i].payDate+"</span>"+
									"</td>"+
									"<td colspan='1'>";
								if(data[i].status==1){
									html+="<span style='background-color:red; color:white;'>취소</span>";
								}else if(tourDate>new Date){
									html+="<button class='btn btn-primary stsbtn' onclick=\"cancel("+data[i].reserveNo+",'"+data[i].memberId+"')\">취소하기</button>";
								}else if(data[i].checkReview==0){
									html+="<button class='btn btn-success stsbtn' onclick='reviewModal("+data[i].reserveNo+")' data-toggle='modal' data-target='#myModal'>후기 작성</button>";
								}else if(data[i].checkReview==1){
									html+="<span>후기작성완료</span>";
								}
								html+="</td>"+
								"</tr>"+
							"</table>"+
						"</div>";
	    			}
	    			$(".reserve-list").append(html);
	    			$("#morebtn").val(Number(start)+10);
					$("#morebtn").attr("currentCount",Number($("#morebtn").attr("currentCount"))+data.length);
					var totalCount = $("#morebtn").attr("totalCount");
					var currentCount = $("#morebtn").attr("currentCount");
					if(totalCount<=currentCount){
						$("#morebtn").prop("disabled",true);
						$("#morebtn").css("display","none");
					}
	    		},
	    		error:function(){
	    			console.log("예약불러오기오류");
	    		}
	    	});
	    };

		function stsChange(status){
			var param = {status:status};
			$.ajax({
				url:"/selectTotalCount.do",
				data:param,
				type:"post",
				dataType:"json",
				success:function(data){
					$("#morebtn").attr("totalCount",data);
					$("#morebtn").attr("currentCount",0);
					$("#morebtn").attr("value","");
					$("#morebtn").prop("disabled",false);
					$("#morebtn").css("display","block");
					$(".reserve-list").html("");
					moreReserve(1,status);
				},error:function(){
					console.log("예약수불러오기오류");
				}
			});
		};
		
		function cancel(reserveNo,item){
			var status;
			$("input[name=status]").each(function(index,item){
				if($(item).prop("checked")==true){
					status = $(item).val();
				}
			});
			if(confirm("정말로 예약을 취소하시겠습니까?")){
				$.ajax({
					url:"/cancelReserve.do",
					data:{reserveNo:reserveNo},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data==1){
							alert("정상적으로 취소되었습니다");
							stsChange(status);
						}else{
							alert("취소실패");
						}
					},
					error:function(){
						console.log("취소작업오류");
					}
				});
			}
		}
      
	    $("#datepicker").datepicker({
	      iconsLibrary: "fontawesome",
	      icons: {
	        rightIcon: "_$tag___________________________$tag__",
	      },
	    });
    </script>
  </body>
</html>
