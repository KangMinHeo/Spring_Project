package com.gam.dto;

import org.apache.ibatis.type.Alias;

@Alias("emp")
public class EmployeeDTO {
	private int eNo;
	private String eName;
	private String ePw;
	private String eLevel;
	private String eLine;
	private String eProNo;
	
	public EmployeeDTO() {	}
	
	
	public EmployeeDTO(int eNo, String ePw) {
		this.eNo = eNo;
		this.ePw = ePw;
	}


	public EmployeeDTO(int eNo, String eName, String ePw, String eLevel, String eLine, String eProNo) {
		this.eNo = eNo;
		this.eName = eName;
		this.ePw = ePw;
		this.eLevel = eLevel;
		this.eLine = eLine;
		this.eProNo = eProNo;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getePw() {
		return ePw;
	}

	public void setePw(String ePw) {
		this.ePw = ePw;
	}

	public String geteLevel() {
		return eLevel;
	}

	public void seteLevel(String eLevel) {
		this.eLevel = eLevel;
	}

	public String geteLine() {
		return eLine;
	}

	public void seteLine(String eLine) {
		this.eLine = eLine;
	}

	public String geteProNo() {
		return eProNo;
	}

	public void seteProNo(String eProNo) {
		this.eProNo = eProNo;
	}

	@Override
	public String toString() {
		return "EmployeeDTO [eNo=" + eNo + ", eName=" + eName + ", ePw=" + ePw + ", eLevel=" + eLevel + ", eLine="
				+ eLine + ", eProNo=" + eProNo + "]";
	}
	
	
	
	
	
}
