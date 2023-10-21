package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.noticeDTO;

@Mapper
public interface noticeDAO {

	public void insertNotice(noticeDTO dto);
	
	public List<noticeDTO> noticeList(noticeDTO dto);
	
	public void deleteNotice(String[] delData);
	
	public int noticeCount(noticeDTO dto);
	
	public noticeDTO getNotice(int idx);
	
//	public void updateNotice(noticeDTO notice); 
	
	public void noticeUpdate(noticeDTO dto);
}
