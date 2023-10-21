package com.spring.dto;

import java.util.Date;

public class UserReservationDTO {
	
	
    private int idx;
    private String roomChoice;
    private Date startDate;
    private Date endDate;
    private String memberId;
    private int countPeople;
    private String reservation_status;
    private Date registrationDate;
    private Date modificationDate;
	
	
	public UserReservationDTO() { }


	public UserReservationDTO(int idx, String roomChoice, Date startDate, Date endDate, String memberId,
			int countPeople, String reservation_status, Date registrationDate, Date modificationDate) {
		super();
		this.idx = idx;
		this.roomChoice = roomChoice;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memberId = memberId;
		this.countPeople = countPeople;
		this.reservation_status = reservation_status;
		this.registrationDate = registrationDate;
		this.modificationDate = modificationDate;
	}


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public String getRoomChoice() {
		return roomChoice;
	}


	public void setRoomChoice(String roomChoice) {
		this.roomChoice = roomChoice;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getCountPeople() {
		return countPeople;
	}


	public void setCountPeople(int countPeople) {
		this.countPeople = countPeople;
	}


	public String getReservation_status() {
		return reservation_status;
	}


	public void setReservation_status(String reservation_status) {
		this.reservation_status = reservation_status;
	}


	public Date getRegistrationDate() {
		return registrationDate;
	}


	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}


	public Date getModificationDate() {
		return modificationDate;
	}


	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}


	@Override
	public String toString() {
		return "UserReservationDTO [idx=" + idx + ", roomChoice=" + roomChoice + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", memberId=" + memberId + ", countPeople=" + countPeople
				+ ", reservation_status=" + reservation_status + ", registrationDate=" + registrationDate
				+ ", modificationDate=" + modificationDate + "]";
	}


	
}
