package com.sist.dao;
import java.util.*;
public class ReplyVO {
    private int no,fno;
    private String id,name,msg,dbday;
    private Date regdate; // SELECT regdate => 자바에서 입력된 시간 처리가 안된다 => 오라클에서 시간 읽기 
    // TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') => 시간(1.댓글 , 2.공지사항)
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	  
}
