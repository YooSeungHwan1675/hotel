package com.spring.dto;

import java.sql.Date;

public class memberDTO {
	
	private int idx;
	private String id;
	private String name;
	private String password;
	private int postcode;
	private String jumin1;
	private String jumin2;
	private String addr1;
	private String addr2;
	private String email1;
	private String email2;
	private String phone;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
		return "memberDTO [idx=" + idx + ", id=" + id + ", name=" + name + ", password=" + password + ", postcode="
				+ postcode + ", jumin1=" + jumin1 + ", jumin2=" + jumin2 + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", email1=" + email1 + ", email2=" + email2 + ", phone=" + phone + ", useYN=" + useYN + ", regdate="
				+ regdate + ", updatedate=" + updatedate + ", currentPage=" + currentPage + "]";
	}
	
	public String queryString() {
		StringBuilder sb = new StringBuilder();
		
		if (id != null) {
			sb.append("&id=" + id);
		}
		
		if (name != null) {
			sb.append("&name=" + name);
		}
		
		if (phone != null) {
			sb.append("&phone=" + phone);
		}
		
		if (useYN != null) {
			sb.append("&useYN=" + useYN);
		}
		
		return sb.toString();
	}
}
