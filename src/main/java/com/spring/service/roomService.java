package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.roomDAO;
import com.spring.dto.roomDTO;


@Service
public class roomService {
	@Autowired
	roomDAO dao;
	
	public List<roomDTO> roomList(roomDTO dto) {
		List<roomDTO> roomList = dao.roomList(dto);
		return roomList;
	}
	
	public int roomCount(roomDTO dto) {
		
		int roomCount = dao.roomCount(dto);
		
		return roomCount;
	}
	
	public roomDTO getroom(roomDTO dto) {
		roomDTO user = dao.getroom(dto);
		
		return user;
	}

	public void insertroom(roomDTO dto) {
		dao.insertroom(dto);
	}

	public void deleteroom(String[] delData) {
//		System.out.println("삭제 체크");
		dao.deleteroom(delData);
	}

	public void updateroom(roomDTO dto) {
//		System.out.println("서비스 수정");

		dao.updateroom(dto);
	}


}
