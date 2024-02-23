<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

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
<link href="assets/css/style.css" rel="stylesheet">
<link rel = "stylesheet"
   href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   
   <script>
		function deleteBtn(){
			alert("삭제되었습니다.");
		}
		
		function submit1(){
			
			document.form1.submit();
			
		}
		
	</script>

<style>

	.search{
		
		position: relative;
		width: 100%;
		
	}
	
	input{
		width:100%;
		border: 1px solid #bbb;
		border-radius: 8px;
		padding: 10px 12px;
		font-size: 14px;
	}
	
	img{
		position: absolute;
		width: 17px;
		top: 10px;
		right: 12px;
		margin: 0;
	}
	


</style>


<title>차량 관리</title>
</head>
<body>

	<jsp:include page = "top.jsp"/>

	<section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>차량관리</h2>
        </div>
      </div>
    </section>
    
    
    <section id="hero" class="d-flex align-items-center">
    
    	
    
    
    	<div class="container position-relative" data-aos="fade-up" data-aos-delay="100">
    	
    	
<!--     	검색 창 구현!! -->
	    	<div class = "search">
	    	
	    		<form name="form1" class="search-box" action="searchCar.jsp" method="post">
	    			
	    			<select name = "category1">
	    				<option>항목</option>
	    				<option value="c_id">고유번호</option>
	    				<option value="c_name">차종</option>
	    				<option value="c_year">연식</option>

	    			</select>
	    			<div>
	    			<input type = "text" name = "category2" placeholder="검색하기">
	    				    			
	    			<img src = "https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" onclick="submit1()" style="cursor:pointer;">
					</div>
	    		</form>
	    		
	
	    	</div>
<!--     	검색 창 구현!! -->
	
		
		    <div class="row icon-boxes">
		    
		    		<%@ include file = "dbconn.jsp" %>
				
					<%
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						String sql = "select * from car";
						pstmt = conn.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						
						while(rs.next()){
					%>
		    
			    <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="400">
			  

			  		
			       <div class="icon-box">
			       	  
			          <div class="icon"><i class="ri-command-line"></i></div>
			          <div>
			          	<img  src = "./uploadCar/<%=rs.getString("c_filename") %>" style = "width : 90%; height: 20%" >
			          </div>
			          &nbsp;&nbsp;
			          <div class="icon"><i class="ri-command-line"></i></div>
			          <h4 class="title"><a href="updateCar.jsp?carId=<%=rs.getString("c_id") %>">차량 정보</a></h4>
			          
			          <p class="description">고유 번호 : <%=rs.getString("c_id") %></p>
			          <p class="description">차종 : <%=rs.getString("c_name") %> </p>
			          <p class="description">가격 : <%=rs.getString("c_price") %> 원</p>
			          
			          <p class="description">연식 : <%=rs.getString("c_year") %> 년식</p>
			          <p class="description">키로수 : <%=rs.getString("c_km") %> KM</p>
			          <p class="description">옵션 : <%=rs.getString("c_option") %></p>
			          <p class="description">사고유무 : <%=rs.getString("c_accident") %></p>	
			          
			          
			          
			          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			          <h4 class="title"><a href="editDeleteCar.jsp?carId=<%=rs.getString("c_id") %>" onclick=deleteBtn()>차량 삭제</a></h4>
			        </div>

			    </div>
			    
			      <%
						}
					%>
					<% 
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
	  
		    </div>
	    </div>
    </section>
    

	  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	  <script src="assets/vendor/aos/aos.js"></script>
	  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	  <script src="assets/vendor/php-email-form/validate.js"></script>

	  <!-- Template Main JS File -->
	  <script src="assets/js/main.js"></script>
	
	
	<jsp:include page = "footer.jsp"/>
</body>
</html>