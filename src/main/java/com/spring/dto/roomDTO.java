package com.spring.dto;

import java.sql.Date;

public class roomDTO {

    private int idx;
    private String roomno;
    private String type;
    private String size;
    private String capacity;
    private String price;
    private String number;
	private Date regdate;
	private Date updatedate;
	
	private int currentPage;

    public roomDTO() {
    }

    public roomDTO(int idx, String roomno, String type, String size, String capacity, String price, String number, Date regdate, Date updatedate) {
        this.idx = idx;
        this.type = type;
        this.size = size;
        this.capacity = capacity;
        this.price = price;
        this.number = number;
		this.updatedate = updatedate;
		this.regdate = regdate;
        
    }

   

    public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getRoomno() {
		return roomno;
	}

	public void setRoomno(String roomno) {
		this.roomno = roomno;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
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
		return "roomDTO [idx=" + idx + ", roomno=" + roomno + ", type=" + type + ", size=" + size + ", capacity="
				+ capacity + ", price=" + price + ", number=" + number + ", regdate=" + regdate + ", updatedate="
				+ updatedate + ", currentPage=" + currentPage + "]";
	}

	public String queryString() {
        StringBuilder sb = new StringBuilder();

        if (roomno != null) {
            sb.append("&roomno=" + roomno);
        }
        if (type != null) {
            sb.append("&type=" + type);
        }
        if (capacity != null) {
            sb.append("&capacity=" + capacity);
        }
        if (price != null) {
            sb.append("&price=" + price);
        }


        return sb.toString();
    }

}
