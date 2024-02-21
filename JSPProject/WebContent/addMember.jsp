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

<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>

<title>회원 가입</title>
</head>
<body>

	<jsp:include page = "top.jsp" />

	<section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h1>회원 가입</h1>
        </div>
           
      </div>
    </section>

	

	<div class="container">
		<form name="newMember" class="form-horizontal"  action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="password" class="form-control" placeholder="password" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="password" class="form-control" placeholder="password confirm" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" >
				</div>
			</div>

			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" >

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address">

				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>
	</div>



	<jsp:include page = "footer.jsp" />
</body>
</html>