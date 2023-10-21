package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.adminQuestionDAO;
import com.spring.dto.adminQuestionDTO;
import com.spring.dto.noticeDTO;

@Service
public class adminQuestionService {
	
	@Autowired
	adminQuestionDAO dao;

	public List<adminQuestionDTO> adminquestionlist(adminQuestionDTO dto) {
		List<adminQuestionDTO> adminquestionlist = dao.adminquestionlist(dto);
		return adminquestionlist;
	}

	public int adminquestioncount(adminQuestionDTO dto) {
		int adminquestioncount = dao.adminquestioncount(dto);
		return adminquestioncount;
	}

	public void deleteQuestion(String[] delData) {
//		System.out.println("서비스까진옴");
		dao.deleteQuestion(delData);
	}

	public adminQuestionDTO getquestion(int idx) {
//		System.out.println("서비스까진옴");
		adminQuestionDTO dto = dao.getquestion(idx);
		return dto;
	}

	public void updatequestion(adminQuestionDTO dto) {
//		System.out.println("업뎃 서비스");
		dao.updatequestion(dto);
	}

}
