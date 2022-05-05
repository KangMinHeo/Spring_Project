package com.gam.dto;

import org.apache.ibatis.type.Alias;

@Alias("co_com")
public class CoCompanyDTO {
	private String co_no; // 협력업체 사업자 번호
	private String co_name; // 회사 이름
	private String co_ceo; // 사장 이름
	private String co_tel; // 회사 전화번호
	private String co_fex; // 회사 팩스번호
	private String co_address; // 회사 주소
	private String co_em; // 담당자명
	private String co_em_tel; // 담당자 번호
	private String co_email; // 담당자 이메일
	private String co_etc; // 기타 내용
	
	public CoCompanyDTO() {	}
	
	public CoCompanyDTO(String co_no, String co_name) {
		super();
		this.co_no = co_no;
		this.co_name = co_name;
	}

	public CoCompanyDTO(String co_no, String co_name, String co_ceo, String co_tel, String co_fex, String co_em_tel,
			String co_email) {
		super();
		this.co_no = co_no;
		this.co_name = co_name;
		this.co_ceo = co_ceo;
		this.co_tel = co_tel;
		this.co_fex = co_fex;
		this.co_em_tel = co_em_tel;
		this.co_email = co_email;
	}



	public CoCompanyDTO(String co_no, String co_name, String co_ceo, String co_tel, String co_fex, String co_address,
			String co_em, String co_em_tel, String co_email, String co_etc) {
		super();
		this.co_no = co_no;
		this.co_name = co_name;
		this.co_ceo = co_ceo;
		this.co_tel = co_tel;
		this.co_fex = co_fex;
		this.co_address = co_address;
		this.co_em = co_em;
		this.co_em_tel = co_em_tel;
		this.co_email = co_email;
		this.co_etc = co_etc;
	}

	public String getCo_no() {
		return co_no;
	}

	public void setCo_no(String co_no) {
		this.co_no = co_no;
	}

	public String getCo_name() {
		return co_name;
	}

	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}

	public String getCo_ceo() {
		return co_ceo;
	}

	public void setCo_ceo(String co_ceo) {
		this.co_ceo = co_ceo;
	}

	public String getCo_tel() {
		return co_tel;
	}

	public void setCo_tel(String co_tel) {
		this.co_tel = co_tel;
	}

	public String getCo_fex() {
		return co_fex;
	}

	public void setCo_fex(String co_fex) {
		this.co_fex = co_fex;
	}

	public String getco_address() {
		return co_address;
	}

	public void setco_address(String co_address) {
		this.co_address = co_address;
	}

	public String getCo_em() {
		return co_em;
	}

	public void setCo_em(String co_em) {
		this.co_em = co_em;
	}

	public String getCo_em_tel() {
		return co_em_tel;
	}

	public void setCo_em_tel(String co_em_tel) {
		this.co_em_tel = co_em_tel;
	}

	public String getCo_email() {
		return co_email;
	}

	public void setCo_email(String co_email) {
		this.co_email = co_email;
	}

	public String getCo_etc() {
		return co_etc;
	}

	public void setCo_etc(String co_etc) {
		this.co_etc = co_etc;
	}

	@Override
	public String toString() {
		return "CoCompanyDTO [co_no=" + co_no + ", co_name=" + co_name + ", co_ceo=" + co_ceo + ", co_tel=" + co_tel
				+ ", co_fex=" + co_fex + ", co_address=" + co_address + ", co_em=" + co_em + ", co_em_tel=" + co_em_tel
				+ ", co_email=" + co_email + ", co_etc=" + co_etc + "]";
	}
	
}
