<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
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

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<title>차량 수정</title>
</head>
<body>

	<jsp:include page = "top.jsp" />
	
	<main id="main">
	<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>차량 수정</h2>
         
        </div>

      </div>
    </section>
	
	<%@ include file = "dbconn.jsp" %>
	
	<%
		String cId = request.getParameter("carId");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from car where c_id = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,cId);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
	%>
	
	<section id="portfolio-details" class="portfolio-details">
    	<div class="container">

        	<div class="row gy-4">

          		<div class="col-lg-8">
            		<div class="portfolio-details-slider swiper">
              			<div class="swiper-wrapper align-items-center">

                			<div class="swiper-slide">
                  				<img src="./uploadCar/<%=rs.getString("c_filename") %>" alt="">
                			</div>

			                <div class="swiper-slide">
			                	<img src="assets/img/portfolio/portfolio-2.jpg" alt="">
			                </div>

			                <div class="swiper-slide">
			                	<img src="assets/img/portfolio/portfolio-3.jpg" alt="">
			                </div>

              			</div>
              			<div class="swiper-pagination"></div>
            		</div>
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>변경 정보 입력</h3>
              
              <form name="updateCarForm" action="processUpdateCar.jsp" method="post" enctype = "multipart/form-data">
              
	              <ul>
	                <li><strong>차량 고유 번호</strong><input type = "text" id = "id" name = "id" class = "form-control" value = '<%=rs.getString("c_id") %>'></li>
	                <li><strong>차종</strong><input type = "text" id = "name" name = "name" class = "form-control" value = '<%=rs.getString("c_name") %>'></li>
	                <li><strong>가격</strong><input type = "text" id = "price" name = "price" class = "form-control" value = '<%=rs.getString("c_price") %>'></li>
	                <li><strong>연식</strong><input type = "text" id = "year" name = "year" class = "form-control" value = '<%=rs.getString("c_year") %>'></li>
	                <li><strong>주행거리</strong><input type = "text" id = "km" name = "km" class = "form-control" value = '<%=rs.getString("c_km") %>'></a></li>
	                <li><strong>옵션</strong><input type = "text" id = "option" name = "option" class = "form-control" value = '<%=rs.getString("c_option") %>'></li>
	                <li><strong>사고유무</strong><input type = "radio" name = "accident" value = "Yes" >유<input type = "radio" name = "accident" value = "No" >무</li>
	                <li><strong>차량 이미지</strong><input type = "file" name = "image" class = "form-control"></li>

	              </ul>
	              
	              <input type = "submit" class = "btn btn-primary" value = "수정">
	              <input type="reset" class="btn btn-primary " value="취소 " onclick="location.href='editCar.jsp'" >
	          </form>
            </div>
          </div>

        </div>

      </div>
    </section>
	
	
	<%
		}
		
		if(rs != null){
			rs.close();
		}
		if(pstmt != null){
			pstmt.close();
		}
		if(conn != null){
			conn.close();
		}
	%>
	</main>
	<jsp:include page="footer.jsp" />
</body>
</html>