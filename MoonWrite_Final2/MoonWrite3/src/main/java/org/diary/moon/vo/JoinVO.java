package org.diary.moon.vo;

public class JoinVO {
	
	private String id;
	private String nick_name;
	private String pass;
	private String pass_chk;
	private String email;
	private String address;
	
	private String id_check;
	private String name_check;

	
	public JoinVO() {	}
	public JoinVO(String id, String nick_name, String pass, String pass_chk, String email, String address,
			String id_check, String name_check) {
		super();
		this.id = id;
		this.nick_name = nick_name;
		this.pass = pass;
		this.pass_chk = pass_chk;
		this.email = email;
		this.address = address;
		this.id_check = id_check;
		this.name_check = name_check;
	}



	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getNick_name() {
		return nick_name;
	}


	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getPass_chk() {
		return pass_chk;
	}


	public void setPass_chk(String pass_chk) {
		this.pass_chk = pass_chk;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getId_check() {
		return id_check;
	}


	public void setId_check(String id_check) {
		this.id_check = id_check;
	}


	public String getName_check() {
		return name_check;
	}


	public void setName_check(String name_check) {
		this.name_check = name_check;
	}
	@Override
	public String toString() {
		return "JoinVO [id=" + id + ", nick_name=" + nick_name + ", pass=" + pass + ", pass_chk=" + pass_chk
				+ ", email=" + email + ", address=" + address + ", id_check=" + id_check + ", name_check=" + name_check
				+ "]";
	}
	
	
	
}