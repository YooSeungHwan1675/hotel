package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.adminQuestionDTO;

@Mapper
public interface adminQuestionDAO {
	
	public int adminquestioncount(adminQuestionDTO dto);

	public List<adminQuestionDTO> adminquestionlist(adminQuestionDTO dto);

	public void deleteQuestion(String[] delData);

	public adminQuestionDTO getquestion(int idx);

	public void updatequestion(adminQuestionDTO dto);

	
}
