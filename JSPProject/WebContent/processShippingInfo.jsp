<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLEncoder" %>


<%
	request.setCharacterEncoding("UTF-8");

	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
	Cookie address = new Cookie("Shipping_address", URLEncoder.encode(request.getParameter("address"), "utf-8"));
	Cookie phone = new Cookie("Shipping_phone", URLEncoder.encode(request.getParameter("phone"), "utf-8"));

	cartId.setMaxAge(24 * 60 * 60);
	name.setMaxAge(24 * 60 * 60);
	shippingDate.setMaxAge(24 * 60 * 60);
	address.setMaxAge(24 * 60 * 60);
	phone.setMaxAge(24 * 60 * 60);


	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(address);
	response.addCookie(phone);

	response.sendRedirect("orderConfirmation.jsp");
%>