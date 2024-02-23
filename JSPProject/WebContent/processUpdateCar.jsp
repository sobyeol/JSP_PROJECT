<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "dbconn.jsp" %>

<%
	String filename = "";
	String realFolder = getServletContext().getRealPath("/") + "uploadCar";
	String encType = "utf-8";
	int maxSize = 5 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String carId = multi.getParameter("id");
	String carName = multi.getParameter("name");
	String carPrice = multi.getParameter("price");
	String carYear = multi.getParameter("year");
	String carKm = multi.getParameter("km");
	String carOption = multi.getParameter("option");
	String carAccident = multi.getParameter("accident");

	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from car where c_id = ?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, carId);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			
			sql = "UPDATE car SET c_id=?, c_name=?, c_price=?, c_year=?, c_km=?, c_option=?, c_accident=?, c_filename=? WHERE c_id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, carId);
			pstmt.setString(2, carName);
			pstmt.setString(3, carPrice);
			pstmt.setString(4, carYear);
			pstmt.setString(5, carKm);
			pstmt.setString(6, carOption);
			pstmt.setString(7, carAccident);
			pstmt.setString(8, fileName);
			pstmt.setString(9, carId);
			
			pstmt.executeUpdate();
		}else{
			sql = "UPDATE car SET c_id=?, c_name=?, c_price=?, c_year=?, c_km=?, c_option=?, c_accident=? WHERE c_id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, carId);
			pstmt.setString(2, carName);
			pstmt.setString(3, carPrice);
			pstmt.setString(4, carYear);
			pstmt.setString(5, carKm);
			pstmt.setString(6, carOption);
			pstmt.setString(7, carAccident);
			pstmt.setString(8, carId);
			
			pstmt.executeUpdate();
		}
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
	
	
	response.sendRedirect("editCar.jsp");
%>