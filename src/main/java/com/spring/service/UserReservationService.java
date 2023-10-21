package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.UserReservationDAO;
import com.spring.dao.noticeDAO;
import com.spring.dto.UserReservationDTO;

@Service
public class UserReservationService {

	@Autowired
	UserReservationDAO dao;

	public void userreservationInsert(UserReservationDTO dto) {
			System.out.println("서비스 까지 넘어옴");
			System.out.println(dto);
			dao.userreservationInsert(dto);
	}

	
}
