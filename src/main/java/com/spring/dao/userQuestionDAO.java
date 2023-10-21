package com.spring.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.userQuestionDTO;

@Mapper
public interface userQuestionDAO {

	void questionInsert(userQuestionDTO dto);

}
