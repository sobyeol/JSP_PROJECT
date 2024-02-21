<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
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
<title>로그인</title>
</head>
<body>

	<jsp:include page="top.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">회원 로그인</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="processLoginMember.jsp" method="post">

				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label> <input
						type="text" class="form-control" placeholder="ID" name='id'
						required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label> <input
						type="password" class="form-control" placeholder="Password"
						name='password' required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>

			</form>
		</div>
	</div>
	
	

	<jsp:include page="footer.jsp"/>
</body>
</html>