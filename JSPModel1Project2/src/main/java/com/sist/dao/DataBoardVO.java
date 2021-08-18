package com.sist.dao;
/*
 *   NO       NOT NULL NUMBER         
	NAME     NOT NULL VARCHAR2(34)   
	SUBJECT  NOT NULL VARCHAR2(2000) 
	CONTENT  NOT NULL CLOB           
	PWD      NOT NULL VARCHAR2(10)   
	REGDATE           DATE           
	HIT               NUMBER         
	FILENAME          VARCHAR2(260)  
	FILESIZE          NUMBER  
 */
import java.util.*;
// JSP ==> 자바빈 (데이터를 읽기/쓰기) => 데이터를 모아서 한번에 브라우저로 전송 목적 (보안 => 캡슐화 방식)
// 캡슐화 => 변수(은닉화)=private,메소드를 통해서 접근=>public  
public class DataBoardVO {
	/*
	 *   1. 시큐어 코딩 (의무화)
	 *      ================
	 *      1) 모든 변수는 private : 캡슐화 
	 *      2) 데이터베이스 : URL,Username,Password=> 노출 방지 (db,jar) => DBCP,MyBatis
	 *         => column명,table명 => 노출하지 않는다 
	 */
    private int no,hit,filesize;
    private String name,subject,content,pwd,filename;
    private Date regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
  
  
}
