package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.userQuestionDAO;
import com.spring.dto.userQuestionDTO;


@Service
public class userQuestionService {
	@Autowired
	userQuestionDAO dao;

	public void questionInsert(userQuestionDTO dto) {
		System.out.println("서비스까지옴");
		dao.questionInsert(dto);
	}
	
	
}
