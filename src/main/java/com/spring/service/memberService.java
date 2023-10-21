package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.memberDAO;
import com.spring.dto.memberDTO;


@Service
public class memberService {
	@Autowired
	memberDAO dao;
	
	public List<memberDTO> memberList(memberDTO dto) {
		List<memberDTO> memberList = dao.memberList(dto);
		return memberList;
	}
	
	public int memberCount(memberDTO dto) {
		
		int memberCount = dao.memberCount(dto);
		
		return memberCount;
	}
	
	public memberDTO getMember(memberDTO dto) {
		memberDTO user = dao.getMember(dto);
//		System.out.println("요까지옴"+dto);
		return user;
	}

	public void insertMember(memberDTO dto) {
		dao.insertMember(dto);
	}

	public void deleteMember(String[] delData) {
		dao.deleteMember(delData);
	}

	public void updateMember(memberDTO dto) {
		dao.updateMember(dto);
	}

	public void withdrawMember(memberDTO dto) {
		dao.withdrawMember(dto);
	}

	public memberDTO getLogin(memberDTO dto) {
		memberDTO user = dao.getLogin(dto);
		return user;
	}

	public boolean checkId(String id) {
	    int result = dao.registers(id);
	    return result > 0; // 0보다 크면 중복된 아이디
	}

	public void infoUpdate(memberDTO dto) {
		dao.infoUpdate(dto);

	}









}
