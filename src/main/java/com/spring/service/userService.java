package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.userDAO;
import com.spring.dto.userDTO;

@Service
public class userService {
	@Autowired
	userDAO dao;
	
	public List<userDTO> userList(userDTO dto) {
		List<userDTO> userList = dao.userList(dto);
		
		return userList;
	}	   

	public int userCount(userDTO dto) { 
		int userCount = dao.userCount(dto);
	  
		return userCount; 
	}
	  
	public userDTO getUser(userDTO dto) { 
		userDTO user = dao.getUser(dto);
	  
		return user; 
	}
	  
	
	public void insertUser(userDTO dto) {
		dao.insertUser(dto);
	}
	  
	public void deleteUser(String[] delData) { 
		dao.deleteUser(delData);
	}
	
	public void updateUser (userDTO dto) {
		dao.updateUser(dto);
	}
	// 이것도
	public void withdrawUser(userDTO dto) {
		dao.withdrawUser(dto);
	}

	public userDTO getLogin(userDTO dto) {
		userDTO user = dao.getLogin(dto);
		
		return user;
	}

	
	
}
