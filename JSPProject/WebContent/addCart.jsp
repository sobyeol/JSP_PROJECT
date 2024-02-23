<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.*" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>

<%
	//carId를 파라미터값으로 받아옴
	String id = request.getParameter("carId");

	//id값이 없거으면 cars로 이동
	if(id == null || id.trim().equals("")){
		response.sendRedirect("cars.jsp");
		return;
	}
	
	//productRepository 객체에 dao라는 생성 repository에 인스턴스를 받아옴
	ProductRepository dao = ProductRepository.getInstance();
	
	
	Product product = dao.getProductById(id);
	
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	ArrayList<Product> goodsList = dao.getAllProducts();
	
	Product goods = new Product();
	
	for(int i = 0; i < goodsList.size(); i++){
		goods = goodsList.get(i);
		
		if(goods.getCarId().equals(id)){
			break;
		}
	}
	
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	
	if(list == null){
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0;
	
	Product goodsQnt = new Product();
	
	for(int i = 0; i < list.size(); i++){
		goodsQnt = list.get(i);
		
		if(goodsQnt.getCarId().equals(id)){
			cnt++;
			
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt == 0){
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("cars.jsp");
%>
