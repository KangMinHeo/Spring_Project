package org.diary.moon.dto;

import org.apache.ibatis.type.Alias;

@Alias("comment")
public class CommentDTO {
	
	private int cno;
	private int bno;
	private String c_writer;
	private String c_content;
	private String m_name;
	
	
public CommentDTO() {	}


//다 받는 생성자
public CommentDTO(int cno, int bno, String c_writer, String c_content, String m_name) {
	this.cno = cno;
	this.bno = bno;
	this.c_writer = c_writer;
	this.c_content = c_content;
	this.m_name = m_name;
}

//cno 없는 생성자
public CommentDTO(int bno, String c_writer, String c_content, String m_name) {
	this.bno = bno;
	this.c_writer = c_writer;
	this.c_content = c_content;
	this.m_name = m_name;
}

//m_name 없는 생성자

public CommentDTO(int bno, String c_writer, String c_content) {
	this.bno = bno;
	this.c_writer = c_writer;
	this.c_content = c_content;
}



public int getCno() {
	return cno;
}

public void setCno(int cno) {
	this.cno = cno;
}


public int getBno() {
	return bno;
}


public void setBno(int bno) {
	this.bno = bno;
}


public String getC_writer() {
	return c_writer;
}


public void setC_writer(String c_writer) {
	this.c_writer = c_writer;
}


public String getC_content() {
	return c_content;
}


public void setC_content(String c_content) {
	this.c_content = c_content;
}


public String getM_name() {
	return m_name;
}


public void setM_name(String m_name) {
	this.m_name = m_name;
}


@Override
public String toString() {
	return "CommentDTO [cno=" + cno + ", bno=" + bno + ", c_writer=" + c_writer + ", c_content=" + c_content
			+ ", m_name=" + m_name + "]";
}



}