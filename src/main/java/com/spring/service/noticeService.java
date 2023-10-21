package com.spring.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.noticeDAO;
import com.spring.dto.noticeDTO;

@Service
public class noticeService {
	@Autowired
	noticeDAO dao;
	
	public void insertNotice(noticeDTO dto) {
		dao.insertNotice(dto);
	}
		
	public List<noticeDTO> noticeList(noticeDTO dto) {
		List<noticeDTO> noticeList = dao.noticeList(dto);
		
		return noticeList;
	}	
	
	public void deleteNotice(String[] delData) {
		dao.deleteNotice(delData);
	}
		
	public int noticeCount(noticeDTO dto) {
		int noticeCount = dao.noticeCount(dto);
		return noticeCount;
	}
	
	public noticeDTO getNotice(int idx) {
		noticeDTO dto = dao.getNotice(idx);
		return dto;
	}

	public void noticeUpdate(noticeDTO dto) {
		System.out.println("업뎃 서비스");
		dao.noticeUpdate(dto);
	}
		
}
