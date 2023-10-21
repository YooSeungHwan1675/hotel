package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.statisticsDTO;


@Mapper
public interface statisticsDAO {
	public List<statisticsDTO> monthStatistics();
	
	public List<statisticsDTO> ageStatistics();

	public List<statisticsDTO> roomStatistics();

	public List<statisticsDTO> genderStatistics();

	
}
