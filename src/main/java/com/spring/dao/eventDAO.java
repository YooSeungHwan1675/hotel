package com.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.eventDTO;


@Mapper
public interface eventDAO {
	
	public ArrayList<eventDTO> eventList(eventDTO dto);
	
	public int eventCount(eventDTO dto);

	public void insertEvent(eventDTO dto);

	public void deleteEvent(String[] delData);

}
