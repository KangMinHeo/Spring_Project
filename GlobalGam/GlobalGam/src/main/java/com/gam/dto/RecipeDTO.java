package com.gam.dto;

import org.apache.ibatis.type.Alias;

@Alias("rec")
public class RecipeDTO {
	private String re_no; // 레시피코드
	private String re_pro_1; // 공정1
	private String re_pro_2; // 공정2
	private String re_pro_3; // 공정3
	private String re_pro_4; // 공정4
	private String re_p_no; // 완제품번호
	private String p_name; // 완제품 명
	private String re_m_number; // 투입배합수
	private String re_m_no; // 원자재 번호
	private String re_m_no2; // 원자재 번호2
	private String m_name; // 원자재 명
	private String pro_name; // 공정명

	
	public RecipeDTO() {	}

	public RecipeDTO(String re_no, String re_pro_1, String re_pro_2, String re_pro_3, String re_pro_4, String re_p_no,
			String re_m_number, String re_m_no, String re_m_no2) {
		super();
		this.re_no = re_no;
		this.re_pro_1 = re_pro_1;
		this.re_pro_2 = re_pro_2;
		this.re_pro_3 = re_pro_3;
		this.re_pro_4 = re_pro_4;
		this.re_p_no = re_p_no;
		this.re_m_number = re_m_number;
		this.re_m_no = re_m_no;
		this.re_m_no2 = re_m_no2;
	}


	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
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

	public String getp_name() {
		return p_name;
	}

	public void setp_name(String p_name) {
		this.p_name = p_name;
	}

	public String getRe_no() {
		return re_no;
	}

	public void setRe_no(String re_no) {
		this.re_no = re_no;
	}

	public String getRe_pro_1() {
		return re_pro_1;
	}

	public void setRe_pro_1(String re_pro_1) {
		this.re_pro_1 = re_pro_1;
	}

	public String getRe_pro_2() {
		return re_pro_2;
	}

	public void setRe_pro_2(String re_pro_2) {
		this.re_pro_2 = re_pro_2;
	}

	public String getRe_pro_3() {
		return re_pro_3;
	}

	public void setRe_pro_3(String re_pro_3) {
		this.re_pro_3 = re_pro_3;
	}

	public String getRe_pro_4() {
		return re_pro_4;
	}

	public void setRe_pro_4(String re_pro_4) {
		this.re_pro_4 = re_pro_4;
	}

	public String getRe_p_no() {
		return re_p_no;
	}

	public void setRe_p_no(String re_p_no) {
		this.re_p_no = re_p_no;
	}

	public String getRe_m_number() {
		return re_m_number;
	}

	public void setRe_m_number(String re_m_number) {
		this.re_m_number = re_m_number;
	}

	public String getRe_m_no() {
		return re_m_no;
	}

	public void setRe_m_no(String re_m_no) {
		this.re_m_no = re_m_no;
	}

	public String getRe_m_no2() {
		return re_m_no2;
	}

	public void setRe_m_no2(String re_m_no2) {
		this.re_m_no2 = re_m_no2;
	}

	@Override
	public String toString() {
		return "RecipeDTO [re_no=" + re_no + ", re_pro_1=" + re_pro_1 + ", re_pro_2=" + re_pro_2 + ", re_pro_3="
				+ re_pro_3 + ", re_pro_4=" + re_pro_4 + ", re_p_no=" + re_p_no + ", p_name=" + p_name + ", re_m_number="
				+ re_m_number + ", re_m_no=" + re_m_no + ", re_m_no2=" + re_m_no2 + ", m_name=" + m_name + ", pro_name="
				+ pro_name + "]";
	}
	
}
