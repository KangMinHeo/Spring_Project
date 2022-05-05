package com.gam.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("req")
public class RequestDTO {
	private String r_no; // 발주번호
	private String co_name; // 협력업체명
	private String r_de_m_no; // 원자재 번호
	private String m_name; // 원자재 이름
	private String r_write_date; // 발주등록일자
	private String r_end_date; // 납기일자
	private String r_de_count; // 발주 수량
	private String e_name; // 담당자 이름
	private String e_no; // 담당자 사번
	private String co_address; // 납품 주소
	private String m_price; // 단가
	private String cc_code; // 협력업체 사업자번호
	private Date wday;
	private Date eday;
	
	
	
	public RequestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public RequestDTO(String r_no, String r_write_date, String r_end_date, String e_no, String cc_code) {
		super();
		this.r_no = r_no;
		this.r_write_date = r_write_date;
		this.r_end_date = r_end_date;
		this.e_no = e_no;
		this.cc_code = cc_code;
	}


	public RequestDTO(String r_no, String cc_code, Date wday, Date eday, String e_no ) {
		super();
		this.r_no = r_no;
		this.e_no = e_no;
		this.cc_code = cc_code;
		this.wday = wday;
		this.eday = eday;
	}


	public RequestDTO(String r_no, String r_de_m_no, String r_de_count, String m_price) {
		super();
		this.r_no = r_no;
		this.r_de_m_no = r_de_m_no;
		this.r_de_count = r_de_count;
		this.m_price = m_price;
	}


	public RequestDTO(String r_no, String co_name, String r_de_m_no, String m_name, String r_write_date,
			String r_end_date, String r_de_count) {
		super();
		this.r_no = r_no;
		this.co_name = co_name;
		this.r_de_m_no = r_de_m_no;
		this.m_name = m_name;
		this.r_write_date = r_write_date;
		this.r_end_date = r_end_date;
		this.r_de_count = r_de_count;
	}
	@Override
	public String toString() {
		return "RequestDTO [r_no=" + r_no + ", co_name=" + co_name + ", r_de_m_no=" + r_de_m_no + ", m_name=" + m_name
				+ ", r_write_date=" + r_write_date + ", r_end_date=" + r_end_date + ", r_de_count=" + r_de_count
				+ ", e_name=" + e_name + ", e_no=" + e_no + ", co_address=" + co_address + ", m_price=" + m_price
				+ ", cc_code=" + cc_code + "]";
	}
	
	public Date getWday() {
		return wday;
	}

	public void setWday(Date wday) {
		this.wday = wday;
	}


	public Date getEday() {
		return eday;
	}


	public void setEday(Date eday) {
		this.eday = eday;
	}


	public String getCc_code() {
		return cc_code;
	}


	public void setCc_code(String cc_code) {
		this.cc_code = cc_code;
	}


	public String getE_no() {
		return e_no;
	}


	public void setE_no(String e_no) {
		this.e_no = e_no;
	}


	public String getM_price() {
		return m_price;
	}

	public void setM_price(String m_price) {
		this.m_price = m_price;
	}


	public String getCo_address() {
		return co_address;
	}


	public void setCo_address(String co_address) {
		this.co_address = co_address;
	}


	public String getE_name() {
		return e_name;
	}


	public void setE_name(String e_name) {
		this.e_name = e_name;
	}


	public String getR_no() {
		return r_no;
	}
	public void setR_no(String r_no) {
		this.r_no = r_no;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public String getR_de_m_no() {
		return r_de_m_no;
	}
	public void setR_de_m_no(String r_de_m_no) {
		this.r_de_m_no = r_de_m_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getR_write_date() {
		return r_write_date;
	}
	public void setR_write_date(String r_write_date) {
		this.r_write_date = r_write_date;
	}
	public String getR_end_date() {
		return r_end_date;
	}
	public void setR_end_date(String r_end_date) {
		this.r_end_date = r_end_date;
	}
	public String getR_de_count() {
		return r_de_count;
	}
	public void setR_de_count(String r_de_count) {
		this.r_de_count = r_de_count;
	}
	
	
}
