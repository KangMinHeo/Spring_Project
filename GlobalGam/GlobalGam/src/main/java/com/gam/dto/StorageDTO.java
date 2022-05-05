package com.gam.dto;

import org.apache.ibatis.type.Alias;

@Alias("sto")
public class StorageDTO {
	private String st_no; // 창고 위치, 명
	private String st_name; // 재고 명
	private int st_number; // 재고 수량
	private String st_kind; // 원자재, 완제품 구분
	private String m_name; // 원자재 명
	private String m_size; // 원자재 규격
	private String m_count; // 원자재 단위
	private String m_date; // 원자재 유통기한
	private String p_name; // 완제품 명
	private String p_size; // 완제품 규격
	private String p_count; //완제품 단위
	private String p_date; //  완제품 유통기한
	private String co_name; // 협력업체 명

	public StorageDTO(String st_no, String st_name, int st_number, String st_kind, String p_name, String co_name) {
		super();
		this.st_no = st_no;
		this.st_name = st_name;
		this.st_number = st_number;
		this.st_kind = st_kind;
		this.p_name = p_name;
		this.co_name = co_name;
	}
	public StorageDTO() {	}
	
	public int getSt_number() {
		return st_number;
	}
	public void setSt_number(int st_number) {
		this.st_number = st_number;
	}
	public String getM_size() {
		return m_size;
	}
	public void setM_size(String m_size) {
		this.m_size = m_size;
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
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getP_count() {
		return p_count;
	}
	public void setP_count(String p_count) {
		this.p_count = p_count;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public String getSt_no() {
		return st_no;
	}
	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public int getst_number() {
		return st_number;
	}
	public void setst_number(int st_number) {
		this.st_number = st_number;
	}
	public String getSt_kind() {
		return st_kind;
	}
	public void setSt_kind(String st_kind) {
		this.st_kind = st_kind;
	}
	@Override
	public String toString() {
		return "StorageDTO [st_no=" + st_no + ", st_name=" + st_name + ", st_number=" + st_number + ", st_kind="
				+ st_kind + ", m_name=" + m_name + ", m_size=" + m_size + ", m_count=" + m_count + ", m_date=" + m_date
				+ ", p_name=" + p_name + ", p_size=" + p_size + ", p_count=" + p_count + ", p_date=" + p_date
				+ ", co_name=" + co_name + "]";
	}
	
	
}
