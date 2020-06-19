<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<header>
  <div class="header-area">
    <div id="sticky-header" class="main-header-area">
      <div class="container-fluid">
        <div class="header_bottom_border">
          <div class="row align-items-center">
            <div class="col-xl-2 col-lg-2">
              <div class="logo">
                <a href="index.html"
                  ><img
                    src="/src/imgs/header/mainlogo.png"
                    style="width: 100%; height: 90px;"
                    alt=""
                  />
                </a>
              </div>
            </div>
            <div class="col-xl-6 col-lg-6">
              <div class="main-menu d-none d-lg-block">
                <nav>
                  <ul id="navigation">
                    <li><a class="active" href="index.html">일정게시판</a></li>
                    <li><a href="about.html">추천게시판</a></li>
                    <li>
                      <a class="" href="/tourList.do">투어/티켓</a>
                    </li>
                    <li><a href="contact.html">공지사항</a></li>
                  </ul>
                </nav>
              </div>
            </div>
            <div class="col-xl-4 col-lg-4 d-none d-lg-block">
              <div
                class="social_wrap d-flex align-items-center justify-content-end"
              >
                <!-- 알림 아이콘 자리 -->
                <div class="alramIcon">
                  <i class="far fa-bell ringmybell"></i>
                </div>
                <c:if test="${not empty sessionScope.member }"></c:if>
                  <div class="main-menu d-none d-lg-block">
                    <nav>
                      <ul id="navigation">
                        <ul class="submenu">
                          <li>
                            <a href="#"><i class="far fa-user userIcon"></i></a>
                            <ul class="submenu">
                              <li>
                                <a href="destination_details.html">내정보</a>
                              </li>
                              <li><a href="elements.html">일정만들기</a></li>
                              <li><a href="elements.html">쪽지함</a></li>
                            </ul>
                          </li>
                        </ul>
                      </ul>
                    </nav>
                  </div>
                
                <c:if test="${empty sessionScope.member }">
            <div class="notlogin">
              <div class="logo2">
               <a 
                    href="#"
                    title="회원정보가 없습니다!"
                    
                    data-toggle="popover"
                    data-placement="bottom"
                    ><i class="far fa-user userIcon"></i
                  ></a>
              </div>
            </div>
                  
                </c:if>
                <div class="logout">
                  <a href="#"><i class="fas fa-sign-out-alt logoutIcon"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
