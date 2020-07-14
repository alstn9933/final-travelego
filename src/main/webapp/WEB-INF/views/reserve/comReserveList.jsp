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
	    .section-title{
	    	border-bottom:1px solid black;
	    }
	    .section-top{
	    	border:1px solid lightgray;
	    }
	    .section-content{
	    	border-top:none;
	    	width:100%;
	    	height:700px;
	    	overflow: auto;
	    	border-bottom:1px solid lightgray;
	    }
    	table{
    		width:1183px;
            table-layout:fixed;
    	}
    	table td{
    		height:20px;
    		text-align:center;
    		box-sizing:border-box;
    		overflow:hidden;
            text-overflow: ellipsis;
            overflow: hidden;
            border: 1px solid lightgray;
    	}
    	#title{
    		width:100%;
    		height:5px;
    	}
    	table tr>td:nth-child(1) {
			width:60px;
		}
		table tr>td:nth-child(2) {
			width:213px;
		}
		table tr>td:nth-child(3) {
			width:107px;
		}
		table tr>td:nth-child(4) {
			width:142px;
		}
		table tr>td:nth-child(5) {
			width:177px;
		}
		table tr>td:nth-child(6) {
			width:94px;
		}
		table tr>td:nth-child(7) {
			width:94px;
		}
		table tr>td:nth-child(8) {
			width:114px;
		}
		table tr>td:nth-child(9) {
			width:114px;
		}
		table tr>td:nth-child(10) {
			width:55px;
		}
 		.section-top tr:first-child>td{
			border-bottom:none;
		}
		.section-top tr:last-child>td{
			border-top :none;
			border-bottom:2px solid black;
		}
		#reserveList tr:first-child>td{
			border-top:none;
		}
		#reserveList tr:last-child>td{
			border-top:2px solid black;
		}
		select[name=itemNo]{
			width:100%;
			height:100%;
		}
		select[name=tourTime]{
			width:100%;
			height:100%;
		}
		td>input{
			width:100%;
		}
    </style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <!-- 여기서부터 작성하시면 됨!!!!!!! -->
      <h1 class="section-title">Manage Reservation</h1>
	<table class="section-top">
		<tr>
			<td>NO</td>
			<td>상품명</td>
			<td>예약자</td>
			<td>예약자 번호</td>
			<td>예약날짜</td>
			<td>예약시간</td>
			<td>예약인원</td>
			<td>결제일</td>
			<td>결제금액</td>
			<td>상태</td>
		</tr>
		<tr>
			<td><button id="listAll" type="button" class="btn btn-info btn-sm">전체</button></td>
			<td>
				<select name="itemNo">
					<option value="0">전체보기</option>
					<c:forEach items="${tList }" var="t">
						<option value="${t.itemNo }">${t.itemTitle }</option>
					</c:forEach>
				</select>
			</td>
			<td><input type="text" name="memberName" placeholder="이름입력"></td>
			<td><input type="text" name="phone" placeholder="번호입력"></td>
			<td><input type="date" name="tourDate" placeholder="날짜선택"></td>
			<td>
				<select name="tourTime">
				</select>
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<select name="status">
					<option value=0>예약</option>
					<option value=1>취소</option>
					<option value=2>완료</option>
				</select>
			</td>
		</tr>
	</table>
	<div class="section-content ">
		<table id="reserveList">
		</table>
	</div>
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
		$("[data-toggle='popover']").popover();
		
		$("select[name=itemNo]").change(function(){
			var itemNo = $(this).val();
			if(itemNo!=0){
				$.ajax({
					url:"/changeTimes.do",
					data:{itemNo:itemNo},
					type:"post",
					dataType:"json",
					success:function(data){
						var html = "";
						html+="<option value='null'>전체</option>";
						for(var i=0; i<data.length; i++){
							html+="<option value='"+data[i]+"'>"+data[i]+"시</option>";
						}
						$("select[name=tourTime]").html(html);
					},error:function(){
						console.log("상품시간불러오기오류");
					}
				});
			}else{
				var html = "";
				html+="<option value='null'>전체</option>";
				$("select[name=tourTime]").html(html);
			}
			changeList();
		});
		
		$("select[name=tourTime]").change(function(){
			changeList();
		});
		
		$("input[name=memberName]").keyup(function(){
			changeList();
		});
		
		$("input[name=phone]").keyup(function(){
			changeList();
		});
		
		$("input[name=tourDate]").change(function(){
			changeList();
		});
		
		$("select[name=status]").change(function(){
			changeList();
		});
		
		$("#listAll").click(function(){
			$("select[name=itemNo]").val("0").prop("selected", true);
			var html = "";
			html+="<option value='null'>전체</option>";
			$("select[name=tourTime]").html(html);
	    	var memberName = $("input[name=memberName]").val("");
	    	var phone = $("input[name=phone]").val("");
	    	var tourDate = $("input[name=tourDate]").val("");
			changeList();
		});
		
		var html = "";
		html+="<option value='null'>전체</option>";
		$("select[name=tourTime]").html(html);
		changeList();
    });
    
    function changeList(){
    	var itemNo = $("select[name=itemNo]").val();
    	var memberName = $("input[name=memberName]").val();
    	var phone = $("input[name=phone]").val();
    	var tourDate = $("input[name=tourDate]").val();
    	var tourTime = $("select[name=tourTime]").val();
    	var status = $("select[name=status]").val();
    	var param = {itemNo:itemNo, memberName:memberName, phone:phone, tourDate:tourDate, tourTime:tourTime, status:status};
    	
    	$.ajax({
    		url:"/changeList.do",
    		data:param,
    		type:"post",
    		dataType:"json",
    		success:function(data){
    			var html="";
    			var cnt=0;
    			for(var i=0; i<data.length; i++){
    				var tourDate = new Date(data[i].tourDate).getTime();
    				html+="<tr>";
					html+="<td>"+data[i].reserveNo+"</td>";
					html+="<td><span id='title'>"+data[i].itemTitle+"</span></td>";
					if(data[i].memberName==null){
						html+="<td>탈퇴회원</td>";
					}else{
						html+="<td>"+data[i].memberName+"</td>";
					}
					if(data[i].phone==null){
						html+="<td>탈퇴회원</td>";
					}else{
						html+="<td>"+data[i].phone+"</td>";
					}
					html+="<td>"+data[i].tourDate+"</td>";
					html+="<td>"+data[i].tourTime+"시</td>";
					html+="<td>"+data[i].personCount+"명</td>";
					cnt += data[i].personCount;
					html+="<td>"+data[i].payDate+"</td>";
					html+="<td>"+data[i].totalPay+"원</td>";
					if(data[i].status==0){
						if(tourDate<=new Date){
							html+="<td>완료</td>";
						}else{
							html+="<td><button type='button' class='btn btn-info btn-sm' onclick=\"cancel("+data[i].reserveNo+",'"+data[i].memberId+"');\">취소</button></td>";
						}
					}else if(data[i].status==1){
						html+="<td>취소</td>";
					}
					html+="</tr>";
    			}
    			html+="<tr><td>인원수</td><td></td><td></td><td></td><td></td><td></td><td>"+cnt+"명</td><td></td><td></td><td></td>";
    			$("#reserveList").html(html);
    		},
    		error:function(){
    			console.log("리스트 불러오기 실패");
    		}
    	});
    };
    
    function cancel(reserveNo,memberId){
    	$.ajax({
    		url:"/cancelReserve.do",
    		data:{reserveNo:reserveNo,memberId:memberId},
    		type:"post",
    		dataType:"json",
    		success:function(data){
    			if(data>0){
    				alert("취소되었습니다");
    				changeList();
    			}else{
    				alert("취소실패");
    			}
    		},
    		error:function(){
    			console.log("취소기능오류");
    		}
    	});
    };

     $("#datepicker").datepicker({
	     iconsLibrary: "fontawesome",
	     icons: {
	       rightIcon: "_$tag___________________________$tag__",
	     },
     });
    </script>
  </body>
</html>
