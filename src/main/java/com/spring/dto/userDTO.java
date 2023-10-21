package com.spring.dto;

public class userDTO {
	
	private int idx;
	private String id;
	private String password;
	private String position;
	private String name;
	private String phone;
	private String email;
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
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		return "userDTO [idx=" + idx + ", id=" + id + ", password=" + password + ", position=" + position + ", name="
				+ name + ", phone=" + phone + ", email=" + email + ", currentPage=" + currentPage + "]";
	}

	public String queryString() {
        StringBuilder sb = new StringBuilder();
		// 사번 이름 휴대폰번호
		if (id != null) {
			sb.append("&id=" + id);
		}
		
		if (name != null) {
			sb.append("&name=" + name);
		}
		
		if (phone != null) {
			sb.append("&phone=" + phone);
		}


        return sb.toString();
    }
	
}
