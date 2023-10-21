package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.roomDTO;

@Mapper
public interface roomDAO {
	
	
	public int roomCount(roomDTO dto);
	public List<roomDTO> roomList(roomDTO dto);
	
	
	public void insertroom(roomDTO dto);
	public void deleteroom(String[] delData);
	
	public roomDTO getroom(roomDTO dto);
	

	
	public void updateroom(roomDTO dto); 
	
	public void roomUpdate(roomDTO dto);
}
