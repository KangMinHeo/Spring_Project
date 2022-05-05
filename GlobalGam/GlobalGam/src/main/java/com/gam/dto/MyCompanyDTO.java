package com.gam.dto;

import org.apache.ibatis.type.Alias;

@Alias("mc")
public class MyCompanyDTO {
	private String mc_no; // 사업자 번호
	private String mc_name; // 회사 명
	private String mc_ceo; // 대표 이름
	private String mc_tel; // 대표 전화
	private String mc_fax; // 대표 팩스
	private String mc_em; // 담당자
	private String mc_em_tel; // 담당자 번호
	private String mc_email; // 담당자 이메일
	private String mc_address; // 회사 주소
	private String mc_bank; // 회사 입금 통장 은행이름
	private String mc_bank_num; // 회사 계좌번호
	private String mc_bank_name; // 통장명의
	
	public MyCompanyDTO(String mc_no, String mc_name, String mc_ceo, String mc_tel, String mc_fax, String mc_em,
			String mc_em_tel, String mc_email, String mc_address, String mc_bank, String mc_bank_num,
			String mc_bank_name) {
		super();
		this.mc_no = mc_no;
		this.mc_name = mc_name;
		this.mc_ceo = mc_ceo;
		this.mc_tel = mc_tel;
		this.mc_fax = mc_fax;
		this.mc_em = mc_em;
		this.mc_em_tel = mc_em_tel;
		this.mc_email = mc_email;
		this.mc_address = mc_address;
		this.mc_bank = mc_bank;
		this.mc_bank_num = mc_bank_num;
		this.mc_bank_name = mc_bank_name;
	}

	public MyCompanyDTO() {}

	public String getMc_no() {
		return mc_no;
	}

	public void setMc_no(String mc_no) {
		this.mc_no = mc_no;
	}

	public String getMc_name() {
		return mc_name;
	}

	public void setMc_name(String mc_name) {
		this.mc_name = mc_name;
	}

	public String getMc_ceo() {
		return mc_ceo;
	}

	public void setMc_ceo(String mc_ceo) {
		this.mc_ceo = mc_ceo;
	}

	public String getMc_tel() {
		return mc_tel;
	}

	public void setMc_tel(String mc_tel) {
		this.mc_tel = mc_tel;
	}

	public String getMc_fax() {
		return mc_fax;
	}

	public void setMc_fax(String mc_fax) {
		this.mc_fax = mc_fax;
	}

	public String getMc_em() {
		return mc_em;
	}

	public void setMc_em(String mc_em) {
		this.mc_em = mc_em;
	}

	public String getMc_em_tel() {
		return mc_em_tel;
	}

	public void setMc_em_tel(String mc_em_tel) {
		this.mc_em_tel = mc_em_tel;
	}

	public String getMc_email() {
		return mc_email;
	}

	public void setMc_email(String mc_email) {
		this.mc_email = mc_email;
	}

	public String getMc_address() {
		return mc_address;
	}

	public void setMc_address(String mc_address) {
		this.mc_address = mc_address;
	}

	public String getMc_bank() {
		return mc_bank;
	}

	public void setMc_bank(String mc_bank) {
		this.mc_bank = mc_bank;
	}

	public String getMc_bank_num() {
		return mc_bank_num;
	}

	public void setMc_bank_num(String mc_bank_num) {
		this.mc_bank_num = mc_bank_num;
	}

	public String getMc_bank_name() {
		return mc_bank_name;
	}

	public void setMc_bank_name(String mc_bank_name) {
		this.mc_bank_name = mc_bank_name;
	}

	@Override
	public String toString() {
		return "MyCompanyDTO [mc_no=" + mc_no + ", mc_name=" + mc_name + ", mc_ceo=" + mc_ceo + ", mc_tel=" + mc_tel
				+ ", mc_fax=" + mc_fax + ", mc_em=" + mc_em + ", mc_em_tel=" + mc_em_tel + ", mc_email=" + mc_email
				+ ", mc_address=" + mc_address + ", mc_bank=" + mc_bank + ", mc_bank_num=" + mc_bank_num
				+ ", mc_bank_name=" + mc_bank_name + "]";
	}
	
	
}
