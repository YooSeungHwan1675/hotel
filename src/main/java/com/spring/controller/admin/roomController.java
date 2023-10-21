package com.spring.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.paging;
import com.spring.dto.roomDTO;
import com.spring.service.roomService;

@Controller
public class roomController {
	
	private static final Logger logger = LoggerFactory.getLogger(roomController.class);
	
	@Autowired
	roomService service;
	
//	보여주기 잘됨
	@RequestMapping(value = "/admin/room.do", method = RequestMethod.GET)
	public String room(Model model, roomDTO dto, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		dto.setCurrentPage((currentPage-1) * 10);
		
		List<roomDTO> list = service.roomList(dto);
		int totalCount = service.roomCount(dto);
//		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paging", new paging(totalCount, currentPage, 10, dto.queryString()).getPage());
		
		return "admin/room";
	}

//	불러오기는 됨.
	
	@RequestMapping(value = "/admin/getroom.do", method = RequestMethod.GET)
	@ResponseBody  
	public roomDTO getroom(Model model, roomDTO dto) {
		System.out.println("컨트롤러 getroom");

		System.out.println(dto);

		roomDTO room = service.getroom(dto);
		
		return room;
	}	
	
	//삽입
	@RequestMapping(value = "/admin/insertroom.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> insertroom(Model model, @RequestBody roomDTO dto) {
		System.out.println("컨트롤러 insert");

		service.insertroom(dto);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "입력완료");
		
		return map;
	}	
	@RequestMapping(value = "/admin/updateroom.do", method = RequestMethod.PUT)
	@ResponseBody 
	public Map<String, String> updateroom(Model model, @RequestBody roomDTO dto) {
		System.out.println("컨트롤러 수정");
		System.out.println(dto);
		service.updateroom(dto);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "수정완료");
		
		return map;
	}
	
	@RequestMapping(value = "/admin/deleteroom.do", method = RequestMethod.DELETE)
	@ResponseBody 
	public Map<String, String> deleteroom(Model model, @RequestBody String delIds) {
		System.out.println("삭제 체크");
		String[] delData = delIds.split(",");
		service.deleteroom(delData);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "삭제완료");
		
		return map;
	}


}	

