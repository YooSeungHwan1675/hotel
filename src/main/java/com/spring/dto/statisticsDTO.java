package com.spring.dto;

public class statisticsDTO {
	
	private String name;
	private int count;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "statisticsDTO [name=" + name + ", count=" + count + "]";
	}
}
