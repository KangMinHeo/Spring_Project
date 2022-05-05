package com.gam.dto;

import org.apache.ibatis.type.Alias;

@Alias("product")
public class ProductDTO {
	
	private String productNo;	//P_NO
	private String pName;	//P_NAME
	private double pSize;	// P_SIZE
	private int pPrice;		//P_PRICE
	private String pCount; // P_COUNT
	private String pDate; //P_DATE
	
	public ProductDTO(String productNo, String pName, double pSize, int pPrice) {
		this.productNo = productNo;
		this.pName = pName;
		this.pSize = pSize;
		this.pPrice = pPrice;
	}

	public ProductDTO(String productNo, String pName, double pSize, int pPrice, String pCount, String pDate) {
		super();
		this.productNo = productNo;
		this.pName = pName;
		this.pSize = pSize;
		this.pPrice = pPrice;
		this.pCount = pCount;
		this.pDate = pDate;
	}

	public ProductDTO() {	}
	
	public String getpCount() {
		return pCount;
	}

	public void setpCount(String pCount) {
		this.pCount = pCount;
	}

	public String getpDate() {
		return pDate;
	}

	public void setpDate(String pDate) {
		this.pDate = pDate;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public double getpSize() {
		return pSize;
	}

	public void setpSize(double pSize) {
		this.pSize = pSize;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	@Override
	public String toString() {
		return "ProductDTO [productNo=" + productNo + ", pName=" + pName + ", pSize=" + pSize + ", pPrice=" + pPrice
				+ ", pCount=" + pCount + ", pDate=" + pDate + "]";
	}
	
	
	
	
	

}
