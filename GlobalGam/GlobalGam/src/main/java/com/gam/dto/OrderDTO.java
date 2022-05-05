package com.gam.dto;

import org.apache.ibatis.type.Alias;

@Alias("order")
public class OrderDTO {
	
	private String orderNo;	//O_NO
	private String oderCuNo;	//O_CU_NO
	private String orderAddr;//O_SEND_ADDRESS
	private String orderRegDate;//O_WRITE_DATE
	private String orderEndDate; //O_END_DATE
	private String orderPno;	//O_DE_P_NO
	private int orderCount; //O_DE_COUNT
	
	public OrderDTO() {	}

	public OrderDTO(String orderNo, String oderCuNo, String orderAddr, String orderRegDate, String orderEndDate,
			String orderPno, int orderCount) {
		this.orderNo = orderNo;
		this.oderCuNo = oderCuNo;
		this.orderAddr = orderAddr;
		this.orderRegDate = orderRegDate;
		this.orderEndDate = orderEndDate;
		this.orderPno = orderPno;
		this.orderCount = orderCount;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOderCuNo() {
		return oderCuNo;
	}

	public void setOderCuNo(String oderCuNo) {
		this.oderCuNo = oderCuNo;
	}

	public String getOrderAddr() {
		return orderAddr;
	}

	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}

	public String getOrderRegDate() {
		return orderRegDate;
	}

	public void setOrderRegDate(String orderRegDate) {
		this.orderRegDate = orderRegDate;
	}

	public String getOrderEndDate() {
		return orderEndDate;
	}

	public void setOrderEndDate(String orderEndDate) {
		this.orderEndDate = orderEndDate;
	}

	public String getOrderPno() {
		return orderPno;
	}

	public void setOrderPno(String orderPno) {
		this.orderPno = orderPno;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	@Override
	public String toString() {
		return "OrderDTO [orderNo=" + orderNo + ", oderCuNo=" + oderCuNo + ", orderAddr=" + orderAddr
				+ ", orderRegDate=" + orderRegDate + ", orderEndDate=" + orderEndDate + ", orderPno=" + orderPno
				+ ", orderCount=" + orderCount + "]";
	}
	
	

}
