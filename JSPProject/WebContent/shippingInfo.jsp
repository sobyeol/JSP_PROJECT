<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<link rel = "stylesheet" href="./resources/css/bootstrap.min.css" />
<title>배송 정보</title>
</head>
<body>

	<jsp:include page = "top.jsp" />
	
	<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>배송 정보</h2>
         
        </div>

      </div>
    </section>
	
	<section id="portfolio-details" class="portfolio-details">
    	<div class="container">

        	<div class="row gy-4">

          		<div class="col-lg-8">
            		<div class="portfolio-details-slider swiper">
              			<div class="swiper-wrapper align-items-center">

			                <div class="swiper-slide">
			                	<jsp:include page = "cartInfo.jsp" />
			                </div>
			                
              			</div>
              			<div class="swiper-pagination"></div>
            		</div>
          </div>

          <div class="col-lg-4">
          
          <%@ include file = "dbconn.jsp" %>
				
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from member where id = ?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, sessionId);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
		  %>
          
          
          
            <div class="portfolio-info">
              <h3>배송 정보 입력</h3>
              
	              <form action = "processShippingInfo.jsp" method = "post">
		              <ul>
		              	<input type = "hidden" name = "cartId" value = "<%=request.getParameter("cartId") %>" />
		                <li><strong>받는사람 : </strong><input name = "name" type = "text" value ="<%=rs.getString("name") %>" /></li>
		                <li><strong>주소 : </strong><input name = "address" type = "text" value ="<%=rs.getString("address") %>" /></li>
		                <li><strong>전화번호 :</strong><input name = "phone" type = "text" value ="<%=rs.getString("phone") %>" /></li>
		                <li><strong>배송 일자 :</strong><input name = "shippingDate" type = "date" /></li>
		              </ul>
		              
		            
	           		
		        		<a href = "cart.jsp?cartId=<%=request.getParameter("cartId") %>" class = "btn btn-secondary" role = "button">장바구니</a>
						<input type = "submit" class = "btn btn-primary" value = "주문하기" />
	           		
					</form>	 
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

      </div>
    </section>
	
	<jsp:include page="footer.jsp" />
</body>
</html>