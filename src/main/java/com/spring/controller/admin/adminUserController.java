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
import com.spring.dto.userDTO;
import com.spring.service.userService;

@Controller
public class adminUserController {

private static final Logger logger = LoggerFactory.getLogger(adminUserController.class);
	
	@Autowired
	userService service;
	
	@RequestMapping(value = "/admin/user.do", method = RequestMethod.GET)
	public String user(Model model, userDTO dto, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		dto.setCurrentPage((currentPage-1) * 10);
		
		List<userDTO> list = service.userList(dto);
		int totalCount = service.userCount(dto);
		//System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paging", new paging(totalCount, currentPage, 10, dto.queryString()).getPage());
		
		return "admin/user";
	}
	
	@RequestMapping(value = "/admin/userInsert.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> userInsert(Model model, @RequestBody userDTO dto) {
		System.out.println(dto);
		service.insertUser(dto);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "입력완료");
		
		return map;
	}
	
	
	@RequestMapping(value = "/admin/userInfo.do", method = RequestMethod.GET)
	@ResponseBody  
	public userDTO userInfo(Model model, userDTO dto) {
		userDTO user = service.getUser(dto);
		
		return user;
	}
	
	@RequestMapping(value = "/admin/userUpdate.do", method = RequestMethod.PUT)
	@ResponseBody 
	public Map<String, String> userUpdate(Model model, @RequestBody userDTO dto) {
		logger.info("insert");
		service.updateUser(dto);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "수정완료");
		
		return map;
	}
	
	@RequestMapping(value = "/admin/userDelete.do", method = RequestMethod.DELETE)
	@ResponseBody 
	public Map<String, String> userDelete(Model model, @RequestBody String delIds) {
		String[] delData = delIds.split(",");
		service.deleteUser(delData);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "삭제완료");
		
		return map;
	}
}