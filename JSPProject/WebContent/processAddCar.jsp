<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = getServletContext().getRealPath("/") + "uploadCar";
	System.out.println(realFolder);
	
	int maxSize = 5 * 512 * 512;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String c_id = multi.getParameter("carId");
	String c_name = multi.getParameter("carName");
	String c_price = multi.getParameter("carPrice");
	String c_year = multi.getParameter("carYear");
	String c_km = multi.getParameter("carKm");
	String c_option = multi.getParameter("carOption");
	String c_accident = multi.getParameter("carAccident");
		
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into car values(?,?,?,?,?,?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, c_id);
	pstmt.setString(2, c_name);
	pstmt.setString(3, c_price);
	pstmt.setString(4, c_year);
	pstmt.setString(5, c_km);
	pstmt.setString(6, c_option);
	pstmt.setString(7, c_accident);
	pstmt.setString(8, fileName);
	
	pstmt.executeUpdate();
	
	if(pstmt != null){
		pstmt.close();
	}
	
	if(conn != null){
		conn.close();
	}
	
	response.sendRedirect("editCar.jsp");
	
%>