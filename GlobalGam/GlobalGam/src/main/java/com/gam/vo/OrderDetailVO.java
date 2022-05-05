package com.gam.vo;

public class OrderDetailVO {
	
	private String proNo;
	private String proName;
	private double pSize;
	private int orderQuantity;
	private int proPrice;
	private int proStock;
	
	public OrderDetailVO() {	}

	public OrderDetailVO(String proNo, String proName, double pSize, int orderQuantity, int proPrice, int proStock) {
		this.proNo = proNo;
		this.proName = proName;
		this.pSize = pSize;
		this.orderQuantity = orderQuantity;
		this.proPrice = proPrice;
		this.proStock = proStock;
	}

	public String getProNo() {
		return proNo;
	}

	public void setProNo(String proNo) {
		this.proNo = proNo;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public double getpSize() {
		return pSize;
	}

	public void setpSize(double pSize) {
		this.pSize = pSize;
	}

	public int getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public int getProStock() {
		return proStock;
	}

	public void setProStock(int proStock) {
		this.proStock = proStock;
	}

	@Override
	public String toString() {
		return "OrderDetailVO [proNo=" + proNo + ", proName=" + proName + ", pSize=" + pSize + ", orderQuantity="
				+ orderQuantity + ", proPrice=" + proPrice + ", proStock=" + proStock + "]";
	}
	
	
	
	

}
