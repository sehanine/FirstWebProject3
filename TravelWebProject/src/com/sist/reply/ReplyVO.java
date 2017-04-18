package com.sist.reply;

import java.util.*;

/*
fesno
reply_ID
reply_name
reply_pass
reply_regdate
reply_comment

 */
public class ReplyVO {
	
	private int fesno;
	private int reply_ID;
	private String reply_name;
	private String reply_pass;
	private Date reply_regdate;
	private String reply_comment;
	private String email;
	private String title;
	private String cal;
	
	public String getCal() {
		return cal;
	}
	public void setCal(String cal) {
		this.cal = cal;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getFesno() {
		return fesno;
	}
	public void setFesno(int fesno) {
		this.fesno = fesno;
	}
	public int getReply_ID() {
		return reply_ID;
	}
	public void setReply_ID(int reply_ID) {
		this.reply_ID = reply_ID;
	}
	public String getReply_name() {
		return reply_name;
	}
	public void setReply_name(String reply_name) {
		this.reply_name = reply_name;
	}
	public String getReply_pass() {
		return reply_pass;
	}
	public void setReply_pass(String reply_pass) {
		this.reply_pass = reply_pass;
	}
	public Date getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	public String getReply_comment() {
		return reply_comment;
	}
	public void setReply_comment(String reply_comment) {
		this.reply_comment = reply_comment;
	}
	
}
