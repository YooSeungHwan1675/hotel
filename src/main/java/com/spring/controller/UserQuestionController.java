package com.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.userQuestionDTO;
import com.spring.service.userQuestionService;

@Controller
public class UserQuestionController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserQuestionController.class);

	@Autowired
	userQuestionService service;
	
	@RequestMapping("/question.do")
	public String question(HttpServletRequest request, Model model) {
		return "question"; 
	}
	
	@RequestMapping(value = "/questionInsert.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> questionInsert(Model model, userQuestionDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(dto);
		
		service.questionInsert(dto);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "입력완료");
		return map;
	}
	
	
	
}
