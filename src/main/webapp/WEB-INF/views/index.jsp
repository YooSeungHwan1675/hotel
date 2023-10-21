<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>더조은 호텔</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet"  href="./css/styles_main.css" />
    <link rel="stylesheet" href="./css/style_index.css">
    
    <style type="text/css">
    	.map #map {
		  /* pointer-events: none; */
		  height: 100%;
		  width: 100%;
		  border: 0;
		}
		
		.content-section {
			padding: 2rem;
		}
		
		.service-icon:hover {
			color: #fff;
			background-color: rgb(236, 184, 7);
		}
		
		.service {
		  padding: 3rem 0;
		  background: linear-gradient(90deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.1) 100%), url("./images/bg-callout.jpg");
		  background-position: center center;
		  background-repeat: no-repeat;
		  background-size: cover;
		}
		
		.service h2, .service .h2 {
		  font-size: 3.5rem;
		  font-weight: 700;
		  display: block;
		  max-width: 30rem;
		}
		
		.masthead {
    	  height: 100vh;
	  	}
    </style>
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e877dae5b5819be5c98e49539ec3e5dc"></script>
	<title>여행을떠나요</title>
	
	<script type="text/javascript">
		$(() => {
			//alert(123);
			
			//frame
		});
		
		function onFrame(type) {
			switch (type) {
			case "1":
				$("#frame").attr("src", "<%= request.getContextPath() %>/event.do");	
				break;
			case "2":
				$("#frame").attr("src", "<%= request.getContextPath() %>/notice.do");
				break;
			case "3":
				if ("${sessionScope.memberName}" == "") {
					window.location = "<%= request.getContextPath() %>/login/login.do";
				} else {
					$("#frame").attr("src", "<%= request.getContextPath() %>/question.do");
				}
				break;
			default:
				if ("${sessionScope.memberName}" == "") {
					window.location = "<%= request.getContextPath() %>/login/login.do";
				} else {
					$("#frame").attr("src", "<%= request.getContextPath() %>/reservation.do");
				}
				break;
			}
			
		}
		
		function onLocation(type) {
			if (type == 1) {
				mapOption = { 
			        center: new kakao.maps.LatLng(37.569131, 126.984577), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
				map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				position =  new kakao.maps.LatLng(37.569131, 126.984577);
			} else {
				mapOption = { 
			        center: new kakao.maps.LatLng(37.49475348846853, 127.02993838235027), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
				map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
				position =  new kakao.maps.LatLng(37.49475348846853, 127.02993838235027);
			}
			
			marker = new kakao.maps.Marker({
			  position: position
			});
			
			// 마커를 지도에 표시합니다.
			marker.setMap(map);
		}
		
		function open3(){
				window.open("http://192.168.0.240:8080/project/home", "_blank", "width=600, height=470");
			}
	</script>
</head>
<body>
	<!-- Navigation-->
    <a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <li class="sidebar-brand">
            	<c:choose>
				    <c:when test="${sessionScope.memberName == null}">
				    	<a class="menu_title" href="<%= request.getContextPath() %>/login/Login.do">로그인</a>
				    </c:when>
				    <c:otherwise>
				    	<a href="<%=request.getContextPath()%>/member/info.do">${sessionScope.memberName} 님</a>
				    	&nbsp;&nbsp;
				    	<a onclick="open3()"><i class="bi bi-chat-right-dots"></i></a>
				    	&nbsp;&nbsp;
				    	<a href="<%=request.getContextPath()%>/login/logout.do"><i class="bi bi-box-arrow-right"></i></a>
				    </c:otherwise>
				</c:choose>
            </li>
            <li class="sidebar-nav-item"><a href="#main">홈으로</a></li>
            <li class="sidebar-nav-item"><a href="#about">호텔 소개</a></li>
            <li class="sidebar-nav-item"><a href="#services">서비스</a></li>
            <li class="sidebar-nav-item"><a href="#promotion">홍보 영상</a></li>
            <li class="sidebar-nav-item"><a href="#location">위치</a></li>
        </ul>
    </nav>
    <!-- Header-->
    <header class="masthead d-flex align-items-center" id="main">
    	<div class="conA">
			<div class="slide img1">
				<img src="./images/01.jpg" style="width:100%; height: 100vh; object-fit: cover;">
			</div>
			<div class="slide img2">
				<img src="./images/02.jpg" style="width:100%; height: 100vh; object-fit: cover;">
			</div>
			<div class="slide img3">
				<img src="./images/03.jpg" style="width:100%; height: 100vh; object-fit: cover;">
			</div>
		</div>
        <div class="container px-4 px-lg-5 text-center" style="z-index: 1;">
            <h1 class="mb-1" style="color: #fff;">더조은 호텔</h1>
            <h3 class="mb-5" style="color: #fff;"><em>Welcome to the TheJoeun hotel</em></h3>
            <a class="btn btn-primary btn-xl" href="#services">예약하기</a>
        </div>
    </header>
    <!-- About-->
    <section class="content-section bg-light" id="about">
        <div class="container px-4 px-lg-5 text-center">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-lg-10">
                    <h2>더조은 IT 호텔 프로젝트</h2>
                    <p class="lead mb-5">
                        더조은 호텔은 수많은 국빈방문과 국제행사를 치러내며 한국을 대표하여 서비스 산업을 선도하고 있습니다.
                    </p>
                    <a class="btn btn-dark btn-xl" href="#location">호텔찾기</a>
                </div>
            </div>
        </div>
    </section>
    <!-- Services-->
    <section class="content-section bg-primary text-white text-center" id="services">
        <div class="container px-4 px-lg-5">
            <div class="content-section-heading">
                <h3 class="text-secondary mb-0">SERVICES</h3>
                <h2 class="mb-5">서비스</h2>
            </div>
            <div class="row gx-4 gx-lg-5">
            	<div class="col-lg-3 col-md-6 mb-5 mb-md-0">
                   	<span class="service-icon rounded-circle mx-auto mb-3" onclick="onFrame('1')" style="cursor: pointer;"><i class="icon-like"></i></span>
                    
                    <h4><strong>이벤트</strong></h4>
                    <p class="text-faded mb-0">Event</p>
                </div>
                <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
                	<span class="service-icon rounded-circle mx-auto mb-3" onclick="onFrame('2')" style="cursor: pointer;"><i class="icon-mustache"></i></span>
                    <h4><strong>공지사항</strong></h4>
                    <p class="text-faded mb-0">Notice</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <span class="service-icon rounded-circle mx-auto mb-3" onclick="onFrame('3')" style="cursor: pointer;"><i class="icon-pencil"></i></span>
                    <h4><strong>문의</strong></h4>
                    <p class="text-faded mb-0">Question</p>
                </div>
                <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
                    <span class="service-icon rounded-circle mx-auto mb-3" onclick="onFrame('4')" style="cursor: pointer;"><i class="icon-screen-smartphone"></i></span>
                    <h4><strong>예약</strong></h4>
                    <p class="text-faded mb-0">Reservation</p>
                </div>
            </div>
        </div>
    </section>
    
    <section class="service">
    	<div class="container" style="height: 500px; background-color: white; padding: 0px">
    		<iframe id="frame" src="<%= request.getContextPath() %>/event.do" width="100%" height="100%"></iframe>
    	</div>
    </section>
    
    <section class="content-section" id="promotion">
        <div class="container px-4 px-lg-5">
            <div class="content-section-heading text-center">
                <h3 class="text-secondary mb-0">PROMOTION</h3>
                <h2 class="mb-5">홍보 영상</h2>
            </div>
            <div class="row gx-0">
                <div class="col-lg-6">
                    <a class="portfolio-item" href="#!">
                    	<iframe width="100%" height="380px" src="https://www.youtube.com/embed/zJ5xsXQTwrk" 
                    	title="부산국제트래블마트 아난티 힐튼 부산 홍보영상" frameborder="0" 
                    	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    	allowfullscreen></iframe>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a class="portfolio-item" href="#!">
                    	<iframe width="100%" height="380px" src="https://www.youtube.com/embed/7ssiZAwZnfQ" 
                    	title="강릉 세인트존스호텔 홍보영상" frameborder="0" 
                    	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    	allowfullscreen></iframe>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a class="portfolio-item" href="#!">
                    	<iframe width="100%" height="380px" src="https://www.youtube.com/embed/1Pw7pik2s5k" 
                    	title="[홍보영상] 파라다이스호텔 부산 창립 40주년" frameborder="0" 
                    	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    	allowfullscreen></iframe>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a class="portfolio-item" href="#!">
                    	<iframe width="100%" height="380px" src="https://www.youtube.com/embed/wphai3v-SXE" 
                    	title="제주신라호텔 홍보영상" frameborder="0" 
                    	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    	allowfullscreen></iframe>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Call to Action-->
    <section class="content-section bg-primary text-white" id="location">
        <div class="container px-4 px-lg-5 text-center">
            <h2 class="mb-4">LOCATION</h2>
            <a class="btn btn-xl btn-light me-4" href="#!" onclick="onLocation(1)">종로</a>
            <a class="btn btn-xl btn-dark" href="#!" onclick="onLocation(2)">강남</a>
        </div>
    </section>
    <!-- Map-->
    <div class="map">
    	<div id="map"></div>
    	<script src="./js/mapScript.js"></script>
    </div>
    <!-- Footer-->
    <footer class="footer text-center">
        <div class="container px-4 px-lg-5">
            <ul class="list-inline mb-5">
                <li class="list-inline-item">
                    <a class="social-link rounded-circle text-white mr-3" href="#!"><i class="icon-social-facebook"></i></a>
                </li>
                <li class="list-inline-item">
                    <a class="social-link rounded-circle text-white mr-3" href="#!"><i class="icon-social-twitter"></i></a>
                </li>
                <li class="list-inline-item">
                    <a class="social-link rounded-circle text-white" href="#!"><i class="icon-social-github"></i></a>
                </li>
            </ul>
            <p class="text-muted small mb-0">Copyright &copy; 더조은 컴퓨터 2023</p>
        </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#main"><i class="fas fa-angle-up"></i></a>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./js/scripts_main.js"></script>	
</body>

</html>