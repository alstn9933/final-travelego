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
        section{
            display: block;
            overflow: hidden;
        }
        header{
            z-index: 100;
        }
    	.search-area{
    		margin-top: 50px;
            padding-bottom: 20px;
            border-bottom: 1px solid lightgray;
            overflow: hidden;
    	}
        .search-area select{
            width: 200px;
            height: 30px;
            margin: 10px;
            box-sizing: border-box;
            margin-left: 20px;
        }
        #searchtext{
            width: 430px;
        }
        .search{
            margin: 20px;
        }
        .tourContent{
            margin-top: 20px;
            overflow:hidden;
        }
        .item{
            float: left;
            width: 280px;
            height: 400px;
            background-color: aliceblue;
            overflow:hidden;
            border-radius: 20px;
            margin: 10px;
            position: relative;
            z-index:50;
        }
        .item>div{
            overflow: hidden;
        }
        .item>h1{
        	width:280px;
        	height:280px;
        	line-height:280px;
        	position:absolute;
        	padding:0;
        	margin:0;
        	top:0;
        	text-align: center;
        	background:gray;
        	z-index:51;
        	font-size:100px;
        	color:white;
        	opacity:0.7;
        }
        .item:hover{
            cursor: pointer;
            background-color: #25e6b5;
        }
        .item:hover img{
            transform: scale(1.3,1.3);
            transition-duration: 0.5s;
        }
        .itemTitle{
            width:100%;
            height: 70px;
            padding:10px;
        }
        .item-main-img{
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            width: 280px;
            height: 280px;
        }
        .term{
        	border-top:1px solid gray;
        	margin-top:10px;
        	text-align:center;
        }
        .score{
            text-align: right;
            padding:10px;
            padding-bottom:0;
            position:absolute;
            background-color:rgba(100,100,100,0.5);
            color:white;
            width:100%;
        }
        .morebtn{
        	overflow:hidden;
        }
        #more-btn{
        	width:100%;
        	height:50px;
        }
        .morebtn>label>img{
        	width:50px;
        	height:50px;
        	margin:0 auto;
        }
    </style>
    <script>
    	$(function(){
    		$(".item").click(function(){
    			var itemNo = $(this).attr("itemNo");
    			location.href="/tourView.do?itemNo="+itemNo;
    		});
    		
    		function fn_more(start,val){
    			var param = {start:start,val:val};
    			$.ajax({
    				url: "/moreItem.do",
    				data : param,
    				type : "post",
    				dataType : "json",
    				success : function(data){
    					console.log(data.length);
    					var html = "";
    					for(var i=0; i<data.length; i++){
    						html += "<div class='item' itemNo="+data[i].itemNo+" onclick='itemView("+data[i].itemNo+");'>";
    						if(data[i].score==0){
    							html += "<div class='score'>후기가 없습니다</div>";
    						}else{
    							html += "<div class='score'>"+data[i].score.toFixed(1)+"점</div>";
    						}
    						html += "<div><img class='item-main-img' src='../../../upload/images/tour/thumnail/"+data[i].filename+"'></div>";
    						html += "<div class='itemTitle'>"+data[i].itemTitle+"</div>";
    						
    						html += "<div class='term'>"+data[i].beginDate+" ~ "+data[i].endDate+"</div>";
    						if(data[i].closeCheck==1){
    							html += "<h1>마감</h1>";
    						}
    						html += "</div>";
    					}
    					$(".tourContent").append(html);
    					$("#more-btn").val(Number(start)+12);
    					$("#more-btn").attr("currentCount",Number($("#more-btn").attr("currentCount"))+data.length);
    					var totalCount = $("#more-btn").attr("totalCount");
    					var currentCount = $("#more-btn").attr("currentCount");
    					if(totalCount<=currentCount){
    						$("#more-btn").prop("disabled",true);
    						$("#more-btn").css("display","none");
    					}
    				},
    				error : function(){
    					console.log("실패");
    				}
    			});
    		}
    		
   			fn_more(1,"ctl");
   			$("#more-btn").click(function(){
   				fn_more($(this).val(),"ctl");
   			});
    	})
    	
    	function itemView(itemNo){
   			location.href="/tourView.do?itemNo="+itemNo;
    	};
    </script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <!-- 여기서부터 작성하시면 됨!!!!!!! -->
        <div class="search-area">
            <div class="search">
                <form action="/searchItems.do" method="get">
                    <input id="searchtext" type="text" name="searchValue" placeholder="보고싶은 상품명을 검색해주세요">
                    <input type="submit" value="검색">
                </form>
            </div>
            <div class="region">
                <select id="region-country">
                    <option value="all">나라선택</option>
                    <option value="1">한국</option>
                </select>
                <select id="refgion-city">
                    <option value="all">지역선택</option>
                    <option value="1">서울</option>
                    <option value="2">부산</option>
                </select>
            </div>
        </div>
        <div class="tourContent">
        </div>
        <div class="morebtn">
       		<button class="btn btn-outline-info" id="more-btn" totalCount="${totalCount }" currentCount="0" value="">더보기</button>
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
<!--    <script src="/src/js/header/nice-select.min.js"></script>-->
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
