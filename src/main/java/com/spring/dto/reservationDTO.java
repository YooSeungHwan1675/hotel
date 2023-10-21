package com.spring.dto;

import java.util.Date;

public class reservationDTO {
     
      private int idx;
      private String room_choice;
      private Date start_date;
      private Date end_date;
      private String member_id;
      private String countpeople;
      private String reservation_status;
      private Date registration_date;
      private Date modification_date;
      private int currentPage;
      
      
      public reservationDTO() {    }

      


      public reservationDTO(int idx, String room_choice, Date start_date, Date end_date, String member_id,String countpeople, String reservation_status, Date registration_date, Date modification_date,
            int currentPage) {
         super();
         this.idx = idx;
         this.room_choice = room_choice;
         this.start_date = start_date;
         this.end_date = end_date;
         this.member_id = member_id;
         this.countpeople = countpeople;
         this.reservation_status = reservation_status;
         this.registration_date = registration_date;
         this.modification_date = modification_date;
         this.currentPage = currentPage;
      }

      public int getIdx() {
         return idx;
      }

      public void setIdx(int idx) {
         this.idx = idx;
      }

      public String getRoom_choice() {
         return room_choice;
      }

      public void setRoom_choice(String room_choice) {
         this.room_choice = room_choice;
      }

      public Date getStart_date() {
         return start_date;
      }

      public void setStart_date(Date start_date) {
         this.start_date = start_date;
      }

      public Date getEnd_date() {
         return end_date;
      }

      public void setEnd_date(Date end_date) {
         this.end_date = end_date;
      }

      public String getMember_id() {
         return member_id;
      }

      public void setMember_id(String member_id) {
         this.member_id = member_id;
      }

      public String getCountpeople() {
         return countpeople;
      }

      public void setCountpeople(String countpeople) {
         this.countpeople = countpeople;
      }

      public String getReservation_status() {
         return reservation_status;
      }

      public void setReservation_status(String reservation_status) {
         this.reservation_status = reservation_status;
      }

      public Date getRegistration_date() {
         return registration_date;
      }

      public void setRegistration_date(Date registration_date) {
         this.registration_date = registration_date;
      }

      public Date getModification_date() {
         return modification_date;
      }

      public void setModification_date(Date modification_date) {
    	  this.modification_date = modification_date;}
      public int getCurrentPage() {
         return currentPage;
      }

      public void setCurrentPage(int currentPage) {
         this.currentPage = currentPage;
      }


      @Override
      public String toString() {
         return "appointmentDTO [idx=" + idx + ", room_choice=" + room_choice + ", start_date=" + start_date
               + ", end_date=" + end_date + ", member_id=" + member_id + ", countpeople=" + countpeople
               + ", reservation_status=" + reservation_status + ", registration_date=" + registration_date
               + ", modification_date=" + modification_date + ", currentPage=" + currentPage + "]";
      }




      public String queryString() {
         StringBuilder sb = new StringBuilder();
         
         
         if (room_choice != null) {
            sb.append("&room_choice=" + room_choice);
         }
         
         if (member_id != null) {
            sb.append("&member_id=" + member_id);
         }
         
         if (reservation_status != null) {
            sb.append("&reservation_status=" + reservation_status);
         }
         
         return sb.toString();
      }




   }