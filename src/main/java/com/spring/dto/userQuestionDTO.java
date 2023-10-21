package com.spring.dto;

import java.sql.Date;

public class userQuestionDTO {
	
	private int idx;
	private String type;
	private String title;
	private String contents;
	private String userid;
	private String answer;
	private Date regdate;
	private Date updatedate;
	
	public userQuestionDTO() { }

	public userQuestionDTO(int idx, String type, String title, String contents, String userid, String answer,
			Date regdate, Date updatedate) {
		super();
		this.idx = idx;
		this.type = type;
		this.title = title;
		this.contents = contents;
		this.userid = userid;
		this.answer = answer;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	@Override
	public String toString() {
		return "userQuestionDTO [idx=" + idx + ", type=" + type + ", title=" + title + ", contents=" + contents
				+ ", userid=" + userid + ", answer=" + answer + ", regdate=" + regdate + ", updatedate=" + updatedate
				+ "]";
	}

	
//	public String queryString() {
//		StringBuilder sb = new StringBuilder();
//		
//		
//		return sb.toString();
//	}

	
	
}
