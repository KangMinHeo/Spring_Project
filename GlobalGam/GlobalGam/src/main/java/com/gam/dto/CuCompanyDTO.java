package com.gam.dto;

public class CuCompanyDTO {
	private String cuNo; //CU_NO
	private String cuName;	//CU_NAME
	private String cuCeo; //CU_CEO
	private String cuTel;	//CU_TEL
	private String cuFax;	//CU_FEX
	private String cuAddr;	//CU_ADDRESS
	private String cuEmp;	//CU_EM
	private String cuEmpTel;	//CU_EM_TEL
	private String cuEmail;	//CU_EMAIL
	private String cuEtc;	//CU_ETC
	
	public CuCompanyDTO() {	}

	public CuCompanyDTO(String cuNo, String cuName, String cuCeo, String cuTel, String cuFax, String cuAddr,
			String cuEmp, String cuEmpTel, String cuEmail, String cuEtc) {
		this.cuNo = cuNo;
		this.cuName = cuName;
		this.cuCeo = cuCeo;
		this.cuTel = cuTel;
		this.cuFax = cuFax;
		this.cuAddr = cuAddr;
		this.cuEmp = cuEmp;
		this.cuEmpTel = cuEmpTel;
		this.cuEmail = cuEmail;
		this.cuEtc = cuEtc;
	}

	public String getCuNo() {
		return cuNo;
	}

	public void setCuNo(String cuNo) {
		this.cuNo = cuNo;
	}

	public String getCuName() {
		return cuName;
	}

	public void setCuName(String cuName) {
		this.cuName = cuName;
	}

	public String getCuCeo() {
		return cuCeo;
	}

	public void setCuCeo(String cuCeo) {
		this.cuCeo = cuCeo;
	}

	public String getCuTel() {
		return cuTel;
	}

	public void setCuTel(String cuTel) {
		this.cuTel = cuTel;
	}

	public String getCuFax() {
		return cuFax;
	}

	public void setCuFax(String cuFax) {
		this.cuFax = cuFax;
	}

	public String getCuAddr() {
		return cuAddr;
	}

	public void setCuAddr(String cuAddr) {
		this.cuAddr = cuAddr;
	}

	public String getCuEmp() {
		return cuEmp;
	}

	public void setCuEmp(String cuEmp) {
		this.cuEmp = cuEmp;
	}

	public String getCuEmpTel() {
		return cuEmpTel;
	}

	public void setCuEmpTel(String cuEmpTel) {
		this.cuEmpTel = cuEmpTel;
	}

	public String getCuEmail() {
		return cuEmail;
	}

	public void setCuEmail(String cuEmail) {
		this.cuEmail = cuEmail;
	}

	public String getCuEtc() {
		return cuEtc;
	}

	public void setCuEtc(String cuEtc) {
		this.cuEtc = cuEtc;
	}

	@Override
	public String toString() {
		return "CuCompanyDTO [cuNo=" + cuNo + ", cuName=" + cuName + ", cuCeo=" + cuCeo + ", cuTel=" + cuTel
				+ ", cuFax=" + cuFax + ", cuAddr=" + cuAddr + ", cuEmp=" + cuEmp + ", cuEmpTel=" + cuEmpTel
				+ ", cuEmail=" + cuEmail + ", cuEtc=" + cuEtc + "]";
	}
	
	
	
}
