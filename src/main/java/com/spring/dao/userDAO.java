package com.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.userDTO;


@Mapper
public interface userDAO {
	
	public ArrayList<userDTO> userList(userDTO dto);
	
	public int userCount(userDTO dto);
	
	public userDTO getUser(userDTO dto);

	public void insertUser(userDTO dto);

	public void deleteUser(String[] delData);

	public void updateUser(userDTO dto);

	public void withdrawUser(userDTO dto);

	public userDTO getLogin(userDTO dto);
	
}
