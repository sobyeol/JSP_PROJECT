<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>    

<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
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
<title>Insert title here</title>
</head>
<body>

  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="main.jsp">JSP 프로젝트</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="main.jsp">메인 화면</a></li>
          <li><a class="nav-link scrollto" href="cars.jsp">차량 매물 보기</a></li>
          <li><a class="nav-link scrollto" href="<c:url value="/BoardListAction.do?pageNum=1"/>">자유게시판</a></li>
          

          
          
          <c:choose>
          
	          <c:when test = "${empty sessionId }">
		          <li><a class="getstarted scrollto" href="loginMember.jsp">로그인</a></li>
		          <li><a class="getstarted scrollto" href="addMember.jsp">회원가입</a></li>
	          </c:when>
	          
	          <c:when test = "${sessionId eq 'admin'}">
	          	<li><a class="nav-link scrollto o" href="editCar.jsp">차량 관리</a></li>
          	  	<li><a class="nav-link scrollto o" href="addCar.jsp">차량 등록</a></li>
          		<li><a class="nav-link scrollto" href="editMember.jsp">회원 관리</a></li>
          		<li><a class="nav-link scrollto">[<%=sessionId%>님]</a></li>  
          	  	<li><a class="getstarted scrollto" href="logoutMember.jsp">로그아웃</a></li>
          	  	<li><a class="getstarted scrollto" href="updateMember.jsp">회원정보</a></li>
	          </c:when>
	          
	          <c:otherwise>
          	  	
          	  	<li><a class="nav-link scrollto o" href="cart.jsp">장바구니</a></li>
          	  	<li><a class="nav-link scrollto">[<%=sessionId%>님]</a></li>
          	  	
          	  	<li><a class="getstarted scrollto" href="logoutMember.jsp">로그아웃</a></li>
          	  	<li><a class="getstarted scrollto" href="updateMember.jsp">회원정보</a></li>
          	  </c:otherwise>
          </c:choose>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->



</body>
</html>