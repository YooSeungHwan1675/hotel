package com.spring.dto;

import java.sql.Date;

public class eventDTO {
	
	private int idx;
	private String title;
	private String content;
	private String filename;
	private String url;
	private String useYN;
	private Date regdate;
	private Date updatedate;
	
	private int currentPage;
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUseYN() {
		return useYN;
	}

	public void setUseYN(String useYN) {
		this.useYN = useYN;
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		return "eventDTO [idx=" + idx + ", title=" + title + ", content=" + content + ", filename=" + filename
				+ ", url=" + url + ", useYN=" + useYN + ", regdate=" + regdate + ", updatedate=" + updatedate
				+ ", currentPage=" + currentPage + "]";
	}

	public String queryString() {
		StringBuilder sb = new StringBuilder();
		
		if (title != null) {
			sb.append("&title=" + title);
		}
		
		if (content != null) {
			sb.append("&content=" + content);
		}
		
		if (url != null) {
			sb.append("&useYN=" + url);
		}
		
		return sb.toString();
	}
}
