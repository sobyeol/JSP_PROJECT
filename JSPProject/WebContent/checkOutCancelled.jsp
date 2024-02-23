<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<link rel="stylesheet" href = "./resources/css/bootstrap.min.css" />
<title>주문 취소</title>
</head>
<body>
	<jsp:include page = "top.jsp" />
	
	<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>차량 장바구니</h2>
         
        </div>

      </div>
    </section>
	
	<div class = "container">
		<h2 class = "alert alert-danger">주문이 취소되었습니다.</h2>
	</div>
	
	
	<div class = "container">
		<p> <a href = "cars.jsp" class = "btn btn-secondary"> &laquo; 차량 목록</a>
	</div>

</body>
</html>