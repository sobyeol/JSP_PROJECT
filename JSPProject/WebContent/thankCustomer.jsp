<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>

	<%
		String shipping_cartId = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_address = "";
		String shipping_phone = "";

		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			
			for(int i = 0; i < cookies.length; i++){
				
				Cookie thisCookie = cookies[i];
				
				String n = thisCookie.getName();
				
				if(n.equals("Shipping_cartId")){
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				}
				
				if(n.equals("Shipping_shippingDate")){
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				}
			}
		}
	%>
	
	<jsp:include page = "top.jsp" />
	
	<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>주문 완료</h2>
         
        </div>

      </div>
    </section>

	<div class = "container">
		<h2 class = "alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p> <strong>주문은 <% out.println(shipping_shippingDate); %>에 배송될 예정입니다!</strong>
		<p> <strong>주문번호 : </strong><% out.println(shipping_cartId); %>
	</div>

	<div class = "container">
		<p> <a href = "cars.jsp" class = "btn btn-secondary"> &laquo; 차량 목록</a>
	</div>

	<jsp:include page = "footer.jsp" />
</body>
</html>

<%
	session.invalidate();

	for(int i = 0; i < cookies.length; i++){
		
		Cookie thisCookie = cookies[i];
		
		String n = thisCookie.getName();
		
		if(n.equals("Shipping_cartId")){
			thisCookie.setMaxAge(0);
		}
		
		
		if(n.equals("Shipping_name")){
			thisCookie.setMaxAge(0);
		}
		
		if(n.equals("Shipping_shippingDate")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_country")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_zipCode")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_addressName")){
			thisCookie.setMaxAge(0);
		}
		
		response.addCookie(thisCookie);
	}
%>

