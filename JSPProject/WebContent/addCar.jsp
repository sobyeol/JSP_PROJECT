<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<link rel = "stylesheet"
   href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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


<title>차량 등록</title>
</head>
<body>

	<jsp:include page = "top.jsp" />

	<section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h1>차량 등록</h1>
        </div>
           
      </div>
    </section>

	

	<div class="container">
		<form name="newMember" class="form-horizontal"  action="processAddCar.jsp" method="post" enctype = "multipart/form-data">
			<div class="form-group  row">
				<label class="col-sm-2 ">차량 고유 번호</label>
				<div class="col-sm-3">
					<input name="carId" type="text" class="form-control" placeholder="Ex) C1234" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">차량 이름</label>
				<div class="col-sm-3">
					<input name="carName" type="text" class="form-control" placeholder="Ex) K5" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">차량 가격</label>
				<div class="col-sm-3">
					<input name="carPrice" type="text" class="form-control" placeholder="Ex) 15000000원" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">차량 연식</label>
				<div class="col-sm-3">
					<input name="carYear" type="text" class="form-control" placeholder="Ex) 24년식" >
				</div>
			</div>

			<div class="form-group  row">
				<label class="col-sm-2">차량 주행 거리</label>
				<div class="col-sm-3">
					<input name="carKm" type="text" class="form-control" placeholder="Ex) 12345km" >

				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2 ">차량 옵션</label>
				<div class="col-sm-5">
					<input name="carOption" type="text" class="form-control" placeholder="Ex) 블랙박스, 후방카메라 등">

				</div>
			</div>
			
			<div class = "form-group row">
				<label class = "col-sm-2">차량 사고 유/무</label>
				<div class = "col-sm-5">
					<input type = "radio" name = "carAccident" value = "Yes">
					유
					<input type = "radio" name = "carAccident" value = "No">
					무
				</div>
			</div>
			
			<div class = "form-group row">
				<label class = "col-sm-2">차량 이미지</label>
				<div class = "col-sm-5">
					<input type = "file" name = "carImage" class = "form-control">
				</div>
			</div>
			
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="location.href='editCar.jsp'" >
				</div>
			</div>
		</form>
	</div>



	<jsp:include page = "footer.jsp" />
</body>
</html>