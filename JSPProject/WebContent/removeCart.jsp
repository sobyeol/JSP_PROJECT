<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.util.*" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>


<%
	String id = request.getParameter("carId");

	if(id == null || id.trim().equals("")){
		response.sendRedirect("cars.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
	
	Product goodsQnt = new Product();
	
	for(int i = 0; i < cartList.size(); i++){
		goodsQnt = cartList.get(i);
		
		if(goodsQnt.getCarId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>