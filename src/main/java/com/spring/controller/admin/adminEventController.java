package com.spring.controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;

import com.spring.common.paging;
import com.spring.dto.eventDTO;
import com.spring.service.eventService;

@Controller
public class adminEventController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminEventController.class);
	
	@Autowired
	eventService service;
	
	@RequestMapping(value = "/admin/event.do", method = RequestMethod.GET)
	public String event(Model model, eventDTO dto, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		dto.setCurrentPage((currentPage-1) * 10);
		
		List<eventDTO> list = service.eventList(dto);
		int totalCount = service.eventCount(dto);
		//System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paging", new paging(totalCount, currentPage, 10, dto.queryString()).getPage());
		
		return "admin/event";
	}
	
	@RequestMapping(value = "/admin/eventInsert.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> eventInsert(Model model, eventDTO dto, MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss", new Locale("KOREAN", "KOREA"));
		
		String fileNM = sdf.format(date) + "_" + file.getOriginalFilename();
		String root_path = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/upload/");
		file.transferTo(new File(root_path + fileNM));
		//file.transferTo(new File(root_path + "/WEB-INF/resources/upload/" + fileNM));
		//file.transferTo(new File("C:/test/upload/" + fileNM));

		dto.setFilename(fileNM);
		service.insertEvent(dto);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "입력완료");
		
		return map;
	}
	
	@RequestMapping(value = "/admin/eventDelete.do", method = RequestMethod.DELETE)
	@ResponseBody 
	public Map<String, String> eventDelete(Model model, @RequestBody String delIds) {
		String[] delData = delIds.split(",");
		service.deleteEvent(delData);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "삭제완료");
		
		return map;
	}
}
