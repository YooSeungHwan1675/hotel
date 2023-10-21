package com.spring.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.paging;
import com.spring.dto.adminQuestionDTO;
import com.spring.dto.noticeDTO;
import com.spring.service.adminQuestionService;

@Controller
public class adminQuestionController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminNoticeController.class);
	
	@Autowired
	adminQuestionService service;
	
	@RequestMapping(value = "/admin/question.do", method = RequestMethod.GET)
	public String question(Model model, adminQuestionDTO dto, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		dto.setCurrentPage((currentPage-1) * 10);
		
		List<adminQuestionDTO> list = service.adminquestionlist(dto);
		int totalCount = service.adminquestioncount(dto);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paging", new paging(totalCount, currentPage, 10, dto.queryString()).getPage());
		return "admin/question";
	}
	
	@RequestMapping(value = "/getquestion.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getquestion(@RequestParam("idx") int idx) {
//		System.out.println("글번호? " + idx);
		adminQuestionDTO question = service.getquestion(idx);
		Map<String, Object> response = new HashMap<String, Object>();
		
		if (question != null) {
	        response.put("result", "success");
	        response.put("userid", question.getUserid());
	        response.put("name", question.getName());
	        response.put("phone", question.getPhone());
	        response.put("email", question.getEmail()); // 추가 데이터
	        response.put("title", question.getTitle());
	        response.put("contents", question.getContents());
	        response.put("answer", question.getAnswer());
	        response.put("type", question.getType());
	        
	        return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	    } else {
	        response.put("result", "error");
	        response.put("message", "Notice not found");
	        return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
	    }
	}

//		updatequestion
	
	@RequestMapping(value = "/admin/updatequestion.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updatequestion(@RequestBody adminQuestionDTO dto) {
		System.out.println(dto);
		
//		이메일 데이터가 안넘어와서 답변하기 클릭시 이메일 정보가 수정이안되는상황
	    service.updatequestion(dto);

	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("result", "success");
	    map.put("message", "수정완료");

	    return map;
	}	
	
	
		
	
//	삭제 잘됨
	@RequestMapping(value = "/admin/deleteQuest.do", method = RequestMethod.DELETE)
	@ResponseBody 
	public Map<String, String> deleteQuest(Model model, @RequestBody String delIds) {
//		System.out.println("여까진옴");
		String[] delData = delIds.split(",");
		service.deleteQuestion(delData);
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "삭제완료");
		return map;
	}
	
	
}
