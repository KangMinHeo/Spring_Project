package com.gam.vo;

public class OrderListViewVO {
	
	private String orderNo;
	private String cuName;
	private String regDate;
	private String endDate;
	private String count;
	
	public OrderListViewVO() {	}

	public OrderListViewVO(String orderNo, String cuName, String regDate, String endDate, String count) {
		this.orderNo = orderNo;
		this.cuName = cuName;
		this.regDate = regDate;
		this.endDate = endDate;
		this.count = count;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getCuName() {
		return cuName;
	}

	public void setCuName(String cuName) {
		this.cuName = cuName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "OrderListViewVO [orderNo=" + orderNo + ", cuName=" + cuName + ", regDate=" + regDate + ", endDate="
				+ endDate + ", count=" + count + "]";
	}
	
	
	
	
	

}
