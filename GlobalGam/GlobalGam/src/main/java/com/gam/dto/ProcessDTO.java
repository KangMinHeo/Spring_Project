package com.gam.dto;

import org.apache.ibatis.type.Alias;

@Alias("pro")
public class ProcessDTO {

	private String pro_no; // 공정번호
	private String pro_name; // 공정명
	private String pro_detail; // 공정 설명
	
	public ProcessDTO() {	}

	public ProcessDTO(String pro_no, String pro_name, String pro_detail) {
		super();
		this.pro_no = pro_no;
		this.pro_name = pro_name;
		this.pro_detail = pro_detail;
	}

	public String getPro_no() {
		return pro_no;
	}

	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_detail() {
		return pro_detail;
	}

	public void setPro_detail(String pro_detail) {
		this.pro_detail = pro_detail;
	}

	@Override
	public String toString() {
		return "ProcessDTO [pro_no=" + pro_no + ", pro_name=" + pro_name + ", pro_detail=" + pro_detail + "]";
	}
	
}
