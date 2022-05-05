package org.diary.moon.dto;

import org.apache.ibatis.type.Alias;

@Alias("members")
public class MemberDTO {
	
	private String m_id;
	private String m_pw;
	private String email;
	private String m_name;
	private String m_level;
	
	
	public MemberDTO() {	}
	//회원가입시 사용하는 생성자
	public MemberDTO(String m_id, String m_pw, String email, String m_name, String m_level) {
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.email = email;
		this.m_name = m_name;
		this.m_level = m_level;
	}
	
	//회원정보 수정시 사용하는 생성자	
	public MemberDTO(String m_id, String m_pw, String m_name) {
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
	}
	//아이디 찾을 때 사용하는 생성자
	public MemberDTO(String email) {
		this.email = email;
	}
	//비밀번호 찾을 때 사용하는 생성자
	public MemberDTO(String m_id, String email) {
		this.m_id = m_id;
		this.email = email;
	}
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_level() {
		return m_level;
	}
	public void setM_level(String m_level) {
		this.m_level = m_level;
	}
	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_pw=" + m_pw + ", email=" + email + ", m_name=" + m_name + ", m_level="
				+ m_level + "]";
	}
	
	
	
	
	
}
