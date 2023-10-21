package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.eventDAO;
import com.spring.dto.eventDTO;

@Service
public class eventService {
	@Autowired
	eventDAO dao;
	
	public List<eventDTO> eventList(eventDTO dto) {
		List<eventDTO> eventList = dao.eventList(dto);
		
		return eventList;
	}
	
	public int eventCount(eventDTO dto) {
		int memberCount = dao.eventCount(dto);
		
		return memberCount;
	}
	
	public void insertEvent(eventDTO dto) {
		dao.insertEvent(dto);
	}

	public void deleteEvent(String[] delData) {
		dao.deleteEvent(delData);
	}

}
