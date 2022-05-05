package com.gam.dto;

import org.apache.ibatis.type.Alias;

@Alias("met")
public class MeterialDTO {
	private String m_no; // 원자재 번호
	private String m_cc_code; //협력업체 번호
	private String m_name; // 원자재 이름
	private String m_size; // 원자재 규격
	private String m_price; // 원자재 가격
	private String m_country; // 원산지
	private String m_count; // 단위
	private String m_date; // 유통기간
	private String co_name; // 협력업체 명 
	
	public MeterialDTO() {	}

	public MeterialDTO(String m_no, String m_cc_code, String m_name, String m_size, String m_price, String m_country,
			String m_count, String m_date) {
		super();
		this.m_no = m_no;
		this.m_cc_code = m_cc_code;
		this.m_name = m_name;
		this.m_size = m_size;
		this.m_price = m_price;
		this.m_country = m_country;
		this.m_count = m_count;
		this.m_date = m_date;
	}

	public MeterialDTO(String m_no, String m_cc_code, String m_name, String m_size, String m_price, String m_country,
			String m_count, String m_date, String co_name) {
		super();
		this.m_no = m_no;
		this.m_cc_code = m_cc_code;
		this.m_name = m_name;
		this.m_size = m_size;
		this.m_price = m_price;
		this.m_country = m_country;
		this.m_count = m_count;
		this.m_date = m_date;
		this.co_name = co_name;
	}

	public String getM_no() {
		return m_no;
	}

	public void setM_no(String m_no) {
		this.m_no = m_no;
	}

	public String getM_cc_code() {
		return m_cc_code;
	}

	public void setM_cc_code(String m_cc_code) {
		this.m_cc_code = m_cc_code;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_size() {
		return m_size;
	}

	public void setM_size(String m_size) {
		this.m_size = m_size;
	}

	public String getM_price() {
		return m_price;
	}

	public void setM_price(String m_price) {
		this.m_price = m_price;
	}

	public String getM_country() {
		return m_country;
	}

	public void setM_country(String m_country) {
		this.m_country = m_country;
	}

	public String getM_count() {
		return m_count;
	}

	public void setM_count(String m_count) {
		this.m_count = m_count;
	}

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	public String getCo_name() {
		return co_name;
	}

	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}

	@Override
	public String toString() {
		return "MeterialDTO [m_no=" + m_no + ", m_cc_code=" + m_cc_code + ", m_name=" + m_name + ", m_size=" + m_size
				+ ", m_price=" + m_price + ", m_country=" + m_country + ", m_count=" + m_count + ", m_date=" + m_date
				+ ", co_name=" + co_name + "]";
	}
	
	
}
