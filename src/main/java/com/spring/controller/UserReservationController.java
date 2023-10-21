package com.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.paging;
import com.spring.dto.UserReservationDTO;
import com.spring.dto.noticeDTO;
import com.spring.dto.roomDTO;
import com.spring.service.noticeService;
import com.spring.service.roomService;
import com.spring.service.UserReservationService;

@Controller
public class UserReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserReservationController.class);
	
	@Autowired
	UserReservationService service;
	@Autowired
	roomService service2;
	
	
	@RequestMapping(value = "/reservation.do", method = RequestMethod.GET) 
	public String reservation(Model model, roomDTO dto, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		dto.setCurrentPage((currentPage-1) * 10);
		List<roomDTO> list = service2.roomList(dto);
		int totalCount = service2.roomCount(dto);
//		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paging", new paging(totalCount, currentPage, 10, dto.queryString()).getPage());
		
		return "reservation";
	}
	
	@RequestMapping(value = "/userreservationInsert.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> userreservationInsert(Model model, UserReservationDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println("컨트롤러까지 정보넘어옴");
		System.out.println(dto);
		service.userreservationInsert(dto);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "입력완료");
		
		return map;
	}
	
	
	
}

