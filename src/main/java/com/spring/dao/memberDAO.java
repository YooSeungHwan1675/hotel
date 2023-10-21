package com.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.memberDTO;

@Mapper
public interface memberDAO {
	
	public ArrayList<memberDTO> memberList(memberDTO dto);
	
	public int memberCount(memberDTO dto);

	public memberDTO getMember(memberDTO dto);
	
	public void insertMember(memberDTO dto);

	public void deleteMember(String[] delData);

	public void updateMember(memberDTO dto);

	public void withdrawMember(memberDTO dto);

	public memberDTO getLogin(memberDTO dto);

	public int registers(String id);

	public void infoUpdate(memberDTO dto);

}
