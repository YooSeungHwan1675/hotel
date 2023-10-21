package com.spring.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.statisticsDTO;
import com.spring.service.statisticsService;

@Controller
public class adminStatisticsController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminStatisticsController.class);
	
	@Autowired
	statisticsService service;
	
	@RequestMapping(value = "/admin/statistics.do", method = RequestMethod.GET)
	public String statistics(Model model) {
		
		return "admin/statistics";
	}
	
	@RequestMapping(value = "/admin/statisticsData.do", method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, List<statisticsDTO>> statisticsData(Model model) {
		List<statisticsDTO> month = service.monthStatistics();
		List<statisticsDTO> age = service.ageStatistics();
		List<statisticsDTO> room = service.roomStatistics();
		List<statisticsDTO> gender = service.genderStatistics();
		
		logger.info("month {}", month);
		logger.info("age {}", age);
		logger.info("room {}", room);
		logger.info("gender {}", gender);
		
		Map<String, List<statisticsDTO>> map = new HashMap<String, List<statisticsDTO>>();
		map.put("month", month);
		map.put("age", age);
		map.put("room", room);
		map.put("gender", gender);
		
		return map;
	}
	
}
