package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.statisticsDAO;
import com.spring.dto.statisticsDTO;


@Service
public class statisticsService {
	@Autowired
	statisticsDAO dao;
	
	public List<statisticsDTO> monthStatistics() {
		List<statisticsDTO> ageList = dao.monthStatistics();
		
		return ageList;
	}
	
	public List<statisticsDTO> ageStatistics() {
		List<statisticsDTO> ageList = dao.ageStatistics();
		
		return ageList;
	}

	public List<statisticsDTO> roomStatistics() {
		List<statisticsDTO> roomList = dao.roomStatistics();
		
		return roomList;
	}

	public List<statisticsDTO> genderStatistics() {
		List<statisticsDTO> genderList = dao.genderStatistics();
		
		return genderList;
	}

}
