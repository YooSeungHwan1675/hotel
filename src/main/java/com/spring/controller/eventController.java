package com.spring.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dto.eventDTO;
import com.spring.service.eventService;

@Controller
public class eventController {
	
	private static final Logger logger = LoggerFactory.getLogger(eventController.class);
	
	@Autowired
	eventService service;
	
	@RequestMapping(value = "/event.do", method = RequestMethod.GET)
	public String event(Model model, eventDTO dto) {
//		logger.info("이벤트 시작");
		
 	   	List<eventDTO> list = service.eventList(dto);
 	   	
 	   	model.addAttribute("list", list);
 	   	
		return "event";
	}
}
