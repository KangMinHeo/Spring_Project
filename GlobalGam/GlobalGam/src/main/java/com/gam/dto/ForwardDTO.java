package com.gam.dto;

import org.apache.ibatis.type.Alias;

@Alias("for")
public class ForwardDTO {
	private int f_no; // 출하번호
	private int f_o_no; // 수주번호
	private int f_count; // 출하수량
	private String f_date; // 출하날짜
	private String f_state; // 출하 상태
	private String o_end_date; // 납기일자
	private String cu_name; // 고객사 명
	private String o_de_count; // 수주 수량
	private String p_name; // 완제품명
	private String st_number; // 재고량
	private String cu_address; // 고객사 주소
	private String st_no; // 창고 위치
	private String p_no; // 완제품 번호
	
	public String getSt_no() {
		return st_no;
	}

	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public ForwardDTO(int f_no, int f_o_no, int f_count, String f_date, String f_state, String o_end_date,
			String cu_name, String o_de_count, String p_name, String st_number, String cu_address, String st_no,
			String p_no) {
		super();
		this.f_no = f_no;
		this.f_o_no = f_o_no;
		this.f_count = f_count;
		this.f_date = f_date;
		this.f_state = f_state;
		this.o_end_date = o_end_date;
		this.cu_name = cu_name;
		this.o_de_count = o_de_count;
		this.p_name = p_name;
		this.st_number = st_number;
		this.cu_address = cu_address;
		this.st_no = st_no;
		this.p_no = p_no;
	}

	public ForwardDTO() {	}

	public ForwardDTO(int f_no, int f_o_no, int f_count, String f_date, String f_state, String o_end_date,
			String cu_name, String o_de_count, String p_name, String st_number) {
		super();
		this.f_no = f_no;
		this.f_o_no = f_o_no;
		this.f_count = f_count;
		this.f_date = f_date;
		this.f_state = f_state;
		this.o_end_date = o_end_date;
		this.cu_name = cu_name;
		this.o_de_count = o_de_count;
		this.p_name = p_name;
		this.st_number = st_number;
	}

	public ForwardDTO(int f_no, int f_o_no, int f_count, String f_date, String f_state, String o_end_date,
			String cu_name, String o_de_count, String p_name, String st_number, String cu_address) {
		super();
		this.f_no = f_no;
		this.f_o_no = f_o_no;
		this.f_count = f_count;
		this.f_date = f_date;
		this.f_state = f_state;
		this.o_end_date = o_end_date;
		this.cu_name = cu_name;
		this.o_de_count = o_de_count;
		this.p_name = p_name;
		this.st_number = st_number;
		this.cu_address = cu_address;
	}

	public String getCu_address() {
		return cu_address;
	}

	public void setCu_address(String cu_address) {
		this.cu_address = cu_address;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public int getF_o_no() {
		return f_o_no;
	}

	public void setF_o_no(int f_o_no) {
		this.f_o_no = f_o_no;
	}

	public int getF_count() {
		return f_count;
	}

	public void setF_count(int f_count) {
		this.f_count = f_count;
	}

	public String getF_date() {
		return f_date;
	}

	public void setF_date(String f_date) {
		this.f_date = f_date;
	}

	public String getF_state() {
		return f_state;
	}

	public void setF_state(String f_state) {
		this.f_state = f_state;
	}

	public String getO_end_date() {
		return o_end_date;
	}

	public void setO_end_date(String o_end_date) {
		this.o_end_date = o_end_date;
	}

	public String getCu_name() {
		return cu_name;
	}

	public void setCu_name(String cu_name) {
		this.cu_name = cu_name;
	}

	public String getO_de_count() {
		return o_de_count;
	}

	public void setO_de_count(String o_de_count) {
		this.o_de_count = o_de_count;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getSt_number() {
		return st_number;
	}

	public void setSt_number(String st_number) {
		this.st_number = st_number;
	}

	@Override
	public String toString() {
		return "ForwardDTO [f_no=" + f_no + ", f_o_no=" + f_o_no + ", f_count=" + f_count + ", f_date=" + f_date
				+ ", f_state=" + f_state + ", o_end_date=" + o_end_date + ", cu_name=" + cu_name + ", o_de_count="
				+ o_de_count + ", p_name=" + p_name + ", st_number=" + st_number + ", cu_address=" + cu_address
				+ ", st_no=" + st_no + ", p_no=" + p_no + "]";
	}
	
	
}
