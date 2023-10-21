package com.spring.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dto.noticeDTO;
import com.spring.service.noticeService;

@Controller
public class noticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(noticeController.class);
	
	@Autowired
	noticeService service;
	
	
	@RequestMapping(value = "/notice.do", method = RequestMethod.GET)
	public String notice(Model model, noticeDTO dto) {
//		logger.info("공지 시작");
		
		List<noticeDTO> list = service.noticeList(dto);
	
		model.addAttribute("list", list);
		
	
	return "notice";
	}
	
}
