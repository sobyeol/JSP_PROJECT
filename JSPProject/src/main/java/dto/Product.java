package dto;

import java.io.Serializable;

public class Product implements Serializable{
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String carId;
	private String carName;
	private String carPrice;
	private String carYear;
	private String carKm;
	private String carOption;
	private String carAccident;
	private String filename;
	private int quantity; // 장바구니에 담은 개수
	

	public Product() {
		super();
	}
	
	public Product(String productId, String pname, String unitPrice) {
		this.carId = productId;
		this.carName = pname;
		this.carPrice = unitPrice;
	}
	
	
	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getCarPrice() {
		return carPrice;
	}

	public void setCarPrice(String carPrice) {
		this.carPrice = carPrice;
	}

	public String getCarYear() {
		return carYear;
	}

	public void setCarYear(String carYear) {
		this.carYear = carYear;
	}

	public String getCarKm() {
		return carKm;
	}

	public void setCarKm(String carKm) {
		this.carKm = carKm;
	}

	public String getCarOption() {
		return carOption;
	}

	public void setCarOption(String carOption) {
		this.carOption = carOption;
	}

	public String getCarAccident() {
		return carAccident;
	}

	public void setCarAccident(String carAccident) {
		this.carAccident = carAccident;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
}
