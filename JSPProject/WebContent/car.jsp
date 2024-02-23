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

<title>차량 상세 정보</title>

<script type = "text/javascript">

	function addToCart(){
			
		if(confirm("해당 차량이 장바구니에 추가되었습니다.")){
			
			document.addForm.submit();
		}
	
	}

</script>

</head>
<body>

	<jsp:include page = "top.jsp" />
	
	<main id="main">
	<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>차량 상세 정보</h2>
         
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
              <h3>차량 정보</h3>
              
              
	              <ul>
	                <li><strong>차량 고유 번호 :</strong><%=rs.getString("c_id") %></li>
	                <li><strong>차종 :</strong><%=rs.getString("c_name") %></li>
	                <li><strong>가격 :</strong><%=rs.getString("c_price") %></li>
	                <li><strong>연식 :</strong><%=rs.getString("c_year") %></li>
	                <li><strong>주행거리 :</strong><%=rs.getString("c_km") %></li>
	                <li><strong>옵션 :</strong><%=rs.getString("c_option") %></li>
	                <li><strong>사고유무 :  </strong><%=rs.getString("c_accident") %></li>
	              </ul>
	              
	            
           		<form name = "addForm" action = "addCart.jsp?carId=<%=rs.getString("c_id") %>" method = "post">
           			<input type = "submit" class = "btn btn-primary" value = "구매하기" onclick = "addToCart()">
           			<input type="reset" class="btn btn-primary " value="목록으로 돌아가기 " onclick="location.href='cars.jsp'" >
           		</form>
					 
            </div>
            
            <div class="portfolio-description">
              <h2>차량 제원 확인</h2>
              <p>
              
                <a href="https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&mra=bjg1&pkid=128&os=32281003&qvt=0&query=2024%20<%=rs.getString("c_name")%> %20%EC%A0%9C%EC%9B%90">
                
           		<h6>이곳을 눌러 차량의 제원을 확인하세요!!</h6>
                </a>
              </p>
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