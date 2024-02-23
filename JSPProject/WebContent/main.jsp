<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>OnePage Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
  
  <%
	String sessionId = (String) session.getAttribute("sessionId");
  %>    
  
  
  <sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" 
	user="c##carmarket" password="c##carmarket" />
  
  <sql:query dataSource="${dataSource}" var="resultSet">
  	 SELECT * FROM MEMBER WHERE ID=?
  	 <sql:param value="<%=sessionId%>" />
  </sql:query>
  
</head>

<body>

  <jsp:include page = "top.jsp" />

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">
      <div class="row justify-content-center">
        <div class="col-xl-7 col-lg-9 text-center">
          <h1>프로젝트 메인 페이지</h1>
          <h2>WELCOME TO MY PROJECT PAGE</h2>
        </div>
      </div>

      <div class="row icon-boxes">
        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="200">
          <div class="icon-box">
            <div class="icon"><i class="ri-stack-line"></i></div>
            <h4 class="title"><a href="cars.jsp">차량 매물 보기</a></h4>
            <p class="description">현재 등록되어있는 차량의 매물을 확인하실 수 있습니다.</p>
          </div>
        </div>

        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="300">
          <div class="icon-box">
            <div class="icon"><i class="ri-palette-line"></i></div>
            <h4 class="title"><a href="">자유게시판</a></h4>
            <p class="description">다양한 차량의 후기를 작성하시고 확인해보세요.</p>
          </div>
        </div>
		
		
		<c:forEach var="row" items="${resultSet.rows}">
	
			<c:choose>
			
				<c:when test = "${row.authority eq '1'}">
				
			        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="400">
			          <div class="icon-box">
			            <div class="icon"><i class="ri-command-line"></i></div>
			            <h4 class="title"><a href="editCar.jsp">차량 관리</a></h4>
			            <p class="description">차량 매물을 등록해보세요</p>
			            <p class="description">현재 이용 가능합니다 </p>
			          </div>
			        </div>
					
	
			        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="500">
			          <div class="icon-box">
			            <div class="icon"><i class="ri-fingerprint-line"></i></div>
			            <h4 class="title"><a href="editMember.jsp">회원 관리</a></h4>
			            <p class="description">가입된 회원을 관리해보세요</p>
			            <p class="description">현재 이용 가능합니다 </p>
			          </div>
			        </div>
			
				</c:when>
				
				<c:otherwise>
				
<!-- 					<div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="400"> -->
<!-- 			          <div class="icon-box"> -->
<!-- 			            <div class="icon"><i class="ri-command-line"></i></div> -->
<!-- 			            <h4 class="title"><a href="#">차량 관리</a></h4> -->
<!-- 			            <p class="description">차량 매물을 등록해보세요</p> -->
<!-- 			            <p class="description">관리자만 이용 가능합니다 </p> -->
<!-- 			          </div> -->
<!-- 			        </div> -->
			
<!-- 			        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="500"> -->
<!-- 			          <div class="icon-box"> -->
<!-- 			            <div class="icon"><i class="ri-fingerprint-line"></i></div> -->
<!-- 			            <h4 class="title"><a href="#">회원 관리</a></h4> -->
<!-- 			            <p class="description">가입된 회원을 관리해보세요</p> -->
<!-- 			            <p class="description">관리자만 이용 가능합니다 </p> -->
<!-- 			          </div> -->
<!-- 			        </div> -->
								
				</c:otherwise>
			</c:choose>
		</c:forEach>
      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">
  
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>주소</h2>
        </div>

        <div>
          <iframe style="border:0; width: 100%; height: 270px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1631.010723967358!2d129.05809183246544!3d35.156085846685606!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568eb6feb39fa0d%3A0x17502eaffb28a5b4!2z67aA7IKwSVTqtZDsnKHshLzthLA!5e0!3m2!1sko!2skr!4v1708305349838!5m2!1sko!2skr" frameborder="0" allowfullscreen></iframe>
        </div>
       
      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <jsp:include page = "footer.jsp" />
  
  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>