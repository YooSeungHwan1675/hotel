package com.spring.dto;

import java.util.Date;

public class noticeDTO {
	
	private int idx;
	private String name;
	private String subject;
	private String context;
	private Date writedate;
	private Date rewrite;
	private int hit;
	private int currentPage;
	
	
	public noticeDTO() { 	}


	public noticeDTO(int idx, String name, String subject, String context, Date writedate, Date rewrite, int hit,
			int currentPage) {
		super();
		this.idx = idx;
		this.name = name;
		this.subject = subject;
		this.context = context;
		this.writedate = writedate;
		this.rewrite = rewrite;
		this.hit = hit;
		this.currentPage = currentPage;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}


	public Date getRewrite() {
		return rewrite;
	}

	public void setRewrite(Date rewrite) {
		this.rewrite = rewrite;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	@Override
	public String toString() {
		return "adminNoticeDTO [idx=" + idx + ", name=" + name + ", subject=" + subject + ", context=" + context
				+ ", writedate=" + writedate + ", rewrite=" + rewrite + ", hit=" + hit + ", currentPage=" + currentPage
				+ "]";
	}
	
	

	public String queryString() {
		StringBuilder sb = new StringBuilder();
		
		
		if (name != null) {
			sb.append("&name=" + name);
		}
		
		if (subject != null) {
			sb.append("&subject=" + subject);
		}
		
		return sb.toString();
	}


	
}
