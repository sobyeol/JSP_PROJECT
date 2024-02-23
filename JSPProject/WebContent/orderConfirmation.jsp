<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>
    
<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();
	
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
			
			if(n.equals("Shipping_name")){
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			
			if(n.equals("Shipping_shippingDate")){
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			
			if(n.equals("Shipping_address")){
				shipping_address = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			
			if(n.equals("Shipping_phone")){
				shipping_phone= URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			

		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css" />

<title>주문 정보</title>
</head>
<body>

	<jsp:include page = "top.jsp" />
	
	<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>주문 정보</h2>
         
        </div>

      </div>
    </section>
	
	<div class = "container col-8 alert alert-info">
		<div class = "text-center">
			<h1>영수증</h1>
		</div>
		
		<div class = "row justify-content-between">
			<div class = "col-4" align = "left">
			
				<strong>배송 주소</strong> 
				<br> 성명 : <% out.println(shipping_name); %>
				<br> 주소 : <% out.println(shipping_address); %>
				<br> 전화번호 : <% out.println(shipping_phone); %> 
			</div>
			
			<div class = "col-4" align = "right">
				<p> <em>배송일 : <% out.println(shipping_shippingDate); %></em>
			</div>	
		</div> 
		
		<div>
			<table class = "table table-hover">
			<tr>
				<th class = "text-center">차량 이름</th>
				<th class = "text-center">수량</th>
				<th class = "text-center">가격</th>
				<th class = "text-center">소계</th>
			</tr>
			
			<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				
				if(cartList == null){
					cartList = new ArrayList<Product>();
				}
				
				for(int i = 0; i < cartList.size(); i++){
					Product product = cartList.get(i);
					int total = Integer.parseInt(product.getCarPrice()) * product.getQuantity();
					sum = sum + total;
				
			%>
			
			<tr>
				<td class = "text-center"><em><%=product.getCarName() %></em></td>
				<td class = "text-center"><%=product.getQuantity() %></td>
				<td class = "text-center"><%=product.getCarPrice() %>원</td>
				<td class = "text-center"><%=total %>원</td>
			</tr>
			
			<%
				}
			%>
			
			<tr>
				<td></td>
				<td></td>
				<td class = "text-right"><strong>총액 : </strong></td>
				<td class = "text-center text-danger"><strong><%=sum %></strong></td>
			</tr>
			</table>
			
			<a href = "shippingInfo.jsp?cartId=<%=shipping_cartId %>" class = "btn btn-secondary" role = "button">이전</a>
			<a href = "thankCustomer.jsp" class = "btn btn-success" role = "button">주문완료</a>
			<a href = "checkOutCancelled.jsp" class = "btn btn-secondary" role = "button">취소</a>
			
			
		</div>
	</div>
	
	<jsp:include page = "footer.jsp" />
</body>
</html>