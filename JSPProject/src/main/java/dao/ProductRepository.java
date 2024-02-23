package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import dto.Product;
import database.DBConnection;

public class ProductRepository{
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from car";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				

				Product car  = new Product();
				
				car.setCarId(rs.getString("c_id"));
				car.setCarName(rs.getString("c_name"));
				car.setCarPrice(rs.getString("c_price"));
				car.setCarYear(rs.getString("c_year"));
				car.setCarKm(rs.getString("c_km"));
				car.setCarOption(rs.getString("c_option"));
				car.setCarAccident(rs.getString("c_accident"));
		
				listOfProducts.add(car);
			}
		}catch(Exception ex) {
			System.out.println("getListCount() 에러 : " + ex);
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch(Exception ex){
				throw new RuntimeException(ex.getMessage());
			}
		}
		
	
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			
			if(product != null && product.getCarId() != null && product.getCarId().equals(productId)) {
				productById = product;
				break;
			}
		}
		
		return productById;
	}
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
}