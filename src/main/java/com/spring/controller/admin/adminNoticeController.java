package com.spring.controller.admin;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.spring.common.paging;
import com.spring.dto.memberDTO;
import com.spring.dto.noticeDTO;
import com.spring.service.noticeService;

@Controller
public class adminNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminNoticeController.class);
	
	@Autowired
	noticeService service;
	
	
//	보여주기 잘됨
	@RequestMapping(value = "/admin/notice.do", method = RequestMethod.GET)
	public String notice(Model model, noticeDTO dto, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		dto.setCurrentPage((currentPage-1) * 10);
		
		List<noticeDTO> list = service.noticeList(dto);
		int totalCount = service.noticeCount(dto);
		//System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paging", new paging(totalCount, currentPage, 10, dto.queryString()).getPage());
		
		return "admin/notice";
	}
	
	// 삽입 잘됨
	@RequestMapping(value = "/admin/noticeInsert.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> noticeInsert(Model model, noticeDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
//		System.out.println("삽입 컨트롤까진옴");
		System.out.println(dto);
		
		service.insertNotice(dto);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "입력완료");
		
		return map;
	}
	
	
	@RequestMapping(value = "/getNotice.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> noticeSelect(@RequestParam("idx") int idx) {
	    System.out.println("글번호? " + idx);

	    noticeDTO notice = service.getNotice(idx);
	    Map<String, Object> response = new HashMap<String, Object>();

	    if (notice != null) {
	        response.put("result", "success");
	        response.put("name", notice.getName());
	        response.put("subject", notice.getSubject());
	        response.put("context", notice.getContext());
	        return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	    } else {
	        response.put("result", "error");
	        response.put("message", "Notice not found");
	        return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
	    }
	}

	
	

	@RequestMapping(value = "/admin/noticeUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeUpdate(@RequestBody noticeDTO dto) {
	    System.out.println("수정업뎃까지옴");
	    service.noticeUpdate(dto);

	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("result", "success");
	    map.put("message", "수정완료");

	    return map;
	}





	
//	삭제 잘됨
	@RequestMapping(value = "/admin/noticeDelete.do", method = RequestMethod.DELETE)
	@ResponseBody 
	public Map<String, String> noticeDelete(Model model, @RequestBody String delIds) {
//		System.out.println("여까진옴");
		String[] delData = delIds.split(",");
		service.deleteNotice(delData);
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "삭제완료");
		
		return map;
	}
	
}
